package lt.vu.mif.ps5.kupra.dao;

import java.util.List;
import java.util.Set;

import lt.vu.mif.ps5.kupra.entity.Recipe;

public interface RecipeDao extends GenericDao<Recipe> {

	List<Recipe> getTop();

}