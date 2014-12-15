package lt.vu.mif.ps5.kupra.dao;

import java.util.Set;

import lt.vu.mif.ps5.kupra.entity.Fridge;
import lt.vu.mif.ps5.kupra.entity.User;

public interface UserDao extends GenericDao<User>{

	public void delete(long unitId);
	public User getUserByLoginname(String loginname);
	public Set<Fridge> getUserFridgeItems(User user);
}