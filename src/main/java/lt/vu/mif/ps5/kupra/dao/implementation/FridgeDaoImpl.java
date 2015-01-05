package lt.vu.mif.ps5.kupra.dao.implementation;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lt.vu.mif.ps5.kupra.dao.FridgeDao;
import lt.vu.mif.ps5.kupra.entity.Fridge;
import lt.vu.mif.ps5.kupra.entity.Unit;

@Component
public class FridgeDaoImpl extends GenericDaoImpl<Fridge> implements FridgeDao {

	@Autowired
	protected FridgeDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory, Fridge.class);
	}

	@Override
	public void delete(long id) {
		Fridge fridge = get(id);
		getSession().delete(fridge);
	}

}
