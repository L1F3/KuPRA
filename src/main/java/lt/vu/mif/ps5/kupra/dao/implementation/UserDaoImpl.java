package lt.vu.mif.ps5.kupra.dao.implementation;

import java.util.List;

import lt.vu.mif.ps5.kupra.dao.UserDao;
import lt.vu.mif.ps5.kupra.entity.User;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserDaoImpl extends GenericDaoImpl<User> implements UserDao {
    
	@Autowired
    public UserDaoImpl(SessionFactory sessionFactory) {
        super(sessionFactory, User.class);
    }
	
    public void delete(long userId) {
        User user = get(userId);
        getSession().delete(user);
    }
    
    public User getUserByLoginname(String loginname) {
        Session sess = getSession();
        List<User> list = null;
        list = sess.createCriteria(User.class).
                add(Restrictions.eq("loginname", loginname)).list();
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }
    
    public Set<Fridge> getUserFridgeItems(String loginname) {
    	
    }

}
