package com.guojiu.common.aop;

import com.github.pagehelper.Page;
import com.guojiu.common.rest.PaginationContext;
import com.lxxx.common.rest.PageResponse;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * service 回传数据修改
 *
 * @author lxxx
 */
@Aspect
@Component
public class DataHelper {

    private static final Logger logger = LoggerFactory.getLogger(DataHelper.class);

    @Pointcut("execution(* com.guojiu..controller.*.*(..))")
    public void pointcut() {
    }

    //分页参数回传
    @AfterReturning(value="execution(* com.guojiu..mapper.*.*(..))",returning="obj")
    public void afterPage(Object obj) {
        if(obj!=null){
            if(obj instanceof Page){

                Page<?> page = (Page<?>) obj;

                PaginationContext.setTotalRecords(new Long(page.getTotal()).intValue());
                PaginationContext.setTotalPages(page.getPages());
            }
        }
    }

    //分页参数回传
    @SuppressWarnings("unchecked")
    @AfterReturning(value = "pointcut()", returning = "obj")
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
                }else if(PaginationContext.getTotalPages() != -1 && PaginationContext.getTotalRecords() !=-1){
                    reObj.setPageNum(PaginationContext.getPageNum());
                    reObj.setPageSize(PaginationContext.getPageSize());
                    reObj.setTotalRecords(PaginationContext.getTotalRecords());
                    reObj.setTotalPages(PaginationContext.getTotalPages());
                    obj=reObj;
                }
            }
        }
    }

    //日志打印
    @Around("pointcut()")
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
        Object result = pjp.proceed();
        long costMs = System.currentTimeMillis() - beginTime;
        logger.info("请求结束-- uri: {} 耗时：{}ms", uri, costMs); //--打包放开
//        Gson gson = new Gson();//--打包注释掉
//        logger.info("请求结束-- 耗时：{}ms, return:{}", costMs, gson.toJson(result));//--打包注释掉
        return result;
    }
}
