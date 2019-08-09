package com.common.intercepts;

import java.sql.Connection;
import java.util.Properties;

import com.common.annotation.TableSeg;
import com.common.util.SegUtil;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.DefaultReflectorFactory;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.ReflectorFactory;
import org.apache.ibatis.reflection.factory.DefaultObjectFactory;
import org.apache.ibatis.reflection.factory.ObjectFactory;
import org.apache.ibatis.reflection.wrapper.DefaultObjectWrapperFactory;
import org.apache.ibatis.reflection.wrapper.ObjectWrapperFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



/**
 * 分表拦截器
 * @author lxxx
 *
 */
@Intercepts({ @Signature(type = StatementHandler.class, method = "prepare", args = { Connection.class, Integer.class }) }) 
public class TableSegInterceptor implements Interceptor {  
	private static final Logger logger = LoggerFactory.getLogger(TableSegInterceptor.class); 
	private static final ObjectFactory DEFAULT_OBJECT_FACTORY = new DefaultObjectFactory();  
    private static final ObjectWrapperFactory DEFAULT_OBJECT_WRAPPER_FACTORY = new DefaultObjectWrapperFactory(); 
    private static final ReflectorFactory DEFAULT_REFLECTOR_FACTORY = new DefaultReflectorFactory();
	
    @Override  
    public Object intercept(Invocation invocation) throws Throwable {
    	StatementHandler statementHandler = (StatementHandler) invocation.getTarget();
    	MetaObject metaStatementHandler = MetaObject.forObject(
    			statementHandler, 
    			DEFAULT_OBJECT_FACTORY, 
    			DEFAULT_OBJECT_WRAPPER_FACTORY, 
    			DEFAULT_REFLECTOR_FACTORY
    	);  
    	String originalSql = (String) metaStatementHandler  
                .getValue("delegate.boundSql.sql");  
    	BoundSql boundSql = (BoundSql) metaStatementHandler.getValue("delegate.boundSql");
    	Object parameterObject = metaStatementHandler.getValue("delegate.boundSql.parameterObject");  
        
    	if (originalSql!=null&&!originalSql.equals("")) {  
            MappedStatement mappedStatement = (MappedStatement) metaStatementHandler  
                    .getValue("delegate.mappedStatement");  
            String id = mappedStatement.getId();  
            String className = id.substring(0, id.lastIndexOf("."));  
            Class<?>  classObj = Class.forName(className);  
            //根据配置自动生成分表SQL  
            TableSeg tableSeg = classObj.getAnnotation(TableSeg.class);
            if(tableSeg!=null){  
            	logger.info("intercept:分表查询，sql："+originalSql);
                SegUtil as = new SegUtil(mappedStatement, parameterObject, boundSql);
                String newSql=as.getActualSql(originalSql, tableSeg);  
                if(newSql!=null){  
                	logger.info("intercept:分表查询，newSql："+originalSql);
                    metaStatementHandler.setValue("delegate.boundSql.sql", newSql);  
                }
            }  
        }  
    	
        return invocation.proceed();  
    }  
  
    @Override  
    public Object plugin(Object target) {  
        // 当目标类是StatementHandler类型时，才包装目标类，否者直接返回目标本身,减少目标被代理的  
        // 次数  
        if (target instanceof StatementHandler) {  
            return Plugin.wrap(target, this);  
        } else {  
            return target;  
        }  
    }  
  
    @Override  
    public void setProperties(Properties properties) { 
  
    }  
}