package lt.vu.mif.ps5.kupra.dao.implementation;

import java.util.List;
import java.util.Set;
import lt.vu.mif.ps5.kupra.entity.Unit;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UnitDaoImpl extends GenericDaoImpl<Expo> implements UnitDao {

    @Autowired
    public UnitDaoImpl(SessionFactory sessionFactory) {
        super(sessionFactory, Unit.class);
    }
}