package lt.vu.mif.ps5.kupra.controller;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.logging.Logger;

import lt.vu.mif.ps5.kupra.entity.Fridge;
import lt.vu.mif.ps5.kupra.entity.Meal;
import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.User;
import lt.vu.mif.ps5.kupra.entity.Ingredient;
import lt.vu.mif.ps5.kupra.service.RecipeService;
import lt.vu.mif.ps5.kupra.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class MealsController {

	static Logger log = Logger.getLogger(MealsController.class.getName());

	private final UserService userService;
	private final RecipeService recipeService;

	@Autowired
	public MealsController(UserService userService, RecipeService recipeService) {
		this.userService = userService;
		this.recipeService = recipeService;
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/meals", method = RequestMethod.GET)
	public ModelAndView mealsList() {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());
		Set<Meal> meals = userService.getMeals(user);
		Set<Recipe> recipes = new HashSet<Recipe>();

		Map<Long, Double> sum = new HashMap<Long, Double>();
		for (Meal meal : meals) {
			recipes.add(meal.getRecipe());

			Set<Ingredient> ingrs = meal.getRecipe().getIngredients();

			for (Iterator<Ingredient> it = ingrs.iterator(); it.hasNext();) {
				Ingredient ingr = it.next();
				if (sum.containsKey(ingr.getProduct().getProductId())) {
					sum.put(ingr.getProduct().getProductId(), ingr.getAmount()
							+ sum.get(ingr.getProduct().getProductId()));
				} else {
					sum.put(ingr.getProduct().getProductId(), ingr.getAmount());
				}
				//
			}
		}
		for (Long key : sum.keySet()) {
			System.out.println(key + " - " + sum.get(key));

		}
		Map<Long, Double> needMap = new HashMap<Long, Double>();

		Set<Fridge> frItems = user.getFridgeItems();
		//
		for (Map.Entry<Long, Double> entry : sum.entrySet()) {
			for (Iterator<Fridge> it = frItems.iterator(); it.hasNext();) {
				Fridge prod = it.next();
				if (entry.getKey() == prod.getProduct().getProductId()) {
					if (sum.containsKey(prod.getProduct().getProductId())) {
						if (sum.get(prod.getProduct().getProductId()) > prod
								.getAmount()) {
							double need = sum.get(prod.getProduct()
									.getProductId()) - prod.getAmount();
							needMap.put(prod.getProduct().getProductId(), need);
						}
					}
					break;
				}
			}
		}
		return new ModelAndView("meals").addObject("meals", recipes);
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/meals/add/{id}", method = RequestMethod.GET)
	public ModelAndView addMeal(@PathVariable long id) {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());
		System.out.println(user.getUserId() + " recepto id " + id);
		userService.addMeal(user.getUserId(), id);
		return new ModelAndView("redirect:../../meals");
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/meals/{id}/delete", method = RequestMethod.GET)
	public ModelAndView deleteMeal(@PathVariable long id) {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());
		userService.remove(user.getUserId(), id);
		return new ModelAndView("redirect:../../meals");
	}
}
