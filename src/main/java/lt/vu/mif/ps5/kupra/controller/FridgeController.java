package lt.vu.mif.ps5.kupra.controller;

import java.util.Set;
import java.util.logging.Logger;

import lt.vu.mif.ps5.kupra.entity.Fridge;
import lt.vu.mif.ps5.kupra.entity.User;
import lt.vu.mif.ps5.kupra.service.ProductService;
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

@Controller
public class FridgeController {
	static Logger log = Logger.getLogger(FridgeController.class.getName());

    private final ProductService productService;
    private final UnitService unitService;
    private final UserService userService;

    @Autowired
    public FridgeController(ProductService productService, UnitService unitService, UserService userService) {
        this.productService = productService;
        this.unitService = unitService;
        this.userService = userService;
    }
    

    @Secured({"ROLE_USER", "ROLE_ADMIN"})
    @RequestMapping(value = "/fridge/available", method = RequestMethod.GET)
    public ModelAndView fridgePage() {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());
		Set<Fridge> fritems = user.getFridgeItems();
		for (Fridge item : fritems) {
			System.out.println(item.getProduct().getName() + item.getAmount());
		}
    	return new ModelAndView("fridge");
    }
    
}