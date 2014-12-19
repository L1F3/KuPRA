package lt.vu.mif.ps5.kupra.controller;
import lt.vu.mif.ps5.kupra.controller.CM;





import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.logging.Logger;

import javax.validation.Valid;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lt.vu.mif.ps5.kupra.entity.Recipe;
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
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public ModelAndView registerPage() {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());

		UserForm userForm = new UserForm();
		userForm.setLoginname(user.getLoginname());
		userForm.setDescription(user.getDescription());
		userForm.setName(user.getName());
		userForm.setUsername(user.getUsername());
		userForm.setAddress(user.getAddress());
		userForm.setEmail(user.getEmail());
		userForm.setLastname(user.getLastname());
		return new ModelAndView("profile").addObject(userForm);
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/profile", method = RequestMethod.POST)
	public ModelAndView profilePage(@Valid @ModelAttribute UserForm userForm,
			Errors errors) {
		if (errors.hasErrors()) {
			//Pvz kaip reik rejectint patikrinus.
			//errors.rejectValue("name", "msg", "LOPASTU");
			return new ModelAndView("profile").addObject(userForm);
		}
		/*userService.updateUser(
				userForm.getLoginname(), 
				userForm.getUsername(),
				userForm.getPassword(),
				userForm.getEmail(),
				userForm.getName(), 
				userForm.getLastname(),
				userForm.getAddress(),
				Role.ROLE_USER);
		*/
		return new ModelAndView("profile");
	}
}
