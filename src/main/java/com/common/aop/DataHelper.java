package com.common.aop;

import com.common.Constants;
import com.common.annotation.DataFormat;
import com.common.annotation.DataTransformation;
import com.common.annotation.IsBaseBean;
import com.common.model.BaseBean;
import com.common.rest.HeaderContext;
import com.common.util.DateUtil;
import com.common.util.ToolKit;
import com.github.pagehelper.Page;
import com.gjbigdata.realtysale.houses.roominfo.domain.RoomForCache;
import com.gjbigdata.realtysale.sys.dict.domain.AreaBean;
import com.gjbigdata.realtysale.sys.dict.service.DictService;
import com.guojiu.base.rest.BaseResponse;
import com.guojiu.base.rest.DataResponse;
import com.guojiu.base.rest.PageResponse;
import com.guojiu.rediscache.RedisCacheService;
import com.guojiu.rediscache.init.RedisCacheInitService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/**
 * service 回传数据修改
 *
 * @author lxxx
 */
@Aspect
@Component
public class DataHelper {

    private static final Logger logger = LoggerFactory.getLogger(DataHelper.class);

    @Pointcut("execution(* com.gjbigdata..service.*.*(..)) && !execution(* com.gjbigdata..websocket.service.*.*(..)) ")
    public void pointcut() {
    }

    @Pointcut("execution(* com.gjbigdata..controller.*.*(..)) && !execution(* com.gjbigdata..websocket.service.*.*(..)) ")
    public void pointcut2() {
    }

    @Resource
    private DataHelperDictService dictService;

    @Resource
    private RedisCacheService redisCacheService;

    @Resource(name = "roomInitServiceImpl")
    private RedisCacheInitService roomInitService;

    //分页参数回传
    @SuppressWarnings("unchecked")
    @AfterReturning(value = "pointcut2()", returning = "obj")
    public void afterT(Object obj) {
        if (obj != null) {
            //判断返回值类型
            if (obj instanceof PageResponse) {
                PageResponse<Object> reObj = (PageResponse<Object>) obj;
                //分页属性回传

                Object resultObj = reObj.getData();

                if (resultObj instanceof Page) {
                    Page<?> resultPage = (Page<?>) resultObj;
                    reObj.setPageNum(resultPage.getPageNum());
                    reObj.setPageSize(resultPage.getPageSize());
                    reObj.setTotalRecords(new Long(resultPage.getTotal()).intValue());
                    reObj.setTotalPages(resultPage.getPages());
                    obj = reObj;
                }
            }
        }
    }

    //日志打印
    @Around("pointcut2()")
    public Object around(ProceedingJoinPoint pjp) throws Throwable {
        long beginTime = System.currentTimeMillis();
        RequestAttributes ra = RequestContextHolder.getRequestAttributes();
        ServletRequestAttributes sra = (ServletRequestAttributes) ra;
        HttpServletRequest request = sra.getRequest();

        String url = request.getRequestURL().toString();
        String method = request.getMethod();
        String uri = request.getRequestURI();
        String queryString = request.getQueryString();
        logger.info("请求开始-- url: {}, method: {}, uri: {}, params: {}", url, method, uri, queryString);

        // result的值就是被拦截方法的返回值
        Object result;
        try {
            result = pjp.proceed();
        } catch (Exception  e) {
            e.printStackTrace();
            result = new BaseResponse(false, "500", "服务器异常");
        }
//        Object result = pjp.proceed();
        long costMs = System.currentTimeMillis() - beginTime;
        logger.info("请求结束-- uri: {} 耗时：{}ms", uri, costMs); //--打包放开
//        Gson gson = new Gson();//--打包注释掉
//        logger.info("请求结束-- 耗时：{}ms, return:{}", costMs, gson.toJson(result));//--打包注释掉
        return result;
    }

    //返回值格式化 针对实体类
    @AfterReturning(value = "pointcut()", returning = "obj")
    public void after(Object obj) {
        if (obj != null) {
            //判断返回值类型
            if (forList(obj) || forMap(obj) || forResoultBean(obj)) {
                return;
            }/*else{
				Class<?> clazz = obj.getClass();
				Field[] fields = clazz.getDeclaredFields();
				chian(clazz, fields, obj);
			}*/
        }
    }

