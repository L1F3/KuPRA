package lt.vu.mif.ps5.kupra.dao.implementation;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import lt.vu.mif.ps5.kupra.entity.Product;
import lt.vu.mif.ps5.kupra.dao.ProductDao;

@Component
public class ProductDaoImpl extends GenericDaoImpl<Product> implements ProductDao {
	
	@Autowired
    public ProductDaoImpl(SessionFactory sessionFactory) {
        super(sessionFactory, Product.class);
    }

    public void delete(long productId) {
        Product product = get(productId);
        getSession().delete(product);
    }
	
}