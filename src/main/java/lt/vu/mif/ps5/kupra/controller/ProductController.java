package lt.vu.mif.ps5.kupra.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import lt.vu.mif.ps5.kupra.entity.Product;
import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.RecipeImage;
import lt.vu.mif.ps5.kupra.entity.Role;
import lt.vu.mif.ps5.kupra.entity.Unit;
import lt.vu.mif.ps5.kupra.form.ProductForm;
import lt.vu.mif.ps5.kupra.service.ProductService;
import lt.vu.mif.ps5.kupra.service.RecipeService;

import org.apache.log4j.Logger;
import org.h2.util.IOUtils;
import org.imgscalr.Scalr;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {

    static Logger log = Logger.getLogger(ProductController.class.getName());

    private final ProductService productService;
    private final RecipeService recipeService;

    @Autowired
    public ProductController(ProductService productService, RecipeService recipeService) {
        this.productService = productService;
        this.recipeService = recipeService;
    }

    @ModelAttribute("product")
    public Product createProductModel() {
        return new Product();
    }
    
    @Secured({"ROLE_USER", "ROLE_ADMIN"})
    @RequestMapping(value = "/product/all", method = RequestMethod.GET)
    public ModelAndView productsAllPage() {
    	List<Product> products = productService.getAll();
        return new ModelAndView("products").addObject("products", products);
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
    

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/product/image/{id}/thumb2", method = RequestMethod.GET)
	public ModelAndView productImageThumbForList(@PathVariable long id,
			HttpServletResponse response) {
		Product product = productService.getProduct(id);

		try {
			if (product.getImg() != null) {
				System.out.println("Rado paveiksliuka");
				response.setHeader("Content-Disposition", "inline;filename=\""
						+ product.getImgName() + "\"");
				OutputStream out = response.getOutputStream();
				response.setContentType(product.getImgType());
				int width = 150, height = 150;
				BufferedImage bufimage = ImageIO.read(product.getImg()
						.getBinaryStream());

				BufferedImage thumbnail = Scalr.resize(bufimage,
						Scalr.Method.SPEED, Scalr.Mode.FIT_TO_HEIGHT, width,
						height, Scalr.OP_ANTIALIAS);
				ImageIO.write(thumbnail, "jpg", out);
				out.flush();
				out.close();
			} else {
				System.out.println("NERado paveiksliuka");
				RecipeImage image = recipeService.getDefaultImage();
				response.setHeader("Content-Disposition", "inline;filename=\""
						+ image.getImgName() + "\"");
				OutputStream out = response.getOutputStream();
				response.setContentType(image.getImgType());
				int width = 150, height = 150;
				BufferedImage bufimage = ImageIO.read(image.getImg()
						.getBinaryStream());

				BufferedImage thumbnail = Scalr.resize(bufimage,
						Scalr.Method.SPEED, Scalr.Mode.FIT_TO_HEIGHT, width,
						height, Scalr.OP_ANTIALIAS);
				ImageIO.write(thumbnail, "jpg", out);
				out.flush();
				out.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
    @Secured({"ROLE_USER", "ROLE_ADMIN"})
    @RequestMapping(value = "/product/{id}/unit", method = RequestMethod.GET, produces="application/json")
    public @ResponseBody Unit getUnitsList(@PathVariable long id) {
    	return productService.getProduct(id).getUnit();
    }
    
    @Secured({"ROLE_USER", "ROLE_ADMIN"})
    @RequestMapping(value = "/product/list", method = RequestMethod.GET, produces="application/json")
    public @ResponseBody List<Product> getProductsList(@RequestParam String name) {
    	if (name.length() != 0) {
    		List<Product> products = new ArrayList<Product>();
    		for (Product product : productService.getAll()) {
        		if (product.getName().toLowerCase().contains(name.toLowerCase())) {
        			products.add(product);
        		}
        	}
    		return products;
    	} else {
    		return productService.getAll();
    	}
    }
}
