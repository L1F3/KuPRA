package lt.vu.mif.ps5.kupra.dao.implementation;

import java.util.List;
import java.util.Set;

import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.dao.MealDao;
import lt.vu.mif.ps5.kupra.entity.Fridge;
import lt.vu.mif.ps5.kupra.entity.Meal;
import lt.vu.mif.ps5.kupra.entity.User;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MealDaoImpl extends GenericDaoImpl<Meal> implements MealDao {
    
	@Autowired
    public MealDaoImpl(SessionFactory sessionFactory) {
        super(sessionFactory, Meal.class);
    }
	
    public void delete(long mealId) {
        Meal meal = get(mealId);
        getSession().delete(meal);
    }
}
