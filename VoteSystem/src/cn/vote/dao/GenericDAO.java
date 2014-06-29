package cn.vote.dao;

import java.io.Serializable;
import java.util.List;

public interface GenericDAO<T extends Serializable, PK extends Serializable> {

	PK insert(T t);

	void delete(T t);

	void update(T t);

	T queryById(PK id);

	List<T> queryAll();
	
	T queryForObject(String hql, Object[] params);
	
	T queryForTopObject(String hql, Object[] params);
	
	List<T> queryForList(String hql, Object[] params);
	
	List<T> queryForList(final String hql, final Object[] params,
			final int recordNum);
}

