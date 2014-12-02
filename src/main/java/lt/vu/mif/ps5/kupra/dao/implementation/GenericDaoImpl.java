/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package lt.vu.mif.ps5.kupra.dao.implementation;

import java.util.List;
import lt.vu.mif.ps5.kupra.dao.GenericDao;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public abstract class GenericDaoImpl<T> implements GenericDao<T> {
	private SessionFactory sessionFactory;

	private Class<T> persistingClass;

	protected GenericDaoImpl(SessionFactory sessionFactory,
			Class<T> persistingClass) {
		this.sessionFactory = sessionFactory;
		this.persistingClass = persistingClass;
	}

	@Override
	public List<T> getAll() {
		Session sess = getSession();

		@SuppressWarnings("unchecked")
		List<T> list = (List<T>) sess.createCriteria(persistingClass).list();
		return list;
	}

	@Override
	public T get(long id) {
		return (T) getSession().get(persistingClass, id);

	}

	@Override
	public void persist(T entity) {
		getSession().persist(entity);
	}

	protected Session getSession() throws HibernateException {
		Session sess = sessionFactory.getCurrentSession();
		return sess;
	}
}