package lt.vu.mif.ps5.kupra.controller;
import lt.vu.mif.ps5.kupra.controller.CM;














import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.logging.Logger;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;
import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.imgscalr.Scalr;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.RecipeImage;
import lt.vu.mif.ps5.kupra.entity.Role;
import lt.vu.mif.ps5.kupra.entity.User;
import lt.vu.mif.ps5.kupra.form.UserForm;
import lt.vu.mif.ps5.kupra.service.RecipeService;
import lt.vu.mif.ps5.kupra.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;

@Controller
public class HomeController {

	static Logger log = Logger.getLogger(HomeController.class.getName());

	private final RecipeService recipeService;
	private final UserService userService;

	@Autowired
	public HomeController(RecipeService recipeService, UserService userService) {
		this.recipeService = recipeService;
		this.userService = userService;
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = CM.HOME_PAGE, method = RequestMethod.GET)
	public ModelAndView homePage() {
		List<Recipe> topRecipes = recipeService.getTopRecipes();
		return new ModelAndView("home").addObject("topRecipes", topRecipes);
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/profile/image", method = RequestMethod.GET)
	public ModelAndView getProfileImage(HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());
		try {
			if (user.getImg() != null) {
				System.out.println("Rado paveiksliuka");
				response.setHeader("Content-Disposition", "inline;filename=\""
						+ user.getImgName() + "\"");
				OutputStream out = response.getOutputStream();
				response.setContentType(user.getImgType());
				int width = 150, height = 150;
				BufferedImage bufimage = ImageIO.read(user.getImg()
						.getBinaryStream());

				BufferedImage thumbnail = Scalr.resize(bufimage,
						Scalr.Method.SPEED, Scalr.Mode.FIT_TO_HEIGHT, width,
						height, Scalr.OP_ANTIALIAS);
				ImageIO.write(thumbnail, "jpg", out);
				out.flush();
				out.close();
			} else {
				/*System.out.println("NERado paveiksliuka");
				RecipeImage image = recipeService.getDefaultImage();
				response.setHeader("Content-Disposition", "inline;filename=\""
						+ image.getImgName() + "\"");
				OutputStream out = response.getOutputStream();
				response.setContentType(image.getImgType());
				int width = 150, height = 150;
				BufferedImage bufimage = ImageIO.read(image.getImg()
						.getBinaryStream());

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
		
	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public ModelAndView registerPage(HttpServletResponse response) {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());

		UserForm userForm = new UserForm();
		userForm.setLoginname(user.getLoginname());
		userForm.setDescription(user.getDescription());
		userForm.setName(user.getName());
		userForm.setPassword(user.getPassword());
		userForm.setPassrepeat(user.getPassword());
		userForm.setUsername(user.getUsername());
		userForm.setAddress(user.getAddress());
		userForm.setEmail(user.getEmail());
		userForm.setImg(user.getImg());
		userForm.setImgName(user.getImgName());
		userForm.setImgType(user.getImgType());
		userForm.setLastname(user.getLastname());
		
		List<User> users = userService.getAll();
		
		return new ModelAndView("profile").addObject("userForm", userForm).addObject("users", users);
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/profile", method = RequestMethod.POST)
	public ModelAndView profilePage(@Valid @ModelAttribute UserForm userForm, @RequestParam("file") MultipartFile file,
			Errors errors) {		
		
		if (errors.hasErrors()) {
			//Pvz kaip reik rejectint patikrinus.
			//errors.rejectValue("name", "msg", "LOPASTU");
			return new ModelAndView("profile").addObject(userForm);
		}
		
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());

		try {
			Blob blob = new SerialBlob(file.getBytes());
			userForm.setImgName(file.getOriginalFilename());
			userForm.setImg(blob);
			userForm.setImgType(file.getContentType());
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		userService.updateUser(
				user.getUserId(),
				userForm.getLoginname(), 
				userForm.getUsername(),
				userForm.getPassword(),
				userForm.getEmail(),
				userForm.getName(), 
				userForm.getLastname(),
				userForm.getAddress(),
				userForm.getDescription(),
				userForm.getImgName(),
				userForm.getImgType(),
				userForm.getImg(),
				Role.ROLE_USER);
		
		return new ModelAndView("redirect:profile");
	}
}
