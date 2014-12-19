package lt.vu.mif.ps5.kupra.dao.implementation;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lt.vu.mif.ps5.kupra.entity.Product;
import lt.vu.mif.ps5.kupra.entity.RecipeImage;
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
	
	public RecipeImage getDefaultImage() {
		Session sess = getSession();
		RecipeImage image;
		List<RecipeImage> images = new ArrayList<RecipeImage>();
		long imgId = 0;
		images = (List<RecipeImage>) sess.createCriteria(RecipeImage.class)
				.add(Restrictions.eq("imgId", imgId)).list();
		return images.get(0);
	}
}