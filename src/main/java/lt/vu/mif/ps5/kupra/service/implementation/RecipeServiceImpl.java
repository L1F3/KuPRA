package lt.vu.mif.ps5.kupra.service.implementation;

import java.sql.Blob;
import java.util.List;
import java.util.Set;

import lt.vu.mif.ps5.kupra.dao.RecipeDao;
import lt.vu.mif.ps5.kupra.entity.Product;
import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.service.RecipeService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class RecipeServiceImpl implements RecipeService {

	static Logger log = Logger.getLogger(RecipeServiceImpl.class.getName());
	
	private RecipeDao recipeDao;
	
	@Autowired
	public RecipeServiceImpl(RecipeDao recipeDao) {
		this.recipeDao = recipeDao;
	}
	
	@Transactional(readOnly = true)
	@Override
	public Recipe getRecipe(long recId) {
		return recipeDao.get(recId);
	}

	@Transactional(readOnly = true)
	@Override
	public List<Recipe> getAll() {
		return recipeDao.getAll();
	}

	@Transactional
	@Override
	public long addRecipe(String name, String imgName, Blob img, String imgType, Set<Product> productsOfRecipe, String description, int visibility) {
		Recipe recipe = new Recipe();
		recipe.setName(name);
		recipe.setImgName(imgName);
		recipe.setImg(img);
		recipe.setImgType(imgType);
		recipe.setProductsOfRecipe(productsOfRecipe);
		recipe.setDescription(description);
		recipe.setVisibility(visibility);
		recipeDao.persist(recipe);
		return recipe.getRecId();
	}
	
}