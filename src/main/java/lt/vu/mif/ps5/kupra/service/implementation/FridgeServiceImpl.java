package lt.vu.mif.ps5.kupra.service.implementation;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import lt.vu.mif.ps5.kupra.dao.FridgeDao;
import lt.vu.mif.ps5.kupra.entity.Fridge;
import lt.vu.mif.ps5.kupra.entity.Product;
import lt.vu.mif.ps5.kupra.entity.Unit;
import lt.vu.mif.ps5.kupra.entity.User;
import lt.vu.mif.ps5.kupra.service.FridgeService;

@Component
public class FridgeServiceImpl implements FridgeService {

	static Logger log = Logger.getLogger(FridgeServiceImpl.class.getName());
	
	private FridgeDao fridgeDao;
	
	@Autowired
	public FridgeServiceImpl(FridgeDao fridgeDao) {
		this.fridgeDao = fridgeDao;
	}
	
	@Transactional
	public long addFridge(User user, Product product, Unit unit, double amount) {
		Fridge fridge = new Fridge();
		fridge.setUser(user);
		fridge.setProduct(product);
		fridge.setUnit(unit);
		fridge.setAmount(amount);
		fridgeDao.persist(fridge);
		return fridge.getFrId();
	}

	@Transactional
	public void replenish(long id, double amount) {
		Fridge fridge = fridgeDao.get(id);
		fridge.setAmount(fridge.getAmount() + amount);
		fridgeDao.persist(fridge);		
	}

}
