package lt.vu.mif.ps5.kupra.dao;

import lt.vu.mif.ps5.kupra.entity.User;

public interface UserDao extends GenericDao<User>{

	public void delete(long unitId);
}