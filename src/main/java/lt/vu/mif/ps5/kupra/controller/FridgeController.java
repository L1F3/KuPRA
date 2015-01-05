package lt.vu.mif.ps5.kupra.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.logging.Logger;

import javax.validation.Valid;

import lt.vu.mif.ps5.kupra.entity.Fridge;
import lt.vu.mif.ps5.kupra.entity.Ingredient;
import lt.vu.mif.ps5.kupra.entity.Product;
import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.Unit;
import lt.vu.mif.ps5.kupra.entity.User;
import lt.vu.mif.ps5.kupra.form.FridgeItemForm;
import lt.vu.mif.ps5.kupra.service.FridgeService;
import lt.vu.mif.ps5.kupra.service.ProductService;
import lt.vu.mif.ps5.kupra.service.RecipeService;
import lt.vu.mif.ps5.kupra.service.UnitService;
import lt.vu.mif.ps5.kupra.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class FridgeController {
	static Logger log = Logger.getLogger(FridgeController.class.getName());

	private final ProductService productService;
	private final UnitService unitService;
	private final UserService userService;
	private final RecipeService recipeService;
	private final FridgeService fridgeService;

	@Autowired
	public FridgeController(ProductService productService,
			UnitService unitService, UserService userService,
			RecipeService recipeService, FridgeService fridgeService) {
		this.productService = productService;
		this.unitService = unitService;
		this.userService = userService;
		this.recipeService = recipeService;
		this.fridgeService = fridgeService;
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/fridge/available", method = RequestMethod.POST)
	public ModelAndView fridgeAvailablePagePOST() {
		return fridgeAvailablePageGET();
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/fridge/available", method = RequestMethod.GET)
	public ModelAndView fridgeAvailablePageGET() {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());
		Set<Fridge> fridgeItems = user.getFridgeItems();
		List<Recipe> recipes = recipeService.getRecipesByContainingProducts(
				fridgeItems, user);

		for (Iterator<Recipe> iterator = recipes.iterator(); iterator.hasNext();) {
			Recipe recipe = iterator.next();

			Set<Ingredient> ingredients = recipe.getIngredients();
			outer: for (Ingredient ingr : ingredients) {
				for (Fridge prod : user.getFridgeItems()) {
					if (prod.getProduct().getName()
							.equals(ingr.getProduct().getName())) {
						String prodUnitName = prod.getProduct().getUnit().getAbbreviation();
						String ingrUnitName = ingr.getProduct().getUnit().getAbbreviation();
						if (prodUnitName.equals(ingrUnitName)) {
							if (prod.getAmount() < ingr.getAmount()) {
								iterator.remove();
								break outer;
							}
						} else {
							double prodAmount = prod.getAmount();
							double ingrAmount = ingr.getAmount();
							if ((prodUnitName.equals("kg")
									|| prodUnitName.equals("g") || prodUnitName
										.equals("mg"))
									&& (ingrUnitName.equals("kg")
											|| ingrUnitName.equals("g") || ingrUnitName
												.equals("mg"))) {

								if (prodUnitName.equals("kg")) {
									prodAmount = (prod.getAmount() * 1000);
								} else if (prodUnitName.equals("mg")) {
									prodAmount = (prod.getAmount() / 1000);
								} else {
									prodAmount = (prod.getAmount());
								}
								if (ingrUnitName.equals("kg")) {
									ingrAmount = (ingr.getAmount() * 1000);
								} else if (ingrUnitName.equals("mg")) {
									ingrAmount = (ingr.getAmount() / 1000);
								} else {
									ingrAmount = (ingr.getAmount());
								}
							} else if ((prodUnitName.equals("l") || prodUnitName
									.equals("ml"))
									&& (ingrUnitName.equals("l") || ingrUnitName
											.equals("ml"))) {

								if (prodUnitName.equals("l")) {
									prodAmount = (prod.getAmount() * 1000);
								} else {
									prodAmount = (prod.getAmount());
								}
								if (ingrUnitName.equals("l")) {
									ingrAmount = (ingr.getAmount() * 1000);
								} else {
									ingrAmount = (ingr.getAmount());
								}
							}
							if (prodAmount < ingrAmount) {
								System.out.println(prod.getUnit()
										.getAbbreviation() + "netinka");

								iterator.remove();
								break outer;
							}
						}
					}
				}
			}
		}
		return new ModelAndView("fridgeavailable").addObject("recipes", recipes);
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/fridge/list", method = RequestMethod.GET)
	public ModelAndView fridgePage() {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());
		Set<Fridge> fritems = user.getFridgeItems();
		// List<Fridge> main = new ArrayList<Fridge>(fritems);
		// FridgeForm fridgeForm = new FridgeForm();
		// fridgeForm.setMyList(main);
		return new ModelAndView("fridge").addObject("items", fritems);
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/fridge/{id}/delete", method = RequestMethod.GET)
	public ModelAndView fridgeDeletePage(@PathVariable long id) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());
		userService.removeFridgeItem(id, user.getUserId());
		return new ModelAndView("redirect:../list");
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/fridge/add", method = RequestMethod.GET)
	public ModelAndView fridgeAddProduct() {
		return new ModelAndView("add_product_fridge");
	}
	
	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/fridge/add", method = RequestMethod.POST)
	public ModelAndView fridgeAddProductDo(@Valid @ModelAttribute FridgeItemForm fridgeItemForm, Errors errors) {
		if(errors.hasErrors()) {
			log.info("Returning add_product_Fridge.jsp page");
			return new ModelAndView("add_product_fridge").addObject(fridgeItemForm);
		}
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());
		
		Set<Fridge> fridgeItems = user.getFridgeItems();
		
		boolean EXISTS = false;
		long fridgeId = 0;
		
		for(Fridge fridge : fridgeItems) {
			if(fridge.getProduct().getProductId() == Long.valueOf(fridgeItemForm.getProductId())) {
				fridgeId = fridge.getFrId();
				EXISTS = true;
				break;
			}
		}
		
		if(!EXISTS) {
			Product product = productService.getProduct(Long.valueOf(fridgeItemForm.getProductId()));
			Unit unit = unitService.getUnit(fridgeItemForm.getUnitId());
			fridgeService.addFridge(user, product, unit, fridgeItemForm.getAmount());	
		} else {
			fridgeService.replenish(fridgeId, fridgeItemForm.getAmount());
		}
		return new ModelAndView("redirect:list");
	}
}