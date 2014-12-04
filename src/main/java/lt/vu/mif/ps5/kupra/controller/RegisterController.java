package lt.vu.mif.ps5.kupra.controller;

import java.util.logging.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lt.vu.mif.ps5.kupra.form.UserForm;

@Controller
public class RegisterController {
	
    static Logger log = Logger.getLogger(RegisterController.class.getName());

    @ModelAttribute("regForm")
    public UserForm createUserForm() {
        return new UserForm();
    }

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView registerPage() {
        return new ModelAndView("register");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView registerDo() {
		
        return new ModelAndView("register").addObject(new UserForm());
	}
	
}