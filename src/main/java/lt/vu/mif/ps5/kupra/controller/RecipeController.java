package lt.vu.mif.ps5.kupra.controller;

import java.util.List;

import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.service.RecipeService;
import lt.vu.mif.ps5.kupra.service.UnitService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class RecipeController {

	static Logger log = Logger.getLogger(RecipeController.class.getName());

	private final RecipeService recipeService;
	
    @Autowired
    public RecipeController(RecipeService recipeService) {
        this.recipeService = recipeService;
    }

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/recipe/{id}", method = RequestMethod.GET)
	public ModelAndView homePage(@PathVariable long id) {
		Recipe recipe = recipeService.getRecipe(id);
		return new ModelAndView("recipe").addObject("recipe", recipe);
	}
}
