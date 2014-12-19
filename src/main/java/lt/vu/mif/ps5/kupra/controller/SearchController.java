package lt.vu.mif.ps5.kupra.controller;

import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Logger;

import lt.vu.mif.ps5.kupra.service.RecipeService;
import lt.vu.mif.ps5.kupra.service.UserService;
import lt.vu.mif.ps5.kupra.entity.Recipe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

	public static boolean isNumeric(String str) {
		return str.matches("-?\\d+(\\.\\d+)?"); // match a number with optional
												// '-' and decimal.
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/search/all", method = RequestMethod.GET)
	public ModelAndView searchDoAll(@ModelAttribute("key") String key,
			@ModelAttribute("order") String order,
			@ModelAttribute("rating") String rating) {
		int rate;
		if (isNumeric(rating)) {
			rate = Integer.parseInt(rating);
		} else {
			rate = 0;
		}
		List<Recipe> recipes;
		if (key.isEmpty()) {
			recipes = recipeService.getAll();
		} else {
			recipes = recipeService.getByName(key);
		}
		if (!order.isEmpty()) {
			if (order.equals("best")) {
				System.out.println(order);
				Collections.sort(recipes, new Comparator<Recipe>() {
					@Override
					public int compare(Recipe t1, Recipe t2) {
						return t2.getRating() - t1.getRating();
					}
				});
			} else if (order.equals("worst")) {
				Collections.sort(recipes, new Comparator<Recipe>() {
					@Override
					public int compare(Recipe t1, Recipe t2) {
						return t1.getRating() - t2.getRating();
					}
				});
			} else if (order.equals("byRating")) {

				Iterator<Recipe> iter = recipes.iterator();
				while (iter.hasNext()) {
					Recipe recipe = iter.next();
					if (recipe.getRating() < rate) {
						iter.remove();
					}
				}
			}
		}
		return new ModelAndView("search").addObject("recipes", recipes)
				.addObject("key", key);
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/search/user", method = RequestMethod.GET)
	public ModelAndView searchDoUser(@ModelAttribute("key") String key,
			@ModelAttribute("order") String order,
			@ModelAttribute("rating") String rating) {
		int rate;
		if (isNumeric(rating)) {
			rate = Integer.parseInt(rating);
		} else {
			rate = 0;
		}
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());
		List<Recipe> recipes;
		if (key.isEmpty()) {
			recipes = recipeService.getForUser(user);
		} else {
			recipes = recipeService.getByNameFromUser(user.getUserId(), key);
		}
		if (!order.isEmpty()) {
			if (order.equals("best")) {
				Collections.sort(recipes, new Comparator<Recipe>() {
					@Override
					public int compare(Recipe t1, Recipe t2) {
						return t2.getRating() - t1.getRating();
					}
				});
			} else if (order.equals("worst")) {
				Collections.sort(recipes, new Comparator<Recipe>() {
					@Override
					public int compare(Recipe t1, Recipe t2) {
						return t1.getRating() - t2.getRating();
					}
				});
			} else if (order.equals("byRating")) {
				Iterator<Recipe> iter = recipes.iterator();
				while (iter.hasNext()) {
					Recipe recipe = iter.next();
					if (recipe.getRating() < rate) {
						iter.remove();
					}
				}
			}
		}
		return new ModelAndView("search").addObject("recipes", recipes)
				.addObject("key", key);
	}

}