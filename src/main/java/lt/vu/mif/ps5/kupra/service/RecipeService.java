package lt.vu.mif.ps5.kupra.service;

import java.sql.Blob;
import java.util.List;
import java.util.Set;

import lt.vu.mif.ps5.kupra.entity.Product;
import lt.vu.mif.ps5.kupra.entity.Recipe;

public interface RecipeService {
	
	Recipe getRecipe(long recId);

    List<Recipe> getAll();

    long addRecipe(String name, String imgName, Blob img, String imgType, Set<Product> productsOfRecipe, String description, int visibility);
    
}