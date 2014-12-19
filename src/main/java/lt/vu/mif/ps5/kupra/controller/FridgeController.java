package lt.vu.mif.ps5.kupra.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Logger;

import lt.vu.mif.ps5.kupra.entity.Fridge;
import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.User;
import lt.vu.mif.ps5.kupra.form.DeletedFridge;
import lt.vu.mif.ps5.kupra.form.FridgeForm;
import lt.vu.mif.ps5.kupra.service.ProductService;
import lt.vu.mif.ps5.kupra.service.RecipeService;
import lt.vu.mif.ps5.kupra.service.UnitService;
import lt.vu.mif.ps5.kupra.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class FridgeController {
	static Logger log = Logger.getLogger(FridgeController.class.getName());

    private final ProductService productService;
    private final UnitService unitService;
    private final UserService userService;
    private final RecipeService recipeService;

    @Autowired
    public FridgeController(ProductService productService, UnitService unitService, UserService userService, RecipeService recipeService) {
        this.productService = productService;
        this.unitService = unitService;
        this.userService = userService;
        this.recipeService = recipeService;
    }

    @Secured({"ROLE_USER", "ROLE_ADMIN"})
    @RequestMapping(value = "/fridge/available", method = RequestMethod.POST)
    public ModelAndView fridgeAvailablePagePOST() {
    	return fridgeAvailablePageGET();
    }

    @Secured({"ROLE_USER", "ROLE_ADMIN"})
    @RequestMapping(value = "/fridge/available", method = RequestMethod.GET)
    public ModelAndView fridgeAvailablePageGET() {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());
		Set<Fridge> fridgeItems = user.getFridgeItems();
		List<Recipe> recipes = recipeService.getRecipesByContainingProducts(
				fridgeItems, user);
		return new ModelAndView("search").addObject("recipes", recipes);
    }

    @Secured({"ROLE_USER", "ROLE_ADMIN"})
    @RequestMapping(value = "/fridge/list", method = RequestMethod.GET)
    public ModelAndView fridgePage() {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());
		Set<Fridge> fritems = user.getFridgeItems();
		//List<Fridge> main = new ArrayList<Fridge>(fritems);
		//FridgeForm fridgeForm = new FridgeForm();
		//fridgeForm.setMyList(main);
    	return new ModelAndView("fridge").addObject("items", fritems);
    }

    @Secured({"ROLE_USER", "ROLE_ADMIN"})
    @RequestMapping(value = "/fridge/list/delete", method = RequestMethod.POST)
    public ModelAndView fridgeDeletePage(@ModelAttribute("fridge") Fridge item ) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());
		//List<Fridge> fritems = fridgeForm.getMyList();
		//for(Fridge item:fritems) {
			//System.out.println(item.getFrId() + "int "+ fritems.indexOf(item));
		//}
		System.out.println("ZDAROA");
    	return new ModelAndView("fridge").addObject("fridge", item);//.addObject("deletedFridge", new DeletedFridge());
    }
    
}