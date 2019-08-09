package com.common.util;

import com.common.annotation.TableSeg;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;



/**
 * 分表查询策略类
 * @author lxxx
 *
 */
public class SegUtil {
	
	MappedStatement mappedStatement;
	
	Object parameterObject;
	
	BoundSql boundSql;
	
	public SegUtil(MappedStatement mappedStatement, Object parameterObject, BoundSql boundSql){
		this.mappedStatement=mappedStatement;
		this.parameterObject=parameterObject;
		this.boundSql=boundSql;
	}
	
	/**
	 * 获取分表Sql
	 * @param sql 语句
	 * @param tableSeg 注解
	 * @return
	 */
	public String getActualSql(String sql, TableSeg tableSeg){
		
		String strategy = tableSeg.strategy();
		
		if(strategy.contains("%")){
			/*int number = Integer.parseInt(strategy.substring(strategy.lastIndexOf("%")));
			Class<?> objClass = parameterObject.getClass();
			Field[] fields = objClass.getFields();
			for (Field field : fields) {
				if(field.getAnnotation(Id.class)!=null){
					
				}
			}*/
			// TODO 取模的值
			return mod(sql, 0);
		}
		
		return sql;
	}

	private String mod(String sql, Integer index){
		
		// TODO 分表查询sql策略
		System.out.println("执行解析分表sql策略");
		return sql;
	}
	
}
