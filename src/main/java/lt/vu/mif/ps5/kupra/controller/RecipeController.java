package lt.vu.mif.ps5.kupra.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;
import javax.validation.Valid;

import lt.vu.mif.ps5.kupra.entity.Fridge;
import lt.vu.mif.ps5.kupra.entity.RecipeImage;
import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.User;
import lt.vu.mif.ps5.kupra.form.RecipeForm;
import lt.vu.mif.ps5.kupra.service.RecipeService;
import lt.vu.mif.ps5.kupra.service.UserService;

import org.apache.log4j.Logger;
import org.h2.util.IOUtils;
import org.imgscalr.Scalr;
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
	@RequestMapping(value = "/recipe/all", method = RequestMethod.GET)
	public ModelAndView recipesList() {
		List<Recipe> recipes = recipeService.getAll();
		return new ModelAndView("search").addObject("recipes", recipes);
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/recipe/available", method = RequestMethod.GET)
	public ModelAndView recipesAvailableList() {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());
		Set<Fridge> fridgeItems = user.getFridgeItems();
		List<Recipe> recipes = recipeService.getRecipesByContainingProducts(
				fridgeItems, user);
		for (Recipe recipe : recipes) {
			System.out.println(recipe.getRecId() + recipe.getName());
		}
		return new ModelAndView("recipelist").addObject("recipes", recipes);
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/recipe/user", method = RequestMethod.GET)
	public ModelAndView recipesOfUserList() {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());

		List<Recipe> recipes = recipeService.getForUser(user);

		return new ModelAndView("recipelist").addObject("recipes", recipes);
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/recipe/{id}", method = RequestMethod.GET)
	public ModelAndView recipeByIdPage(@PathVariable long id) {
		Recipe recipe = recipeService.getRecipe(id);
		return new ModelAndView("recipe").addObject("recipe", recipe);
	}

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/recipe/image/{id}/thumb2", method = RequestMethod.GET)
	public ModelAndView recipeImageThumbForList(@PathVariable long id,
			HttpServletResponse response) {
		Recipe recipe = recipeService.getRecipe(id);

		try {
			List<RecipeImage> images = recipe.getImages();
			if (images.size() > 0) {
				RecipeImage image = images.get(0);

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
			} else {
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

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/recipe/image/{id}/thumb", method = RequestMethod.GET)
	public ModelAndView recipeImageThumb(@PathVariable long id,
			HttpServletResponse response) {
		Recipe recipe = recipeService.getRecipe(id);

		try {
			List<RecipeImage> images = recipe.getImages();
			if (images.size() > 0) {
				RecipeImage image = images.get(0);

				response.setHeader("Content-Disposition", "inline;filename=\""
						+ image.getImgName() + "\"");
				OutputStream out = response.getOutputStream();
				response.setContentType(image.getImgType());
				int width = 250, height = 250;
				BufferedImage bufimage = ImageIO.read(image.getImg()
						.getBinaryStream());

				BufferedImage thumbnail = Scalr.resize(bufimage,
						Scalr.Method.SPEED, Scalr.Mode.FIT_TO_HEIGHT, width,
						height, Scalr.OP_ANTIALIAS);
				ImageIO.write(thumbnail, "jpg", out);
				out.flush();
				out.close();
			} else {
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

	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping(value = "/recipe/image/{id}", method = RequestMethod.GET)
	public ModelAndView recipeImage(@PathVariable long id,
			HttpServletResponse response) {
		Recipe recipe = recipeService.getRecipe(id);

		try {
			response.setHeader("Content-Disposition", "inline;filename=\""
					+ recipe.getImgName() + "\"");
			OutputStream out = response.getOutputStream();
			response.setContentType(recipe.getImgType());
			IOUtils.copy(recipe.getImg().getBinaryStream(), out);
			out.flush();
			out.close();

		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
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
		if (errors.hasErrors()) {
			return new ModelAndView("recipeadd").addObject(recipeForm);
		}

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.getUserByLoginname(auth.getName());
		log.info(user.getName());

		/*try {
			log.info("Creating blob");
			Blob blob = new SerialBlob(recipeForm.getFile().getBytes());
			recipeService.addRecipe(recipeForm.getName(), recipeForm.getFile()
					.getOriginalFilename(), blob, recipeForm.getFile()
					.getContentType(), null, recipeForm.getDescription(),
					recipeForm.getVisibility(), user);
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
		}*/
		return new ModelAndView("redirect://home");
	}
}
