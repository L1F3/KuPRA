

import java.util.logging.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    static Logger log = Logger.getLogger(LoginController.class.getName());

    @RequestMapping("login")
    public ModelAndView getLoginForm(
            @RequestParam(required = false) String authfailed, String logout,
            String denied) {
        String message = "";
        if (authfailed != null) {
            message = "Neteisingas prisijungimo vardas arba slaptazodis!";
        } else if (logout != null) {
            message = "Sekmingai atsijungta!";
        } else if (denied != null) {
            message = "Siam vartotojui prieiga draudziama!";
        }
        return new ModelAndView("login", "message", message);
    }

    @RequestMapping("user")
    public String geUserPage() {
        return "user";
    }

    @RequestMapping("403page")
    public String ge403denied() {
        return "redirect:login?denied";
    }

    @RequestMapping("") 
    public ModelAndView getIndexForm(
            @RequestParam(required = false) String authfailed, String logout,
            String denied) {
        String message = "";
        if (authfailed != null) {
            message = "Neteisingas prisijungimo vardas arba slaptazodis!";
        } else if (logout != null) {
            message = "Sekmingai atsijungta!";
        } else if (denied != null) {
            message = "Siam vartotojui prieiga draudziama!";
        }
        return new ModelAndView("login", "message", message);
    }
}
