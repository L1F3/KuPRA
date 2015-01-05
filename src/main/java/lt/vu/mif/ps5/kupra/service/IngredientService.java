package lt.vu.mif.ps5.kupra.service;

import java.util.List;

import lt.vu.mif.ps5.kupra.entity.Ingredient;
import lt.vu.mif.ps5.kupra.entity.Unit;
import lt.vu.mif.ps5.kupra.entity.Product;
import lt.vu.mif.ps5.kupra.entity.Recipe;

public interface IngredientService {
	
	Ingredient getIngredient(long ingrId);

    List<Ingredient> getAll();

    long addIngredient(Recipe recipe, Product product, double amount);
}