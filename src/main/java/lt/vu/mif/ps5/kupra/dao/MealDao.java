package lt.vu.mif.ps5.kupra.dao;

import java.util.Set;

import lt.vu.mif.ps5.kupra.entity.Fridge;
import lt.vu.mif.ps5.kupra.entity.Meal;
import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.User;

public interface MealDao extends GenericDao<Meal>{

	public void delete(long mealId);
}