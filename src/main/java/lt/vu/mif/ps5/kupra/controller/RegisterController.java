package lt.vu.mif.ps5.kupra.controller;

import java.util.logging.Logger;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lt.vu.mif.ps5.kupra.entity.Role;
import lt.vu.mif.ps5.kupra.form.UserForm;
import lt.vu.mif.ps5.kupra.service.UserService;

@Controller
public class RegisterController {

	static Logger log = Logger.getLogger(RegisterController.class.getName());

    private final UserService userService;

    @Autowired
    public RegisterController(UserService userService) {
        this.userService = userService;
    }
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView registerPage() {
		return new ModelAndView("register").addObject(new UserForm());
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView registerDo(@Valid @ModelAttribute UserForm userForm,
			Errors errors) {
		if (errors.hasErrors()) {
			//Pvz kaip reik rejectint patikrinus.
			//errors.rejectValue("name", "msg", "LOPASTU");
			return new ModelAndView("register").addObject(userForm);
		}
		userService.addUser(
				userForm.getLoginname(), 
				userForm.getUsername(),
				userForm.getPassword(),
				userForm.getEmail(),
				userForm.getName(), 
				userForm.getLastname(),
				userForm.getAddress(),
				Role.ROLE_USER);
		return new ModelAndView("redirect:/home");
		
	}

}