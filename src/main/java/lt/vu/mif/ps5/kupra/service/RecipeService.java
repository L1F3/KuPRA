package lt.vu.mif.ps5.kupra.service;

import java.sql.Blob;
import java.util.List;
import java.util.Set;

import lt.vu.mif.ps5.kupra.entity.Fridge;
import lt.vu.mif.ps5.kupra.entity.Ingredient;
import lt.vu.mif.ps5.kupra.entity.RecipeImage;
import lt.vu.mif.ps5.kupra.entity.Product;
import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.User;

import org.springframework.web.multipart.MultipartFile;

public interface RecipeService {

	Recipe getRecipe(long recId);

	List<Recipe> getAll();
	
	long addRecipe(String name, List<MultipartFile> files, List<Long> ingrsIds, List<Double> amounts,
			/*Set<Ingredient> ingredientsOfRecipe,*/ String description, int visibility, User user);

	List<Recipe> getTopRecipes();
	List<Recipe> getForUser(User user);
	List<Recipe> getByName(String key);
	List<Recipe> getByNameFromUser(long user, String key);
	public List<Recipe> getRecipesByContainingProducts(Set<Fridge> fridgeItems, User user);
	public RecipeImage getDefaultImage();
}