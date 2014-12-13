package lt.vu.mif.ps5.kupra.service;

import java.sql.Blob;
import java.util.List;
import java.util.Set;

import lt.vu.mif.ps5.kupra.entity.Product;
import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.User;

public interface RecipeService {

	Recipe getRecipe(long recId);

	List<Recipe> getAll();

	long addRecipe(String name, String imgName, Blob img, String imgType,
			Set<Product> productsOfRecipe, String description, int visibility, User user);

	List<Recipe> getTopRecipes();
	List<Recipe> getForUser(User user);
	List<Recipe> getByName(String key);
	List<Recipe> getByNameFromUser(long user, String key);
}