package lt.vu.mif.ps5.kupra.service.implementation;

import java.sql.Blob;
import java.util.List;
import java.util.Set;

import lt.vu.mif.ps5.kupra.dao.RecipeDao;
import lt.vu.mif.ps5.kupra.entity.Fridge;
import lt.vu.mif.ps5.kupra.entity.Image;
import lt.vu.mif.ps5.kupra.entity.Product;
import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.User;
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
	public Recipe getRecipe(long recId) {
		return recipeDao.get(recId);
	}

	@Transactional(readOnly = true)
	public List<Recipe> getAll() {
		return recipeDao.getAll();
	}

	@Transactional
	public long addRecipe(String name, String imgName, Blob img,
			String imgType, Set<Product> productsOfRecipe, String description,
			int visibility, User user) {
		Recipe recipe = new Recipe();
		recipe.setName(name);
		/*recipe.setImgName(imgName);
		recipe.setImg(img);
		recipe.setImgType(imgType);*/
		// recipe.setProductsOfRecipe(productsOfRecipe);
		recipe.setDescription(description);
		recipe.setVisibility(visibility);
		recipe.setUser(user);
		
		List<Image> image = recipe.getImages();
		Image ImgPrep = new Image();
		ImgPrep.setImg(img);
		ImgPrep.setImgName(imgName);
		ImgPrep.setImgType(imgType);
		image.add(ImgPrep);
		
		recipeDao.persist(recipe);
		return recipe.getRecId();
	}

	@Transactional(readOnly = true)
	public List<Recipe> getTopRecipes() {
		return recipeDao.getTop();
	}

	@Transactional(readOnly = true)
	public List<Recipe> getForUser(User user) {
		return recipeDao.getForUser(user);
	}

	@Transactional(readOnly = true)
	public List<Recipe> getByName(String key) {
		return recipeDao.getByName(key);
	}

	@Transactional(readOnly = true)
	public List<Recipe> getByNameFromUser(long user, String key) {
		return recipeDao.getByNameFromUser(user, key);
	}

	@Transactional(readOnly = true)
	public List<Recipe> getRecipesByContainingProducts(Set<Fridge> fridgeItems, User user) {
		return recipeDao.getRecipesByContainingProducts(fridgeItems, user);
	}

	@Transactional(readOnly = true)
	public Image getDefaultImage() {
		return recipeDao.getDefaultImage();
	}
}