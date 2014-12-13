package lt.vu.mif.ps5.kupra.controller;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import javax.validation.Valid;

import lt.vu.mif.ps5.kupra.entity.Product;
import lt.vu.mif.ps5.kupra.entity.Role;
import lt.vu.mif.ps5.kupra.form.ProductForm;
import lt.vu.mif.ps5.kupra.service.ProductService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {

    static Logger log = Logger.getLogger(ProductController.class.getName());

    private final ProductService productService;

    @Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @ModelAttribute("product")
    public Product createProductModel() {
        return new Product();
    }

    @Secured({"ROLE_USER", "ROLE_ADMIN"})
    @RequestMapping(value = "/product", method = RequestMethod.GET)
    public ModelAndView productPage() {
        return new ModelAndView("productadd").addObject(new ProductForm());
    }

    @Secured({"ROLE_USER", "ROLE_ADMIN"})
    @RequestMapping(value = "/product", method = RequestMethod.POST)
    public ModelAndView productCreate(
            @Valid @ModelAttribute ProductForm productForm, Errors errors) {
        if (errors.hasErrors()) {
            log.info("Returning product.jsp page");
            return new ModelAndView("productadd").addObject(productForm);
        }
        productService.addProduct(productForm.getProductName(),/* product.getUnits(), */productForm.getDescription(), productForm.getImgName(), productForm.getImgType(), productForm.getImg());
        return new ModelAndView("redirect:product/list");
    }

 /*   @Secured({"ROLE_ADMIN"})
    @RequestMapping(value = "/product/list", method = RequestMethod.GET)
    public ModelAndView productList() {
        List<Product> products = productService.getListPage(15, 0);
        return new ModelAndView("productlist").addObject("product", products);
    }
/*
    @Secured({"ROLE_ADMIN"})
    @RequestMapping(value = "/product/list/{bound}", method = RequestMethod.GET)
    public ModelAndView productList(@PathVariable int bound) {
        List<Product> products = productService.getListPage(15, bound);
        return new ModelAndView("productlist").addObject("products", products);
    }
*/
    @Secured({"ROLE_ADMIN"})
    @RequestMapping(value = "/product/{id}/delete", method = RequestMethod.POST)
    public ModelAndView productDelete(@PathVariable long id) {
    	productService.deleteProduct(id);
        return new ModelAndView("redirect:../../product/list");
    }

    @Secured({"ROLE_ADMIN"})
    @RequestMapping(value = "/product/modify/{id}", method = RequestMethod.GET)
    public ModelAndView productModify(@PathVariable long id) {
    	Product product = productService.getProduct(id);
        return new ModelAndView("productmodify").addObject("product", product);
    }

    @Secured({"ROLE_ADMIN"})
    @RequestMapping(value = "/product/modify/{id}", method = RequestMethod.POST)
    public ModelAndView productDoModify(
    		@PathVariable long id, @Valid @ModelAttribute("product") Product product, BindingResult result) {
        if (result.hasErrors()) {
            log.info("Returning product.jsp page");
            return new ModelAndView("product");
        }
        productService.updateProduct(
        		id,
        		product.getName(), 
        		/*product.getUnits(), */
        		product.getDescription(), 
        		product.getImgName(), 
        		product.getImgType(), 
        		product.getImg());
        return new ModelAndView("redirect:list");
    }
/*
    private boolean hasRole(String role) {
        Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
        boolean hasRole = false;
        for (GrantedAuthority authority : authorities) {
            hasRole = authority.getAuthority().equals(role);
            if (hasRole) {
                break;
            }
        }
        return hasRole;
    }
*/
}
