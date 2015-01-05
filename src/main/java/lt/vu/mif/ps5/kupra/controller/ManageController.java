package lt.vu.mif.ps5.kupra.controller;

import java.util.logging.Logger;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
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
public class ManageController {

	static Logger log = Logger.getLogger(RegisterController.class.getName());
	
	@Secured({ "ROLE_ADMIN" })
	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public ModelAndView managePage() {
		return new ModelAndView("manage_admin");
	}

}