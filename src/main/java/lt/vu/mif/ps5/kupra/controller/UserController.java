package lt.vu.mif.ps5.kupra.controller;

import java.util.Collection;

import javax.validation.Valid;

import lt.vu.mif.ps5.kupra.entity.Role;
import lt.vu.mif.ps5.kupra.entity.User;
import lt.vu.mif.ps5.kupra.service.UserService;
import net.metasite.des.entity.Account;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
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
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public ModelAndView userPage() {
		return new ModelAndView("user");
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public ModelAndView userCreate(@Valid @ModelAttribute("user") User user,
			BindingResult result) {
		if (result.hasErrors()) {
			// log.info("Returning account.jsp page");
			return new ModelAndView("user");
		}

		if ((user.getRole() == Role.ROLE_ADMIN)
				|| (user.getRole() == Role.ROLE_USER)) {
			if (!hasRole("ROLE_ADMIN") && !hasRole("ROLE_MANAGER")) {
				// log.info("Fucking cheater. Returning account.jsp page");
				return new ModelAndView("user");
			}
		}

		long userId = userService.addUser(user.getLoginname(),
				user.getUsername(), user.getPassword(), user.getEmail(),
				user.getName(), user.getLastname(), user.getAddress(),
				user.getRole());

		return new ModelAndView("redirect:user/{" + userId + "}");
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/user/{id}/edit", method = RequestMethod.GET)
	public ModelAndView accountModify(@PathVariable long userId) {
		User user = userService.getUser(userId);
		return new ModelAndView("edit").addObject("user", user);
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/user/modify", method = RequestMethod.POST)
	public ModelAndView accountDoModify(
			@Valid @ModelAttribute("user") User user, BindingResult result) {
		if (result.hasErrors()) {
			// log.info("Returning account.jsp page");
			return new ModelAndView("user");
		}

		long userId;
		// userService.updateAccount(
		// );
		return new ModelAndView("redirect:user/{" + userId + "}");
	}

	private boolean hasRole(String role) {
		SecurityContext context = SecurityContextHolder.getContext();
		if (context == null)
			return false;

		Authentication authentication = context.getAuthentication();
		if (authentication == null)
			return false;

		for (GrantedAuthority authority : authentication.getAuthorities()) {
			if (role.equals(authority.getAuthority())) {
				return true;
			}
		}

		return false;
	}
}
