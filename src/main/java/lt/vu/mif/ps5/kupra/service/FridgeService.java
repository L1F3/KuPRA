package lt.vu.mif.ps5.kupra.service;

import lt.vu.mif.ps5.kupra.entity.Product;
import lt.vu.mif.ps5.kupra.entity.Unit;
import lt.vu.mif.ps5.kupra.entity.User;

public interface FridgeService {

	long addFridge(User user, Product product, Unit unit, double amount);
	void replenish(long id, double amount);
	
}
