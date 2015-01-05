package lt.vu.mif.ps5.kupra.service.implementation;

import java.sql.Blob;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import lt.vu.mif.ps5.kupra.dao.FridgeDao;
import lt.vu.mif.ps5.kupra.dao.MealDao;
import lt.vu.mif.ps5.kupra.dao.ProductDao;
import lt.vu.mif.ps5.kupra.dao.UserDao;
import lt.vu.mif.ps5.kupra.dao.RecipeDao;
import lt.vu.mif.ps5.kupra.entity.Fridge;
import lt.vu.mif.ps5.kupra.entity.Meal;
import lt.vu.mif.ps5.kupra.entity.Product;
import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.Role;
import lt.vu.mif.ps5.kupra.entity.User;
import lt.vu.mif.ps5.kupra.service.UserService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class UserServiceImpl implements UserService {

	static Logger log = Logger.getLogger(UserServiceImpl.class.getName());

	private UserDao userDao;
	private RecipeDao recipeDao;
	private FridgeDao fridgeDao;
	private MealDao mealDao;

	@Autowired
	public UserServiceImpl(UserDao userDao, RecipeDao recipeDao, FridgeDao fridgeDao, MealDao mealDao) {
		this.userDao = userDao;
		this.mealDao = mealDao;
		this.recipeDao = recipeDao;
		this.fridgeDao = fridgeDao;
	}

	@Transactional(readOnly = true)
	public User getUser(long userId) {
		return userDao.get(userId);
	}

	@Transactional(readOnly = true)
	public List<User> getAll() {
		return userDao.getAll();
	}

	@Transactional
	public long addUser(String loginname, String username, String password,
			String email, String name, String lastname, String address,
			Role role) {
		User user = new User();
		user.setLoginname(loginname);
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setName(name);
		user.setLastname(lastname);
		user.setAddress(address);
		user.setRole(role);
		userDao.persist(user);
		return user.getUserId();
	}

	public boolean hasRole(String role) {
		Authentication authentication = getAuthentication();

		if (authentication == null)
			return false;

		for (GrantedAuthority authority : authentication.getAuthorities()) {
			if (role.equals(authority.getAuthority())) {
				return true;
			}
		}

		return false;
	}

	public String getUsername() {
		Authentication authentication = getAuthentication();

		if (authentication == null)
			return null;

		return authentication.getName();
	}

	private Authentication getAuthentication() {
		SecurityContext context = SecurityContextHolder.getContext();
		if (context == null)
			return null;

		Authentication authentication = context.getAuthentication();
		if (authentication == null)
			return null;

		return authentication;
	}

	@Transactional
	public void updateUser(long userId, String loginname, String username,
			String password, String email, String name, String lastname,
			String address, String description, String imageName,
			String imageType, Blob image, Role role) {
		User user = userDao.get(userId);
		user.setLoginname(loginname);
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setName(name);
		user.setLastname(lastname);
		user.setAddress(address);
		user.setDescription(description);
		user.setImgName(imageName);
		user.setImgType(imageType);
		user.setImg(image);
		user.setRole(role);
		userDao.persist(user);
	}

	@Transactional(readOnly = true)
	public Set<Recipe> getMeals(User user) {
		return userDao.getUserMeals(user);
	}

	@Transactional(readOnly = true)
	public User getUserByLoginname(String loginname) {
		return userDao.getUserByLoginname(loginname);
	}

	@Transactional(readOnly = true)
	public Set<Fridge> getUserFridgeItems(User user) {
		return userDao.getUserFridgeItems(user);
	}

	@Transactional
	public void addMeal(long id, long recipeId) {
		User user = userDao.get(id);
		Recipe recipe = recipeDao.get(recipeId);
		Set<Meal> meals = user.getMeals();
		Meal meal = new Meal();
		meal.setRecipe(recipe);
		meal.setUser(user);
		meals.add(meal);
		user.setMeals(meals);
	}

	@Transactional
	public void remove(long id, long recipeId) {

        User user = userDao.get(id);
        Recipe rec = recipeDao.get(recipeId);
        Set<Meal> list = userDao.getUserMeals(user);
		for (Iterator<Meal> iterator = list.iterator(); iterator.hasNext();) {
			Meal meal = iterator.next();
			if(meal.getRecipe().getRecId() == recipeId) {
				System.out.println(meal.getRecipe().getRecId() + " " + recipeId);
				iterator.remove();
				userDao.persist(user);
				Set<Meal> recmeals = rec.getMeals();
				recmeals.remove(meal);
				recipeDao.persist(rec);
				mealDao.delete(meal.getMealId());
			}
		}
        //list.remove(rec);
        user.setMeals(list);
	}

	@Transactional
	public void removeFridgeItem(long id, long userId) {
        User user = userDao.get(userId);
        System.out.println("oho0");
        Fridge fridgeItem = fridgeDao.get(id);
        System.out.println("oho1");
        Set<Fridge> list = userDao.getUserFridgeItems(user);
        System.out.println("oho2");
        list.remove(fridgeItem);
        System.out.println("oho3");
        user.setFridgeItems(list);
        Set<Fridge> productFridges = fridgeItem.getProduct().getFridgeItems();
        productFridges.remove(fridgeItem);
        Set<Fridge> unitFridges = fridgeItem.getUnit().getFridgeItems();
        unitFridges.remove(fridgeItem);
        userDao.persist(user);
        System.out.println("oho4");  
        fridgeDao.delete(id);
        System.out.println("oho5");
        //list.remove(rec);
        //user.setMeals(list);
        
	}
}
