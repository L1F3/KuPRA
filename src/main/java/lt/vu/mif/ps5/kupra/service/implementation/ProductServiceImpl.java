package lt.vu.mif.ps5.kupra.service.implementation;

import java.sql.Blob;
import java.util.List;
import java.util.Set;

import lt.vu.mif.ps5.kupra.dao.ProductDao;
import lt.vu.mif.ps5.kupra.entity.Product;
import lt.vu.mif.ps5.kupra.entity.Unit;
import lt.vu.mif.ps5.kupra.service.ProductService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class ProductServiceImpl implements ProductService {

	static Logger log = Logger.getLogger(ProductServiceImpl.class.getName());

	private ProductDao productDao;

	@Autowired
	public ProductServiceImpl(ProductDao productDao) {
		this.productDao = productDao;
	}

	@Transactional(readOnly = true)
	public Product getProduct(long productId) {
		return productDao.get(productId);
	}

	@Transactional(readOnly = true)
	public List<Product> getAll() {
		return productDao.getAll();
	}

	@Transactional
	public long addProduct(String productName, Set<Unit> units,
			String description, String imageName, String imageType, Blob image) {
		Product product = new Product();
		product.setName(productName);
		product.setUnits(units);
		product.setDescription(description);
		product.setImgName(imageName);
		product.setImgType(imageType);
		product.setImg(image);
		productDao.persist(product);
		return product.getProductId();
	}

	@Transactional
	public void deleteProduct(long id) {
		productDao.delete(id);
	}

	@Transactional
	public void updateProduct(long id, String productName, Set<Unit> units,
			String description, String imageName, String imageType, Blob image) {
		Product product = productDao.get(id);
		product.setName(productName);
		product.setUnits(units);
		product.setDescription(description);
		product.setImgName(imageName);
		product.setImgType(imageType);
		product.setImg(image);
		productDao.persist(product);
	}

}
