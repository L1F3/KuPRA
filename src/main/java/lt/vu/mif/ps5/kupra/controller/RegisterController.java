package lt.vu.mif.ps5.kupra.controller;


@Controller
public class RegisterController {
	
    static Logger log = Logger.getLogger(RegisterController.class.getName());
	
	@RequestMapping("/register", method = RequestMethod.GET)
	public ModelAndView registerPage() {
        return new ModelAndView("register");
	}
	
	
}