package com.common.intercepts;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Properties;
import java.util.UUID;

import com.common.util.ToolKit;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;



/**
 * 拦截器
 * @author lxxx
 *
 */
@Intercepts({@Signature(  
        type=Executor.class,  
        method="update",  
        args={MappedStatement.class,Object.class})})
public class GeneratorIdInterceptor implements Interceptor {  
	
    @SuppressWarnings({ "unchecked", "rawtypes" })
	@Override  
    public Object intercept(Invocation invocation) throws Throwable {
        String methodName = invocation.getMethod().getName(); 
        if(methodName.equals("update")){
            Object parameter = invocation.getArgs()[1];  
            Class clazz = parameter.getClass();
            Field fields[] = parameter.getClass().getDeclaredFields();
    		try {
    			for (Field field : fields) {
    				if(field.isAnnotationPresent(com.common.annotation.UUID.class)){
    					String getField = "get"+ ToolKit.getMethodName(field.getName());
    					Method getMethod = clazz.getMethod(getField);
    					Object o = getMethod.invoke(parameter);
    					if(o==null){
    						String setField = "set"+ToolKit.getMethodName(field.getName());
        					Method setMethod = clazz.getMethod(setField, String.class);
        					setMethod.invoke(parameter, UUID.randomUUID().toString().replaceAll("-", ""));
    					}
    				}
    			}
    		} catch (IllegalArgumentException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		} catch (IllegalAccessException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		} catch (Throwable e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}  
              
        }  
        return invocation.proceed();  
    }  
  
    @Override  
    public Object plugin(Object target) {  
        // 当目标类是StatementHandler类型时，才包装目标类，否者直接返回目标本身,减少目标被代理的  
        // 次数  
        if (target instanceof Executor) {  
            return Plugin.wrap(target, this);  
        } else {  
            return target;  
        }  
    }  
  
    @Override  
    public void setProperties(Properties properties) { 
  
    }  
}