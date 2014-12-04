package lt.vu.mif.ps5.kupra.controller;

import java.util.logging.Logger;

import lt.vu.mif.ps5.kupra.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MealsController {

	static Logger log = Logger.getLogger(RegisterController.class.getName());
	
	private final UserService userService;
	
	@Autowired
    public MealsController(UserService userService) {
        this.userService = userService;
    }
	
	@RequestMapping(value = "/meals", method = RequestMethod.GET)
	public ModelAndView eatsList() {		
		return new ModelAndView("mealslist");//.addObject("meals", userService.getMeals());
	}
}
