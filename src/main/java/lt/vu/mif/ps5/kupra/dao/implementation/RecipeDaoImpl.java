package lt.vu.mif.ps5.kupra.dao.implementation;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lt.vu.mif.ps5.kupra.dao.RecipeDao;
import lt.vu.mif.ps5.kupra.entity.Fridge;
import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.User;

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
	
	public List<Recipe> getForUser(User user) {
		Session sess = getSession();
		List<Recipe> recipes = new ArrayList<Recipe>();
		recipes = (List<Recipe>)sess.createCriteria(Recipe.class).
				add(Restrictions.eq("userId", user.getUserId())).
				list();
		return recipes;
	}
	
	public List<Recipe> getByName(String key) {
		Session sess = getSession();
		List<Recipe> recipes = new ArrayList<Recipe>();
		recipes = (List<Recipe>)sess.createCriteria(Recipe.class).
				add(Restrictions.like("name", "%"+key+"%")).
				add(Restrictions.eq("visibility", 1)).
				list();
		return recipes;
	}
	
	public List<Recipe> getRecipesByContainingProducts(Set<Fridge> fridgeItems, User user) {
		Session sess = getSession();
		List<Recipe> recipes = new ArrayList<Recipe>();
		Criteria criteria = sess.createCriteria(Recipe.class).
				createAlias("ingredients", "ingredients").
				add(Restrictions.like("loginname", user.getName()));

		Disjunction disjunction = Restrictions.disjunction();
		
		for (Fridge item : fridgeItems) {
			disjunction.add(Restrictions.eq("ingredients.productId", item.getProduct().getProductId()));
		}
		criteria.add(disjunction);
		return criteria.list();
	}
}