    //返回值格式化 针对非实体类
    @SuppressWarnings("unchecked")
    @Around("pointcut()")
    public Object afterBydit(ProceedingJoinPoint pjp) {
        MethodSignature signature = (MethodSignature) pjp.getSignature();
        Method method = signature.getMethod(); //获取被拦截的方法  
        String methodName = method.getName(); //获取被拦截的方法名  

        logger.info("方法：{},返回值修改", methodName);
        Object result = null;
        Object bk = null;
        try {
            bk = result = pjp.proceed();
            if (method.isAnnotationPresent(DataTransformation.class)) {
                //获取配置的字段名
                String keyNames = method.getAnnotation(DataTransformation.class).value();
                String names[] = keyNames.split(",");

                if (result instanceof List) {
                    transform(result, names);
                } else if (result instanceof PageResponse) {
                    PageResponse<Object> response = (PageResponse<Object>) result;
                    transform(response.getData(), names);
                }
            }

        } catch (Throwable e) {
            logger.error("exception: ", e);
            return bk;
        }

        return result;
    }

    @SuppressWarnings("unchecked")
    public Object transform(Object result, String names[]) {

        if (ToolKit.isEmpty(result) || names.length == 0) {
            return result;
        }

        if (result instanceof List) {
            List<Object> list = (List<Object>) result;
            for (Object object : list) {
                Map<String, Object> map = (Map<String, Object>) object;
                changeMap(map, names);
            }
            return list;
        } else if (result instanceof Map) {
            Map<String, Object> map = (Map<String, Object>) result;
            changeMap(map, names);
            return map;
        } else {
            return result;
        }

    }

    @SuppressWarnings("unchecked")
    private void changeMap(Map<String, Object> map, String[] names) {

        if (map == null) {
            return;
        }

        for (String key : names) {
            Object value = map.get(key);

            if (map.get("translation") == null) {
                Map<String, String> translation = new HashMap<String, String>();
                //translation.put(key+"Str", DataDictionaryLisener.allData.get(value+""));
                map.put("translation", translation);
            } else {
                Map<String, String> translation = (Map<String, String>) map.get("translation");
                //translation.put(key+"Str", DataDictionaryLisener.allData.get(value+""));
            }
        }
    }

    private Boolean forList(Object obj) {
		/*if(obj instanceof Page){
			//分页，保存属性
			Page<?> page = (Page<?>) obj;
			PaginationContext.setTotalRecords((int) page.getTotal());
			double a = (double)page.getTotal()/PaginationContext.getPageSize();
			PaginationContext.setTotalPages((int) Math.ceil(a));
		}*/
        if (obj instanceof List<?>) {
            for (Object o : (List<?>) obj) {

                if (o instanceof BaseBean) {
                    Class<?> clazz = o.getClass();
                    Field[] fields = clazz.getDeclaredFields();

                    chian(clazz, fields, o);
                }

            }
            return true;
        }
        return false;
    }

    private Boolean forMap(Object obj) {
        if (obj instanceof Map<?, ?>) {
            for (Entry<?, ?> enrty : ((Map<?, ?>) obj).entrySet()) {

                Object o = enrty.getValue();
                if (o instanceof BaseBean) {

                    Class<?> clazz = o.getClass();
                    Field[] fields = clazz.getDeclaredFields();
                    chian(clazz, fields, o);
                }else if(o instanceof List<?>){
                    for (Object temp : (List<?>) o) {
                        if (temp instanceof BaseBean) {
                            Class<?> clazz = temp.getClass();
                            Field[] fields = clazz.getDeclaredFields();
                            chian(clazz, fields, temp);
                        }

                    }
                }

            }
            return true;
        }
        return false;
    }

