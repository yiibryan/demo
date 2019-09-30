package com.guojiu.common.aop;

import com.lxxx.common.rest.BaseResponse;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * 切面实现
 */
@Component
@Aspect
public class MyValidService {
    public MyValidService() {
        System.out.println("Aop");
    }

    /**
     * 切点
     */
    @Pointcut("@annotation(com.guojiu.common.annotation.MyValid)")
    public void methodCachePointcut() {
    }

    /**
     * 切面
     *
     * @param point
     * @return
     * @throws Throwable
     */
    @Around("methodCachePointcut()")
    public Object around(ProceedingJoinPoint point) throws Throwable {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
//        String ip = getIp(request);
//        User user = UserUtil.getCurrentUser();
        Object result = dealBindingResult(point);
        return result;
    }

    /**
     * 如果有BindingResult  说明参数校验异常  则处理
     *
     * @param joinPoint
     * @return
     * @throws Exception
     */
    public static Object dealBindingResult(ProceedingJoinPoint joinPoint) throws Throwable {
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();

        for (Object argument : arguments) {
            if (argument instanceof BindingResult) {
                BindingResult bindingResult = (BindingResult) argument;
                if (bindingResult.hasErrors()) {
                    return new BaseResponse(false, "304", bindingResult.getFieldError().getDefaultMessage());
                }
            }
        }
        return joinPoint.proceed();
    }
}
