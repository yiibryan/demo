package com.common.base.dao;

import java.util.List;

public interface BaseDao<T> {
	/**
	 * 按实体非空列查找
	 * @param obj 实体
	 * @param clazz mapper
	 * @return
	 */
	public List<T> find(T obj, Class<?> clazz);
	
	public T load(T obj, Class<?> clazz);
	
	public List<T> find(T obj, String namespeace);
	
	public List<T> findByObj(Object obj, String namespeace);
	
	public List<Object> findObjects(Object obj, String namespeace);
	
	public T load(T obj, String namespeace);
	
	public Object selectOne(Object obj, String namespeace);
	public <F>F query(Object obj, String namespeace);
	
}
