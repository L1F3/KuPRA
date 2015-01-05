package lt.vu.mif.ps5.kupra.dao;

import lt.vu.mif.ps5.kupra.entity.Ingredient;
import lt.vu.mif.ps5.kupra.entity.Product;

public interface IngredientDao extends GenericDao<Ingredient> {
	public void delete(long ingrId);
}