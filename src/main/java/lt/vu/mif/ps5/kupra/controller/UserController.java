package lt.vu.mif.ps5.kupra.controller;

import javax.validation.Valid;

import lt.vu.mif.ps5.kupra.entity.Role;
import lt.vu.mif.ps5.kupra.entity.User;
import lt.vu.mif.ps5.kupra.form.UserForm;
import lt.vu.mif.ps5.kupra.service.UserService;

import org.apache.log4j.Logger;
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
				// log.info("Fucking cheater. Returning account.jsp page");
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
	public ModelAndView userDoModify(
			@Valid @ModelAttribute("user") User user, BindingResult result) {
		if (result.hasErrors()) {
			// log.info("Returning account.jsp page");
			return new ModelAndView("user");
		}

		long userId = 0; // Padaryti updateUser methoda

		return new ModelAndView("redirect:user/{" + userId + "}");
	}

}
