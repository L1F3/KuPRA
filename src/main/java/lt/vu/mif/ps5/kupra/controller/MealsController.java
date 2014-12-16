package lt.vu.mif.ps5.kupra.controller;

import java.util.Set;
import java.util.logging.Logger;

import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.User;
import lt.vu.mif.ps5.kupra.service.RecipeService;
import lt.vu.mif.ps5.kupra.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class MealsController {

	static Logger log = Logger.getLogger(RegisterController.class.getName());

	private final UserService userService;
	private final RecipeService recipeService;

	@Autowired
	public MealsController(UserService userService, RecipeService recipeService) {
		this.userService = userService;
		this.recipeService = recipeService;
	}

	@RequestMapping(value = "/meals", method = RequestMethod.GET)
	public ModelAndView mealsList() {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());

		return new ModelAndView("meals").addObject("meals",
				userService.getMeals(user));
	}
	
	@RequestMapping(value = "/meals/add/{id}", method = RequestMethod.GET)
	public ModelAndView addMeal(@PathVariable long id) {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());
		
		Set<Recipe> meals = user.getMeals();
		Recipe foradd = recipeService.getRecipe(id);
		meals.add(foradd);
		user.setMeals(meals);
		return new ModelAndView("redirect:../meals");
	}
}
