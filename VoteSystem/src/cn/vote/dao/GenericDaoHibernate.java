package cn.vote.dao;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

public class GenericDaoHibernate<T extends Serializable, PK extends Serializable> implements GenericDAO<T, PK> {

	private Class<T> entityClass;

	public GenericDaoHibernate() {
		
	}
	public GenericDaoHibernate(Class<T> clazz) {
		this.entityClass = clazz;
	}
	
	@Resource
	private SessionFactory sessionFactory;

	@Override
	public PK insert(T t) {
		return (PK)sessionFactory.getCurrentSession().save(t);
	}

	@Override
	public void delete(T t) {
		sessionFactory.getCurrentSession().delete(t);
	}

	@Override
	public void update(T t) {
		sessionFactory.getCurrentSession().update(t);
	}

	@SuppressWarnings("unchecked")
	@Override
	public T queryById(PK id) {
		return (T) sessionFactory.getCurrentSession().get(entityClass, id);
	}

	@Override
	public List<T> queryAll() {
		System.out.println("baicai: + " + sessionFactory);
		System.out.println("nimei: " + sessionFactory.getCurrentSession());
		String hql = "from " + entityClass.getSimpleName();
		return queryForList(hql, null);
	}

	@SuppressWarnings("unchecked")
	@Override
	public T queryForObject(String hql, Object[] params) {
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		setQueryParams(query, params);
		return (T) query.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public T queryForTopObject(String hql, Object[] params) {
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		setQueryParams(query, params);
		return (T) query.setFirstResult(0).setMaxResults(1).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> queryForList(String hql, Object[] params) {
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		setQueryParams(query, params);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> queryForList(final String hql, final Object[] params,
			final int recordNum) {
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		setQueryParams(query, params);
		return query.setFirstResult(0).setMaxResults(recordNum).list();
	}

	private void setQueryParams(Query query, Object[] params) {
		if (null == params) {
			return;
		}
		for (int i = 0; i < params.length; i++) {
			query.setParameter(i, params[i]);
		}
	}
	
	public Class<T> getEntityClass() {
		return entityClass;
	}
	public void setEntityClass(Class<T> entityClass) {
		this.entityClass = entityClass;
	}
}
