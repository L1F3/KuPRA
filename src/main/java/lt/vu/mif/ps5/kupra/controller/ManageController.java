package lt.vu.mif.ps5.kupra.controller;

import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lt.vu.mif.ps5.kupra.entity.Product;
import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.Role;
import lt.vu.mif.ps5.kupra.entity.Unit;
import lt.vu.mif.ps5.kupra.entity.User;
import lt.vu.mif.ps5.kupra.form.ProductForm;
import lt.vu.mif.ps5.kupra.form.UnitForm;
import lt.vu.mif.ps5.kupra.form.UserForm;
import lt.vu.mif.ps5.kupra.service.ProductService;
import lt.vu.mif.ps5.kupra.service.RecipeService;
import lt.vu.mif.ps5.kupra.service.UnitService;
import lt.vu.mif.ps5.kupra.service.UserService;

@Controller
public class ManageController {

	static Logger log = Logger.getLogger(RegisterController.class.getName());
	
	private final UnitService unitService;
	private final ProductService productService;
	private final RecipeService recipeService;
	private final UserService userService;
	
    @Autowired
    public ManageController(UnitService unitService, ProductService productService, RecipeService recipeService, UserService userService) {
        this.unitService = unitService;
        this.productService = productService;
        this.recipeService = recipeService;
        this.userService = userService;
    }
    
	@Secured({ "ROLE_ADMIN" })
	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public ModelAndView managePage() {
		List<Unit> units = unitService.getAll();
		List<Product> products = productService.getAll();
		List<Recipe> recipes = recipeService.getAll();
		List<User> users = userService.getAll();
		return new ModelAndView("manage_admin").addObject("units", units).addObject("products", products).addObject("recipes", recipes).addObject("users", users);
	}
	
	@Secured({ "ROLE_ADMIN" })
	@RequestMapping(value = "/unitmodify/{id}", method = RequestMethod.GET)
	public ModelAndView modifyUnit(@PathVariable long id) {
		Unit unit = unitService.getUnit(id);
		UnitForm unitForm = new UnitForm();
		unitForm.setName(unit.getName());
		unitForm.setAbbreviation(unit.getAbbreviation());
		return new ModelAndView("unitmodify").addObject(unitForm);
	}
	
    @Secured({"ROLE_ADMIN"})
    @RequestMapping(value = "/unitmodify/{id}", method = RequestMethod.POST)
    public ModelAndView unitDoModify(
    		@PathVariable long id, @Valid @ModelAttribute("unit") Unit unit, BindingResult result) {
        if (result.hasErrors()) {
            log.info("Returning unit.jsp page");
            return new ModelAndView("unitmodify/{id}");
        }
        unitService.updateUnit(id, unit.getAbbreviation(), unit.getName());
        return new ModelAndView("redirect:../manage");
    }
    
    @Secured({"ROLE_ADMIN"})
    @RequestMapping(value = "/manage/{id}/delete", method = RequestMethod.GET)
    public ModelAndView unitDelete(@PathVariable long id) {
        unitService.deleteUnit(id);
        return new ModelAndView("redirect:../../manage");
    }
    
	@Secured({ "ROLE_ADMIN" })
	@RequestMapping(value = "/productmodify/{id}", method = RequestMethod.GET)
	public ModelAndView modifyProduct(@PathVariable long id) {
		Product product = productService.getProduct(id);
		List<Unit> units = unitService.getAll();
		ProductForm productForm = new ProductForm();
		productForm.setDescription(product.getDescription());
		productForm.setImg(product.getImg());
		productForm.setImgName(product.getImgName());
		productForm.setImgType(product.getImgType());
		productForm.setProductName(product.getName());
		productForm.setUnit(product.getUnit());
		return new ModelAndView("productmodify").addObject(productForm).addObject("units", units);
	}
	
    @Secured({"ROLE_ADMIN"})
    @RequestMapping(value = "/productmodify/{id}", method = RequestMethod.POST)
    public ModelAndView productDoModify(
    		@PathVariable long id, @Valid @ModelAttribute("product") Product product, BindingResult result) {
        if (result.hasErrors()) {
            log.info("Returning product.jsp page");
            return new ModelAndView("productmodify/{id}");
        }
        productService.updateProduct(id, product.getName(), product.getDescription(), product.getImgName(), product.getImgType(), product.getImg());
        return new ModelAndView("redirect:../manage");
    }
    
	
    @Secured({"ROLE_ADMIN"})
    @RequestMapping(value = "/manage/{id}/product/delete", method = RequestMethod.GET)
    public ModelAndView productDelete(@PathVariable long id) {
        productService.deleteProduct(id);
        return new ModelAndView("redirect:../../../manage");
    }
    
}