package lt.vu.mif.ps5.kupra.service.implementation;

import java.util.List;

import lt.vu.mif.ps5.kupra.dao.UserDao;
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
	@Override
	public User getUser(long userId) {
		return userDao.get(userId);
	}

	@Transactional(readOnly = true)
	@Override
	public List<User> getAll() {
		return userDao.getAll();
	}

	@Transactional
	@Override
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
}