    private Boolean forResoultBean(Object obj) {
        if (obj instanceof DataResponse<?>) {
            DataResponse<?> reObj = (DataResponse<?>) obj;
            if (reObj.getData() != null) {
                if (!forList(reObj.getData()) && !forMap(reObj.getData())) {

                    if (reObj.getData() instanceof BaseBean) {
                        Class<?> clazz = reObj.getData().getClass();
                        Field[] fields = clazz.getDeclaredFields();
                        chian(clazz, fields, reObj.getData());
                    } else {
                        Class<?> aClass = reObj.getData().getClass();
                        Field[] fields = aClass.getDeclaredFields();
                        try {
                            for (Field field : fields) {
                                if (field.isAnnotationPresent(IsBaseBean.class)) {
                                    String getField = "get" + ToolKit.getMethodName(field.getName());
                                    Method getMethod = aClass.getMethod(getField);
                                    Object invoke = getMethod.invoke(reObj.getData());

                                    if (!forList(invoke)) {
                                        chian(invoke.getClass(), invoke.getClass().getDeclaredFields(), invoke);
                                    }
                                }
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                    }

                }

                return true;
            }
        } else if (obj instanceof BaseBean) {
            Class<?> aClass = obj.getClass();
            chian(aClass, aClass.getDeclaredFields(), obj);
        }
        return false;
    }

    @SuppressWarnings("unchecked")
    public void chian(Class<?> clazz, Field[] fields, Object obj) {
        //判断属性类型
        try {
            String token = HeaderContext.getAuthorization();
            //获取entity的translation属性保存修改够的值（map）
            String setField = "setTranslation";
            Method setMethod = clazz.getMethod(setField, Map.class);

            String getTranslation = "getTranslation";
            Method getTranslationMethod = clazz.getMethod(getTranslation);
            Map<Object, Object> dataStr = (Map<Object, Object>) getTranslationMethod.invoke(obj);
            if (dataStr == null) {
                dataStr = new HashMap<Object, Object>();
            }
            //Map<String, DictionaryChild> dictMap = dictService.getDictByKey(Constants.REDIS_PRRFIX);
            for (Field field : fields) {
                if (field.isAnnotationPresent(IsBaseBean.class)) {
                    forResoultBean(field);
                }
                if (field.isAnnotationPresent(DataFormat.class)) {
                    DataFormat dataFormat = field.getAnnotation(DataFormat.class);
                    String format = dataFormat.value();
                    String type = dataFormat.type();

                    String getField = "get" + ToolKit.getMethodName(field.getName());
                    if (type.equals(Constants.TIME)) {
                        //日期类型整体格式修改
                        Method getMethod = clazz.getMethod(getField);
                        Object temp = getMethod.invoke(obj);
                        if (temp != null) {
                            dataStr.put(field.getName() + "Str", DateUtil.getStringByDate((java.util.Date) getMethod.invoke(obj), format));
                        } else {
                            dataStr.put(field.getName() + "Str", "");
                        }
                    } else if (type.equals(Constants.DOUBLE)) {
                        //double保留小数位数
                        Method getMethod = clazz.getMethod(getField);
                        DecimalFormat df2 = (DecimalFormat) DecimalFormat.getInstance();
                        df2.applyPattern(format);
                        dataStr.put(field.getName() + "Str", df2.format(getMethod.invoke(obj)));
                    } else if (type.equals(Constants.DICT)) {
                        //字典类型
                        Method getMethod = clazz.getMethod(getField);
                        Object invoke = getMethod.invoke(obj);
                        if (invoke != null) {
                            String val = dictService.getDictByKey(dataFormat.dictKey(), invoke + "");
                            dataStr.put(field.getName() + "Str", val);
                        } else {
                            dataStr.put(field.getName() + "Str", "");
                        }


						/*Map<String, DictionaryChild> dictMap = dictService.getDictByKey(dataFormat.dictKey());

						if(dictMap !=  null){
							String value = dictMap.get(getMethod.invoke(obj) + "").getValue();
						}*/
                    } else if (type.equals(Constants.AREA)) {
                        //区域处理
                        Method getMethod = clazz.getMethod(getField);
                        Object invoke = getMethod.invoke(obj);
                        if (invoke != null) {
                            HashMap<String,String> temp = redisCacheService.get(Constants.AREA);
                            String val = temp.get(invoke + "");
                            dataStr.put(field.getName() + "Str", val);
                        } else {
                            dataStr.put(field.getName() + "Str", "");
                        }
                    } else if (type.equals(Constants.ROOM)) {
                        //房间详情处理
                        Method getMethod = clazz.getMethod(getField);
                        Object invoke = getMethod.invoke(obj);
                        if (invoke != null) {
                            RoomForCache temp = roomInitService.get(invoke.toString());
                            dataStr.put(field.getName() + "Detail", temp);
                        } else {
                            dataStr.put(field.getName() + "Detail", null);
                        }
                    }
                }
            }
            if (dataStr.size() != 0) {
                setMethod.invoke(obj, dataStr);
            }
        } catch (NoSuchMethodException e) {
            //System.out.println("info："+e+"目标不是entity或者没有继承BaseBean");
            e.printStackTrace();
        } catch (SecurityException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
