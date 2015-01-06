package lt.vu.mif.ps5.kupra.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.RecipeImage;
import lt.vu.mif.ps5.kupra.entity.Role;
import lt.vu.mif.ps5.kupra.entity.User;
import lt.vu.mif.ps5.kupra.form.UserForm;
import lt.vu.mif.ps5.kupra.service.UserService;

import org.apache.log4j.Logger;
import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

	static Logger log = Logger.getLogger(UserController.class.getName());

	private final UserService userService;

	@Autowired
	public UserController(UserService userService) {
		this.userService = userService;
	}

	@ModelAttribute("user")
	public User createUserModel() {
		return new User();
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public ModelAndView userCreate(
			@Valid @ModelAttribute("user") UserForm userForm,
			BindingResult result) {
		if (result.hasErrors()) {
			// log.info("Returning account.jsp page");
			return new ModelAndView("user");
		}

		if ((userForm.getRole() == Role.ROLE_ADMIN)
				|| (userForm.getRole() == Role.ROLE_USER)) {
			if (!userService.hasRole("ROLE_ADMIN")
					&& !userService.hasRole("ROLE_MANAGER")) {
				return new ModelAndView("user");
			}
		}

		long userId = userService.addUser(userForm.getLoginname(),
				userForm.getUsername(), userForm.getPassword(),
				userForm.getEmail(), userForm.getName(),
				userForm.getLastname(), userForm.getAddress(),
				userForm.getRole());

		return new ModelAndView("redirect:user/{" + userId + "}");
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/user/{id}/edit", method = RequestMethod.GET)
	public ModelAndView userModify(@PathVariable long id) {
		User user = userService.getUser(id);

		if (user.getName() != userService.getUsername()) {
			// Grazinti access denied page
			return new ModelAndView("");
		}

		return new ModelAndView("edit").addObject("user", user);
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/user/edit", method = RequestMethod.POST)
	public ModelAndView userDoModify(@Valid @ModelAttribute("user") User user,
			BindingResult result) {
		if (result.hasErrors()) {
			// log.info("Returning account.jsp page");
			return new ModelAndView("user");
		}

		userService.updateUser(user.getUserId(), user.getLoginname(),
				user.getUsername(), user.getPassword(), user.getEmail(),
				user.getName(), user.getLastname(), user.getAddress(),
				user.getDescription(), user.getImgName(), user.getImgType(),
				user.getImg(), user.getRole());

		return new ModelAndView("redirect:user/{" + user.getUserId() + "}");
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/profile/{id}", method = RequestMethod.GET)
	public ModelAndView showProfile(@PathVariable long id) {
		User user = userService.getUser(id);
		
		Set<Recipe> recipes = user.getRecipies();
		
		
		return new ModelAndView("friend-recipes").addObject("friendRecipes", recipes).addObject("user", user);
	}
	
	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/profile/{id}/image", method = RequestMethod.GET)
	public ModelAndView userAvatar(@PathVariable long id, HttpServletResponse response) {
		User user = userService.getUser(id);
		
		try {
			if(user.getImg() != null) {
				response.setHeader("Content-Disposition", "inline;filename=\"" + user.getImgName() + "\"");
				OutputStream out = response.getOutputStream();
				response.setContentType(user.getImgType());
				int width = 150, height = 150;
				BufferedImage buffimage = ImageIO.read(user.getImg().getBinaryStream());
				BufferedImage thumbnail = Scalr.resize(buffimage, Scalr.Method.SPEED, Scalr.Mode.FIT_TO_HEIGHT, width, height, Scalr.OP_ANTIALIAS);
				ImageIO.write(thumbnail, "jpg", out);
				out.flush();
				out.close();
			} else {
				/*RecipeImage image = userService.getDefaultImage();
				response.setHeader("Content-Disposition", "inline;filename=\"" + image.getImgName() + "\"");
				OutputStream out = response.getOutputStream();
				response.setContentType(image.getImgType());
				int width = 150, height = 150;
				BufferedImage bufimage = ImageIO.read(image.getImg().getBinaryStream());
				BufferedImage thumbnail = Scalr.resize(bufimage,
						Scalr.Method.SPEED, Scalr.Mode.FIT_TO_HEIGHT, width,
						height, Scalr.OP_ANTIALIAS);
				ImageIO.write(thumbnail, "jpg", out);
				out.flush();
				out.close();*/
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
