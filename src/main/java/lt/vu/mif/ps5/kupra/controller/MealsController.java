package lt.vu.mif.ps5.kupra.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Logger;

import lt.vu.mif.ps5.kupra.entity.Fridge;
import lt.vu.mif.ps5.kupra.entity.Meal;
import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.User;
import lt.vu.mif.ps5.kupra.entity.Ingredient;
import lt.vu.mif.ps5.kupra.form.RatingForm;
import lt.vu.mif.ps5.kupra.service.ProductService;
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
	private final ProductService productService;

	@Autowired
	public MealsController(UserService userService,
			RecipeService recipeService, ProductService productService) {
		this.userService = userService;
		this.recipeService = recipeService;
		this.productService = productService;
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/make/{id}", method = RequestMethod.GET)
	public ModelAndView mealsMaking(@PathVariable long id) {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());
		Set<Meal> meals = userService.getMeals(user);
		Set<Recipe> recipes = new HashSet<Recipe>();

		Map<Long, Double> needMap = new HashMap<Long, Double>();

		Meal neededMeal = null;
		for (Meal meal : meals) {
			if (meal.getMealId() == id) {
				neededMeal = meal;
				userService.makeMeal(id);
				Set<Ingredient> ingrs = meal.getRecipe().getIngredients();
				Set<Fridge> frItems = user.getFridgeItems();

				for (Iterator<Ingredient> it = ingrs.iterator(); it.hasNext();) {
					Ingredient ingr = it.next();
					int found = 0;

					for (Iterator<Fridge> its = frItems.iterator(); its
							.hasNext();) {
						Fridge prod = its.next();

						if (ingr.getProduct().getProductId() == prod
								.getProduct().getProductId()) {
							found = 1;
							if (ingr.getAmount() > prod.getAmount()) {
								double need = ingr.getAmount()
										- prod.getAmount();
								needMap.put(prod.getProduct().getProductId(),
										need);
							}
							break;
						}

					}
					if (found == 0) {
						needMap.put(ingr.getProduct().getProductId(),
								ingr.getAmount());
					}
				}

				break;
			}
		}
		Set<Fridge> deck = new HashSet<Fridge>();
		int count = 0;
		List<FromTwo> listNeeded = new ArrayList<FromTwo>();
		for (Long key : needMap.keySet()) {
			FromTwo one = new FromTwo(key, needMap.get(key), productService
					.getProduct(key).getUnit().getAbbreviation(),
					productService.getProduct(key).getName());
			listNeeded.add(one);
			count++;
		}
		if (count == 0) {
			if (neededMeal != null) {
				Set<Ingredient> ingrs = neededMeal.getRecipe().getIngredients();
				Set<Fridge> frItems = user.getFridgeItems();
				for (Iterator<Ingredient> it = ingrs.iterator(); it.hasNext();) {
					Ingredient ingr = it.next();

					for (Iterator<Fridge> its = frItems.iterator(); its
							.hasNext();) {
						Fridge prod = its.next();

						if (ingr.getProduct().getProductId() == prod
								.getProduct().getProductId()) {
							prod.setAmount(prod.getAmount() - ingr.getAmount());
							its.remove();
							deck.add(prod);
							
							//
						}

					}
				}
			}
			
			return new ModelAndView("redirect:../meals");

		} else {
			return new ModelAndView("product_need").addObject("fromTwo",
					listNeeded);// .addObject("meals",

		} // recipes).addObject("fromTwo",
			// listNeeded);
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/meals", method = RequestMethod.GET)
	public ModelAndView mealsList() {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());
		Set<Meal> meals = userService.getMeals(user);
		Set<Meal> recipes = new HashSet<Meal>();

		Map<Long, Double> sum = new HashMap<Long, Double>();
		for (Meal meal : meals) {
			recipes.add(meal);

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
			int found = 0;
			for (Iterator<Fridge> it = frItems.iterator(); it.hasNext();) {
				Fridge prod = it.next();
				if (entry.getKey() == prod.getProduct().getProductId()) {
					found = 1;
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
			if (found == 0) {
				needMap.put(entry.getKey(), sum.get(entry.getKey()));
			}
		}
		System.out.println("reikia produktu");
		List<FromTwo> listNeeded = new ArrayList<FromTwo>();
		for (Long key : needMap.keySet()) {
			FromTwo one = new FromTwo(key, needMap.get(key), productService
					.getProduct(key).getUnit().getAbbreviation(),
					productService.getProduct(key).getName());
			listNeeded.add(one);
		}

		
		
		return new ModelAndView("meals").addObject("meals", recipes).addObject(
				"fromTwo", listNeeded).addObject("ratingForm", new RatingForm());
	}

	public class FromTwo {
		private long first;
		private double second;
		private String third;
		private String fourth;

		public FromTwo(long first, double second, String third, String fourth) {
			this.first = first;
			this.second = second;
			this.third = third;
			this.fourth = fourth;
		}

		public long getFirst() {
			return first;
		}

		public double getSecond() {
			return second;
		}

		public String getThird() {
			return third;
		}

		public String getFourth() {
			return fourth;
		}

		public void setFirst(long first) {
			this.first = first;
		}

		public void setSecond(double second) {
			this.second = second;
		}

		public void setThird(String third) {
			this.third = third;
		}

		public void setFourth(String fourth) {
			this.fourth = fourth;
		}
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
