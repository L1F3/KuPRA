package lt.vu.mif.ps5.kupra.controller;

import java.util.List;
import java.util.logging.Logger;

import lt.vu.mif.ps5.kupra.service.RecipeService;
import lt.vu.mif.ps5.kupra.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.User;

@Controller
public class SearchController {

	static Logger log = Logger.getLogger(SearchController.class.getName());

	private final RecipeService recipeService;
	private final UserService userService;

	@Autowired
	public SearchController(RecipeService recipeService, UserService userService) {
		this.recipeService = recipeService;
		this.userService = userService;
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/search/all", method = RequestMethod.GET)
	public ModelAndView searchDoPost() {
		List<Recipe> recipes = recipeService.getAll();
		return new ModelAndView("search").addObject("recipes", recipes);
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/search/all", method = RequestMethod.POST)
	public ModelAndView searchDo(@ModelAttribute("key") String key) {
		List<Recipe> recipes = recipeService.getByName(key);
		for (Recipe recipe : recipes) {
			System.out.println(recipe.getName());
		}
		return new ModelAndView("search").addObject("recipes", recipes);
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/search/user", method = RequestMethod.GET)
	public ModelAndView searchFromUserDoGet() {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());

		List<Recipe> recipes = recipeService.getForUser(user);
		return new ModelAndView("search").addObject("recipes", recipes);
	}
	
	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/search/user", method = RequestMethod.POST)
	public ModelAndView searchFromUserDo(@ModelAttribute("key") String key) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());

		List<Recipe> recipes = recipeService.getByNameFromUser(
				user.getUserId(), key);
		return new ModelAndView("search").addObject("recipes", recipes);
	}
}