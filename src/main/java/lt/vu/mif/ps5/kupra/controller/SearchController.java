package lt.vu.mif.ps5.kupra.controller;

import java.util.List;
import java.util.logging.Logger;

import javax.validation.Valid;

import lt.vu.mif.ps5.kupra.service.RecipeService;
import lt.vu.mif.ps5.kupra.service.UserService;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.Role;
import lt.vu.mif.ps5.kupra.form.UserForm;
import lt.vu.mif.ps5.kupra.service.RecipeService;
import lt.vu.mif.ps5.kupra.service.UserService;

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

	@RequestMapping(value = "/search/all/{key}", method = RequestMethod.POST)
	public ModelAndView searchDo(@PathVariable String key) {
		List<Recipe> recipes = recipeService.getByName(key);
		for(Recipe recipe:recipes) {
			System.out.println(recipe.getName());
		}
		return new ModelAndView("searchresults").addObject("recipes", recipes);
	}
	
}