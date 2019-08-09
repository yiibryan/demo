package com.common.base.service.impl;

import com.common.base.service.BaseService;
import org.springframework.stereotype.Service;


/**
 * 
 * @author lxxx
 *
 * @param <T> entity
 * 
 */
@Service
public abstract class BaseServiceImpl<T> implements BaseService<T> {
	
	/*@Autowired
	private BaseDao<T> baseDao;
	
	@Override
	public List<T> find(T obj, Class<?> clazz) {
		return baseDao.find(obj, clazz);
	}

	@Override
	public T load(T obj, Class<?> clazz) {
		return baseDao.load(obj, clazz);
	}

	@Override
	public List<T> find(T obj, String namespeace) {
		return baseDao.find(obj, namespeace);
	}
	@Override
	public List<T> findByObj(Object obj, String namespeace){
		return baseDao.findByObj(obj, namespeace);
	}
	@Override
	public List<Object> findObjects(Object obj, String namespeace){
		return baseDao.findObjects(obj, namespeace);
	}
	
	@Override
	public T load(T obj, String namespeace) {
		return baseDao.load(obj, namespeace);
	}
	
	@Override
	public Object selectOne(Object obj, String namespeace) {
		return baseDao.selectOne(obj, namespeace);
	}
	
	public <F>F query(Object obj, String namespeace){
		return baseDao.query(obj, namespeace);
	}*/
}
