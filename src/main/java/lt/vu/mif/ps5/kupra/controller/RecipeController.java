package lt.vu.mif.ps5.kupra.controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import javax.sql.rowset.serial.SerialBlob;
import javax.validation.Valid;

import lt.vu.mif.ps5.kupra.entity.Product;
import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.Role;
import lt.vu.mif.ps5.kupra.entity.User;
import lt.vu.mif.ps5.kupra.form.RecipeForm;
import lt.vu.mif.ps5.kupra.form.UserForm;
import lt.vu.mif.ps5.kupra.service.RecipeService;
import lt.vu.mif.ps5.kupra.service.UnitService;
import lt.vu.mif.ps5.kupra.service.UserService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RecipeController {

	static Logger log = Logger.getLogger(RecipeController.class.getName());

	private final RecipeService recipeService;
	private final UserService userService;

	@Autowired
	public RecipeController(RecipeService recipeService, UserService userService) {
		this.recipeService = recipeService;
		this.userService = userService;
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/recipe/{id}", method = RequestMethod.GET)
	public ModelAndView recipeByIdPage(@PathVariable long id) {
		Recipe recipe = recipeService.getRecipe(id);
		return new ModelAndView("recipe").addObject("recipe", recipe);
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/recipe", method = RequestMethod.GET)
	public ModelAndView recipeFormPage() {
		return new ModelAndView("recipeadd").addObject(new RecipeForm());
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/recipe", method = RequestMethod.POST)
	public ModelAndView recipeFormPageDo(
			@Valid @ModelAttribute RecipeForm recipeForm, Errors errors) {
		/*
		 * if (errors.hasErrors()) {
		 * 
		 * return new ModelAndView("recipeadd").addObject(recipeForm); }
		 */
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());
		log.info(user.getName());

		try {
			log.info("Creating blob");
			Blob blob = new SerialBlob(recipeForm.getFile().getBytes());
			recipeService.addRecipe(recipeForm.getName(), recipeForm.getFile()
					.getOriginalFilename(), blob, recipeForm.getFile()
					.getContentType(), null, recipeForm.getDescription(),
					recipeForm.getVisibility(), 
					user);
		} catch (IOException e) {
			log.info("Something wrong with IO");
			log.info("Returning template.jsp page");
			return new ModelAndView("template");
		} catch (SQLException e) {
			log.info("MySQL exception");
			log.info("Returning template.jsp page");
			return new ModelAndView("template");
		} catch (Exception e) {
			log.info("addTemplate exception");
			log.info("Returning template.jsp page");
			return new ModelAndView("template");
		}
		return new ModelAndView("redirect:/home");
	}
}
