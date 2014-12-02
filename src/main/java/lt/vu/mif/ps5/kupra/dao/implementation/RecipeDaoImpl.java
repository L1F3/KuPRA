package lt.vu.mif.ps5.kupra.dao.implementation;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lt.vu.mif.ps5.kupra.dao.RecipeDao;
import lt.vu.mif.ps5.kupra.entity.Recipe;

@Component
public class RecipeDaoImpl extends GenericDaoImpl<Recipe> implements RecipeDao {

	@Autowired
	protected RecipeDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory, Recipe.class);
	}

	@Override
	public void delete(long recipeId) {
		Recipe recipe = get(recipeId);
		getSession().delete(recipe);
	}
		
}