package lt.vu.mif.ps5.kupra.dao.implementation;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lt.vu.mif.ps5.kupra.entity.Ingredient;
import lt.vu.mif.ps5.kupra.entity.Product;
import lt.vu.mif.ps5.kupra.entity.RecipeImage;
import lt.vu.mif.ps5.kupra.dao.IngredientDao;
import lt.vu.mif.ps5.kupra.dao.ProductDao;

@Component
public class IngredientDaoImpl extends GenericDaoImpl<Ingredient> implements IngredientDao {
	
	@Autowired
    public IngredientDaoImpl(SessionFactory sessionFactory) {
        super(sessionFactory, Ingredient.class);
    }

    public void delete(long ingrId) {
        Ingredient ingr = get(ingrId);
        getSession().delete(ingr);
    }
}