package lt.vu.mif.ps5.kupra.service;

import java.sql.Blob;
import java.util.List;
import java.util.Set;

import lt.vu.mif.ps5.kupra.entity.Product;
import lt.vu.mif.ps5.kupra.entity.Unit;

public interface ProductService {

	Product getProduct(long productId);

	List<Product> getAll();

	long addProduct(String productName, /*Set<Unit> units,*/ String description,
			String imageName, String imageType, Blob image);
	
	void deleteProduct(long id);
	
	void updateProduct(long id, String productName, /*Set<Unit> units, */String description,
			String imageName, String imageType, Blob image);

}
