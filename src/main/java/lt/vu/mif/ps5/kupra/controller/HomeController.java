package lt.vu.mif.ps5.kupra.controller;
import lt.vu.mif.ps5.kupra.controller.CM;



import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.logging.Logger;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.User;
import lt.vu.mif.ps5.kupra.service.RecipeService;
import lt.vu.mif.ps5.kupra.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;

@Controller
public class HomeController {

	static Logger log = Logger.getLogger(HomeController.class.getName());

	private final RecipeService recipeService;

	@Autowired
	public HomeController(RecipeService recipeService) {
		this.recipeService = recipeService;
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = CM.HOME_PAGE, method = RequestMethod.GET)
	public ModelAndView homePage() {
		List<Recipe> topRecipes = recipeService.getTopRecipes();
		return new ModelAndView("home").addObject("topRecipes", topRecipes);
	}
	
	@RequestMapping(value = "/add-recept", method = RequestMethod.GET)
	public ModelAndView addReceptPage() {
		return new ModelAndView("add-recept");
	}
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public ModelAndView profilePage() {
		return new ModelAndView("profile");
	}
	
	@RequestMapping(value = "/create-product", method = RequestMethod.GET)
	public ModelAndView addProduct() {
		return new ModelAndView("create-product");
	}
	
	@RequestMapping(value = "/create-unit", method = RequestMethod.GET)
	public ModelAndView addUnit() {
		return new ModelAndView("create-unit");
	}
}
