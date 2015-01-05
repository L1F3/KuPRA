package lt.vu.mif.ps5.kupra.service;

import java.sql.Blob;
import java.util.List;
import java.util.Set;

import lt.vu.mif.ps5.kupra.entity.Fridge;
import lt.vu.mif.ps5.kupra.entity.Meal;
import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.Role;
import lt.vu.mif.ps5.kupra.entity.User;

public interface UserService {

	User getUser(long userId);

	List<User> getAll();

	long addUser(String loginname, String username, String password,
			String email, String name, String lastname, String address,
			Role role);

	boolean hasRole(String role);

	String getUsername();

	void updateUser(long userId, String loginname, String username,
			String password, String email, String name, String lastname,
			String address, String description, String imageName,
			String imageType, Blob image, Role role);

	public Set<Meal> getMeals(User user);
	
	public User getUserByLoginname(String loginname);
	
	public Set<Fridge> getUserFridgeItems(User user);
	
	public void addMeal(long id, long recipeId);
	
	public void remove(long id, long recipeId);
	
	public void removeFridgeItem(long id, long userId);
}
