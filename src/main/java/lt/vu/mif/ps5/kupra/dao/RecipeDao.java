package lt.vu.mif.ps5.kupra.dao;

import java.util.List;
import java.util.Set;

import lt.vu.mif.ps5.kupra.entity.Fridge;
import lt.vu.mif.ps5.kupra.entity.RecipeImage;
import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.User;

public interface RecipeDao extends GenericDao<Recipe> {

	public List<Recipe> getTop();
	public List<Recipe> getForUser(User user);
	public List<Recipe> getByName(String key);
	public List<Recipe> getByNameFromUser(long user, String key);
	public List<Recipe> getRecipesByContainingProducts(Set<Fridge> fridgeItems, User user);
	public RecipeImage getDefaultImage();
}