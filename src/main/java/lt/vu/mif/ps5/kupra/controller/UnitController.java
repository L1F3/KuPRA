package lt.vu.mif.ps5.kupra.controller;

import java.util.List;

import javax.validation.Valid;

import lt.vu.mif.ps5.kupra.controller.UnitController;
import lt.vu.mif.ps5.kupra.service.UnitService;
import lt.vu.mif.ps5.kupra.entity.Unit;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UnitController {
	
	static Logger log = Logger.getLogger(UnitController.class.getName());

	private final UnitService unitService;
	
    @Autowired
    public UnitController(UnitService unitService) {
        this.unitService = unitService;
    }
    
    @ModelAttribute("unit")
    public Unit createUnitModel() {
        return new Unit();
    }
    
    @Secured({"ROLE_USER", "ROLE_ADMIN"})
    @RequestMapping(value = "/unit", method = RequestMethod.GET)
    public ModelAndView unitPage() {
        return new ModelAndView("unit");
    }
    
    @Secured({"ROLE_USER", "ROLE_ADMIN"})
    @RequestMapping(value = "/unit", method = RequestMethod.POST)
    public ModelAndView unitCreate(
            @Valid @ModelAttribute("unit") Unit unit, BindingResult result) {
        if (result.hasErrors()) {
            log.info("Returning unit.jsp page");
            return new ModelAndView("unit");
        }
        unitService.addUnit(unit.getName(), unit.getAbbreviation());
        return new ModelAndView("redirect:unit/list");
    }
    
   /* 
    <<Isvesti units lista vienam page>>
    
    @Secured({"ROLE_USER", "ROLE_ADMIN"})
    @RequestMapping(value = "/unit/list", method = RequestMethod.GET)
    public ModelAndView unitList() {
        List<Unit> units = unitService.getListPage(15, 0);
        return new ModelAndView("unitlist").addObject("units", units);
    }
    
    @Secured({"ROLE_USER", "ROLE_ADMIN"})
    @RequestMapping(value = "/account/list/{bound}", method = RequestMethod.GET)
    public ModelAndView accountList(@PathVariable int bound) {
        List<Account> accounts = accountService.getListPage(15, bound);
        return new ModelAndView("accountlist").addObject("accounts", accounts);
    }
    */
    
    @Secured({"ROLE_ADMIN"})
    @RequestMapping(value = "/unit/{id}/delete", method = RequestMethod.POST)
    public ModelAndView unitDelete(@PathVariable long id) {
        unitService.deleteUnit(id);
        return new ModelAndView("redirect:../../unit/list");
    }
    
    @Secured({"ROLE_ADMIN"})
    @RequestMapping(value = "/unit/modify/{id}", method = RequestMethod.GET)
    public ModelAndView unitModify(@PathVariable long id) {
        Unit unit = unitService.getUnit(id);
        return new ModelAndView("unitmodify").addObject("unit", unit);
    }
    
    @Secured({"ROLE_ADMIN"})
    @RequestMapping(value = "/unit/modify", method = RequestMethod.POST)
    public ModelAndView unitDoModify(
            @Valid @ModelAttribute("unit") Unit unit, BindingResult result) {
        if (result.hasErrors()) {
            log.info("Returning unit.jsp page");
            return new ModelAndView("unit");
        }
        unitService.updateUnit(
                unit.getUnitId(),
                unit.getName(),
                unit.getAbbreviation());
        return new ModelAndView("redirect:list");
    }
}
