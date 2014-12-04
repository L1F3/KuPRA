package lt.vu.mif.ps5.kupra.service.implementation;

import java.sql.Blob;
import java.util.List;
import java.util.Set;

import lt.vu.mif.ps5.kupra.dao.UserDao;
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

	@Autowired
	public UserServiceImpl(UserDao userDao) {
		this.userDao = userDao;
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

	public Set<Recipe> getMeals() {
		List<User> users = getAll();
		
		String username = getUsername();
		
		for (User user : users) {
			if (user.getName().equals(username)) {
				return user.getMeals();
			}
		}
		return null;
	}
}
