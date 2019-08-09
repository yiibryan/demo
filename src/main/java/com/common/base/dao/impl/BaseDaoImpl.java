package com.common.base.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import com.common.base.dao.BaseDao;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;


/**
 * 
 * @author lxxx
 *
 * @param <T> entity
 * 
 */
@Repository
public class BaseDaoImpl<T> implements BaseDao<T> {
	
	@Resource(name="sqlSessionFactory")
	private SqlSessionFactory sessionFactory;
	
	private SqlSession session;
	
	/*------------------------------------*/
	
	private final static String find = ".find";
	
	private final static String load = ".load";
	
	
	/*------------------------------------*/
	
	private void openSession(){
		this.session = sessionFactory.openSession();
	}
	
	private void closeSession(){
		this.session.close();
	}
	
	@Override
	public List<T> find(T obj, Class<?> clazz){
		openSession();
		List<T> list = session.selectList(clazz.getName()+BaseDaoImpl.find, obj);
		closeSession();
		return list;
	}

	@Override
	public T load(T obj, Class<?> clazz) {
		openSession();
		T t = session.selectOne(clazz.getName()+BaseDaoImpl.load, obj);
		closeSession();
		return t;
	}

	@Override
	public List<T> find(T obj, String namespeace) {
		openSession();
		List<T> list = session.selectList(namespeace, obj);
		closeSession();
		return list;
	}

	public List<T> findByObj(Object obj, String namespace){
		openSession();
		List<T> list = session.selectList(namespace, obj);
		closeSession();
		return list;
	}

	@Override
	public T load(T obj, String namespeace) {
		openSession();
		T t = session.selectOne(namespeace, obj);
		closeSession();
		return t;
	}

	@Override
	public Object selectOne(Object obj, String namespeace) {
		openSession();
		Object o = session.selectOne(namespeace, obj);
		closeSession();
		return o;
	}

	@Override
	public List<Object> findObjects(Object obj, String namespeace) {
		openSession();
		List<Object> list = session.selectList(namespeace, obj);
		closeSession();
		return list;
	}
	@SuppressWarnings("unchecked")
	public <F>F query(Object obj, String namespeace){
		openSession();
		List<Object> list = session.selectList(namespeace, obj);
		closeSession();
		return (F) list;
	}
}
