package com.yz.rule.aop;

import com.alibaba.fastjson.JSON;
import com.xxl.job.core.handler.IJobHandler;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import java.lang.reflect.Method;

/**
 * @author yazhong
 * @description JobHandlerInterceptor
 */
@Aspect
@Component
@Order(1)
public class JobHandlerInterceptor {
    private static Logger logger;

    @Around("execution(public * com.yz.rule.job.*.execute(..))")
    public Object intercept(ProceedingJoinPoint pjp) throws Throwable {
        Class<?> targetClass = pjp.getTarget().getClass();
        MethodSignature signature = (MethodSignature) pjp.getSignature();
        Method method = targetClass.getMethod(signature.getName(), signature.getParameterTypes());
        Object[] args = pjp.getArgs();

        StopWatch stopWatch = new StopWatch();
        stopWatch.start();
        StringBuilder sbLog = new StringBuilder(">>> Start Method ").append(method.getName()).append(" with args : ");
        for (int i = 0; i < args.length; i++) {
            Object arg = args[i];
            if (i > 0) {
                sbLog.append(", ");
            }
            sbLog.append(JSON.toJSONString(arg, false));
        }
        Object ret;
        try {
            ret = pjp.proceed(args);
        } catch (Exception e) {
            logger.error(targetClass.getName(), method.getName(),
                    " execute failed ",
                    "",
                    e);
            ret = IJobHandler.FAIL;
        }
        sbLog.append(">>> Finish Method ")
                .append(method.getName()).append(" with return : ").append(JSON.toJSONString(ret, false))
                .append(", elapsed: ").append(stopWatch.getTotalTimeMillis()).append(" ms");
        logger.info(targetClass.getName(), method.getName(),
                " execute success ",
                sbLog.toString());

        return ret;
    }
}
