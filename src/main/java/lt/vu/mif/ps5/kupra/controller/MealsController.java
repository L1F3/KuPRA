package lt.vu.mif.ps5.kupra.controller;

import java.util.List;
import java.util.Set;
import java.util.logging.Logger;

import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.User;
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
		
		Set<Recipe> meals = null;
		
		List<User> users = userService.getAll();
		
		String username = userService.getUsername();
		
		for (User user : users) {
			if (user.getName().equals(username)) {
				meals = user.getMeals();
			}
		}
		
		return new ModelAndView("mealslist").addObject("meals", meals);
	}
}
