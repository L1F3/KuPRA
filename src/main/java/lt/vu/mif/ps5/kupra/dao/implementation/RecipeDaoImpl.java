package lt.vu.mif.ps5.kupra.dao.implementation;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
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

	public void delete(long recipeId) {
		Recipe recipe = get(recipeId);
		getSession().delete(recipe);
	}
	
	public List<Recipe> getTop () {
		Session sess = getSession();
		List<Recipe> recipes = new ArrayList<Recipe>();
		recipes = (List<Recipe>)sess.createCriteria(Recipe.class).
				addOrder(Order.desc("rating")).
				setMaxResults(16).
				list();
		return recipes;
	}
		
}