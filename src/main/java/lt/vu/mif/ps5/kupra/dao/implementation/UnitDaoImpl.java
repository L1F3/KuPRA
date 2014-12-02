package lt.vu.mif.ps5.kupra.dao.implementation;

import java.util.List;
import java.util.Set;

import lt.vu.mif.ps5.kupra.dao.UnitDao;
import lt.vu.mif.ps5.kupra.entity.Unit;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UnitDaoImpl extends GenericDaoImpl<Unit> implements UnitDao {

    @Autowired
    public UnitDaoImpl(SessionFactory sessionFactory) {
        super(sessionFactory, Unit.class);
    }

    @Override
    public void delete(long unitId) {
        Unit unit = get(unitId);
        getSession().delete(unit);
    }
    
    
}