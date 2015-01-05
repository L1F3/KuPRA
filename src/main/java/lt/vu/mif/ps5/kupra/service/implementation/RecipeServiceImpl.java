package lt.vu.mif.ps5.kupra.service.implementation;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import lt.vu.mif.ps5.kupra.dao.RecipeDao;
import lt.vu.mif.ps5.kupra.entity.Fridge;
import lt.vu.mif.ps5.kupra.entity.Ingredient;
import lt.vu.mif.ps5.kupra.entity.RecipeImage;
import lt.vu.mif.ps5.kupra.entity.Product;
import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.User;
import lt.vu.mif.ps5.kupra.service.RecipeService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Component
public class RecipeServiceImpl implements RecipeService {

	static Logger log = Logger.getLogger(RecipeServiceImpl.class.getName());

	private RecipeDao recipeDao;

	@Autowired
	public RecipeServiceImpl(RecipeDao recipeDao) {
		this.recipeDao = recipeDao;
	}

	@Transactional(readOnly = true)
	public Recipe getRecipe(long recId) {
		return recipeDao.get(recId);
	}

	@Transactional(readOnly = true)
	public List<Recipe> getAll() {
		return recipeDao.getAll();
	}

	@Transactional
	public long addRecipe(String name, 
			List<MultipartFile> files,
			Set<Ingredient> ingredientsOfRecipe, 
			String description, 
			int visibility,
			User user) {
		Recipe recipe = new Recipe();
		recipe.setName(name);
		recipe.setIngredients(ingredientsOfRecipe);
		recipe.setDescription(description);
		recipe.setVisibility(visibility);
		recipe.setUser(user);
		
	
		
		try {
			recipe.setImg(new SerialBlob(files.get(0).getBytes()));
			recipe.setImgName(files.get(0).getOriginalFilename());
			recipe.setImgType(files.get(0).getContentType());
		} catch(SerialException e) {
			System.out.println("Serial exception");
		} catch(IOException e) {
			System.out.println("IO exception");
		} catch(SQLException e) {
			System.out.println("SQL exception");
		}

		List<RecipeImage> image = recipe.getImages();

		for (MultipartFile file : files) {
			try {
				RecipeImage ImgPrep = new RecipeImage();
				Blob img = new SerialBlob(file.getBytes());
				ImgPrep.setImg(img);
				ImgPrep.setImgName(file.getOriginalFilename());
				ImgPrep.setImgType(file.getContentType());
				ImgPrep.setRecipe(recipe);
				image.add(ImgPrep);
			} catch (SQLException e) {
				System.out.println("Blob creating error");
			} catch (IOException e) {
				System.out.println("Blob creating error");
			}
		}
		
		recipeDao.persist(recipe);
		return recipe.getRecId();
	}
	
	@Transactional(readOnly = true)
	public List<Recipe> getTopRecipes() {
		return recipeDao.getTop();
	}

	@Transactional(readOnly = true)
	public List<Recipe> getForUser(User user) {
		return recipeDao.getForUser(user);
	}

	@Transactional(readOnly = true)
	public List<Recipe> getByName(String key) {
		return recipeDao.getByName(key);
	}

	@Transactional(readOnly = true)
	public List<Recipe> getByNameFromUser(long user, String key) {
		return recipeDao.getByNameFromUser(user, key);
	}

	@Transactional(readOnly = true)
	public List<Recipe> getRecipesByContainingProducts(Set<Fridge> fridgeItems,
			User user) {
		return recipeDao.getRecipesByContainingProducts(fridgeItems, user);
	}

	@Transactional(readOnly = true)
	public RecipeImage getDefaultImage() {
		return recipeDao.getDefaultImage();
	}
}