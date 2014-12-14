package lt.vu.mif.ps5.kupra.controller;

import java.util.logging.Logger;

import lt.vu.mif.ps5.kupra.service.ProductService;
import lt.vu.mif.ps5.kupra.service.UnitService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

public class FridgeController {
	static Logger log = Logger.getLogger(FridgeController.class.getName());

    private final ProductService productService;
    private final UnitService unitService;

    @Autowired
    public FridgeController(ProductService productService, UnitService unitService) {
        this.productService = productService;
        this.unitService = unitService;
    }
    
    @RequestMapping(value = "/fridge/available", method = RequestMethod.GET)
    public ModelAndView fridgePage() {
    	
    	return new ModelAndView("fridge");
    }
    
}