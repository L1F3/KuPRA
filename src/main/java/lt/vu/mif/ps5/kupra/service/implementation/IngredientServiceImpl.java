package lt.vu.mif.ps5.kupra.service.implementation;

import java.util.List;

import lt.vu.mif.ps5.kupra.dao.IngredientDao;
import lt.vu.mif.ps5.kupra.dao.UnitDao;
import lt.vu.mif.ps5.kupra.entity.Ingredient;
import lt.vu.mif.ps5.kupra.entity.Product;
import lt.vu.mif.ps5.kupra.entity.Recipe;
import lt.vu.mif.ps5.kupra.entity.Unit;
import lt.vu.mif.ps5.kupra.service.IngredientService;
import lt.vu.mif.ps5.kupra.service.UnitService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class IngredientServiceImpl implements IngredientService {

	static Logger log = Logger.getLogger(IngredientServiceImpl.class.getName());
	
	private IngredientDao ingrDao;
	
	@Autowired
	public IngredientServiceImpl(IngredientDao ingrDao) {
		this.ingrDao = ingrDao;
	}
	
	@Transactional(readOnly = true)
	public Ingredient getIngredient(long ingrId) {
		return ingrDao.get(ingrId);
	}

	@Transactional(readOnly = true)
	public List<Ingredient> getAll() {
		return ingrDao.getAll();
	}

	@Transactional
	public long addIngredient(Recipe recipe, Product product, double amount) {
		Ingredient ingr = new Ingredient();
		ingr.setAmount(amount);
		ingr.setProduct(product);
		ingr.setRecipe(recipe);
		ingrDao.persist(ingr);
		return ingr.getIngrId();
	}
	
}