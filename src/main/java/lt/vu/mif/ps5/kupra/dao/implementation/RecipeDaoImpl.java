package lt.vu.mif.ps5.kupra.dao.implementation;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.hibernate.sql.JoinType;

import lt.vu.mif.ps5.kupra.entity.RecipeImage;
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

	public List<Recipe> getTop() {
		Session sess = getSession();
		List<Recipe> recipes = new ArrayList<Recipe>();
		recipes = (List<Recipe>) sess.createCriteria(Recipe.class)
				.addOrder(Order.desc("rating")).setMaxResults(16).list();
		return recipes;
	}

	public List<Recipe> getForUser(User user) {
		Session sess = getSession();
		List<Recipe> recipes = new ArrayList<Recipe>();
		recipes = (List<Recipe>) sess.createCriteria(Recipe.class)
				.add(Restrictions.eq("user.userId", user.getUserId())).list();
		return recipes;
	}

	public List<Recipe> getByName(String key) {
		Session sess = getSession();
		List<Recipe> recipes = new ArrayList<Recipe>();
		recipes = (List<Recipe>) sess.createCriteria(Recipe.class)
				.add(Restrictions.like("name", "%" + key + "%"))
				.add(Restrictions.eq("visibility", 1)).list();
		return recipes;
	}

	public List<Recipe> getRecipesByContainingProducts(Set<Fridge> fridgeItems,
			User user) {
		Session sess = getSession();
		List<Recipe> recipes = new ArrayList<Recipe>();
		Criteria criteria = sess.createCriteria(Recipe.class).
				createAlias("ingredients", "ing", Criteria.LEFT_JOIN);
		Conjunction conjunction = Restrictions.conjunction();
		for (Fridge item : fridgeItems) {
			conjunction.add(Restrictions.ne("ing.product.productId", item
					.getProduct().getProductId()));
		}
		criteria.add(conjunction);
		List<Recipe> notpos = criteria.list();
		
		Criteria criteria2 = sess.createCriteria(Recipe.class);
		List<Recipe> fulllist = criteria2.list();
		
		fulllist.removeAll(notpos);
		return fulllist;
	}

	public List<Recipe> getByNameFromUser(long user, String key) {
		Session sess = getSession();
		List<Recipe> recipes = new ArrayList<Recipe>();
		recipes = (List<Recipe>) sess.createCriteria(Recipe.class)
				.add(Restrictions.like("name", "%" + key + "%"))
				.add(Restrictions.eq("user.userId", user)).list();
		return recipes;
	}
	
	public RecipeImage getDefaultImage() {
		Session sess = getSession();
		RecipeImage image;
		List<RecipeImage> images = new ArrayList<RecipeImage>();
		long imgId = 0;
		images = (List<RecipeImage>) sess.createCriteria(RecipeImage.class)
				.add(Restrictions.eq("imgId", imgId)).list();
		return images.get(0);
	}
}