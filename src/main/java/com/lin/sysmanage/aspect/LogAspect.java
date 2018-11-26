package com.lin.sysmanage.aspect;


import com.alibaba.fastjson.JSON;
import com.lin.sysmanage.utils.Log4jUtils;
import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;


@Aspect
@Component
public class LogAspect {
    //private static final Logger log = LoggerFactory.getLogger(LogAspect.class);

    private static Logger log = Log4jUtils.getLog(LogAspect.class);

    /**
     * 切入点
     */
    @Pointcut("@annotation(com.lin.sysmanage.aspect.Log)")
    public void pointcut() {
    }

    @Around("pointcut()")
    public Object around(ProceedingJoinPoint joinPoint) {
        long beginTime = System.currentTimeMillis();

        log.info("=====================开始执行通知==================");
        Object result = null;

        try {
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            //请求的IP
            String ip = request.getRemoteAddr();
            //请求的参数
            // Map resMap=transToMap(request.getParameterMap());
            Map<String, String[]> params = request.getParameterMap();
            String jsonParams = JSON.toJSONString(params);

            String methodName = (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()");
            log.info("请求方法:" + methodName);
            log.info("方法类型:" + getMthodType(joinPoint));
            log.info("参数:" + jsonParams);
            log.info("请求IP:" + ip);
            log.info("url =" + request.getRequestURI());
            // 执行方法
            result = joinPoint.proceed();
        } catch (Throwable e) {
            e.printStackTrace();
        }
        // 执行时长(毫秒)
        long time = System.currentTimeMillis() - beginTime;
        log.info("=====================执行通知结束==================");
        return result;
    }

    /**
     * 方法参数
     *
     * @param joinPoint
     * @return
     */
    private String getRequestParam(JoinPoint joinPoint) {
        StringBuilder paramsBuf = new StringBuilder();
        Object[] arguments = joinPoint.getArgs();
        for (Object arg : arguments) {
            paramsBuf.append(arg);
            paramsBuf.append("&");
        }
        return paramsBuf.toString();
    }

    private Map transToMap(Map parameterMap) {
        // 返回值Map
        Map returnMap = new HashMap();
        Iterator entries = parameterMap.entrySet().iterator();
        Map.Entry entry;
        String name = "";
        String value = "";
        while (entries.hasNext()) {
            entry = (Map.Entry) entries.next();
            name = (String) entry.getKey();
            Object valueObj = entry.getValue();
            if (null == valueObj) {
                value = "";
            } else if (valueObj instanceof String[]) {
                String[] values = (String[]) valueObj;
                for (int i = 0; i < values.length; i++) {
                    value = values[i] + ",";
                }
                value = value.substring(0, value.length() - 1);
            } else {
                value = valueObj.toString();
            }
            returnMap.put(name, value);
        }
        return returnMap;
    }

    //操作类型，用于区分操作
    private static String getMthodType(JoinPoint joinPoint) {
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class targetClass = null;
        try {
            targetClass = Class.forName(targetName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        assert targetClass != null;
        Method[] methods = targetClass.getMethods();
        String type = "b";
        for (Method method : methods) {
            if (method.getName().equals(methodName)) {
                Class[] clazzs = method.getParameterTypes();
                if (clazzs.length == arguments.length) {
                    type = method.getAnnotation(Log.class).descrption();
                    break;
                }
            }
        }
        return type;
    }
}
