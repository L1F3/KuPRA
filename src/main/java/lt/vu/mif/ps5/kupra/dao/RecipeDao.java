package lt.vu.mif.ps5.kupra.dao;

import java.util.List;
import java.util.Set;

import lt.vu.mif.ps5.kupra.entity.Fridge;
import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.User;

public interface RecipeDao extends GenericDao<Recipe> {

	List<Recipe> getTop();
	List<Recipe> getForUser(User user);
	List<Recipe> getByName(String key);
	List<Recipe> getByNameFromUser(long user, String key);
	List<Recipe> getRecipesByContainingProducts(Set<Fridge> fridgeItems, User user);
}