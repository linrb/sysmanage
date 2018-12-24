package com.lin.sysmanage.aspect;


import com.alibaba.fastjson.JSON;
import com.lin.sysmanage.entity.SysLogEntity;
import com.lin.sysmanage.service.ISysLogService;
import com.lin.sysmanage.utils.Log4jUtils;
import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * 日志切面
 */
@Aspect
@Component
public class LogAspect {
    //private static final Logger log = LoggerFactory.getLogger(LogAspect.class);

    private static Logger log = Log4jUtils.getLog( LogAspect.class );

    @Autowired
    private ISysLogService sysLogService;

    @Autowired
    private MongoTemplate mongoTemplate;

    /**
     * 切入点
     */
    @Pointcut("@annotation(com.lin.sysmanage.aspect.Log)")
    public void pointcut() {
    }

    @Around("pointcut()")
    public Object around(ProceedingJoinPoint joinPoint) {

        log.info( "=====================开始执行通知==================" );
        Object result = null;
        long beginTime = System.currentTimeMillis();
        try {
            // 执行方法
            result = joinPoint.proceed();
            // 执行时长(毫秒)
            long time = System.currentTimeMillis() - beginTime;
            // 保存日志
            saveLog( joinPoint, "0", time, "" );
        } catch (Throwable e) {
            long time = System.currentTimeMillis() - beginTime;
            String errMsg = e.getMessage();
            // 保存日志
            saveLog( joinPoint, "1", time, errMsg );
            e.printStackTrace();
        }

        log.info( "=====================执行通知结束==================" );
        return result;
    }

    /**
     * 保存日志
     *
     * @param joinPoint
     * @param time
     */
    private void saveLog(ProceedingJoinPoint joinPoint, String status, long time, String errMsg) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        //请求的IP
        String ip = getIP( request );
        //请求的参数（两特别是方式）
        //  Object[] args = joinPoint.getArgs();//方式一
        Map<String, String[]> params = request.getParameterMap();//方式二
        Map<String, String> resMap = transformParameterMap(params,false);
        String jsonParams ="";
        if (resMap != null&&resMap.size()>0) {
            jsonParams = JSON.toJSONString(resMap );
        }
        // 获取请求的类名
        String className = joinPoint.getSignature().getDeclaringTypeName();
        //获取请求的方法名
        String classMethodName = joinPoint.getSignature().getName();
        // 获取请求方式
        String method = request.getMethod();

        String url = request.getRequestURI();

        //请求的参数
        String paramsArr = "";
        Object[] args = joinPoint.getArgs();
        if (args.length > 0) {
            //将参数所在的数组转换成json
            paramsArr = JSON.toJSONString( args );
        }

        String methodName = (joinPoint.getTarget().getClass().getName() + "." + classMethodName + "()");
        String methodDesc=getMthodDescription(joinPoint)+",操作类型="+getMthodOperationType(joinPoint  );
        log.info( "请求的类名:" + className );
        log.info( "请求方法:" + methodName );
        log.info( "请求方式:" + method );
        log.info( "操作描述:" + methodDesc);
        log.info( "请求参数:" + jsonParams );
        log.info( "请求IP:" + ip );
        log.info( "请求地址:" + url );

        // 日志实体类封装
        SysLogEntity sysLogEntity = new SysLogEntity();
        sysLogEntity.setUserId( 1 );
        sysLogEntity.setUserName( "admin" );
        sysLogEntity.setIp( ip );
        sysLogEntity.setStatus( status );
        sysLogEntity.setMethod( methodName );
        sysLogEntity.setOperateType( methodDesc );
        sysLogEntity.setOperateParam( jsonParams );
        sysLogEntity.setOperateTime( Long.toString( time ) );
        sysLogEntity.setOperateUrl( url );
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
        //从前端或者自己模拟一个日期格式，转为String即可
        String dateStr = format.format( date );
        sysLogEntity.setCreateTime( dateStr );
        sysLogEntity.setErrorMsg( errMsg );
        sysLogService.saveSysLog( sysLogEntity );
        //mongoTemplate.save(sysLogEntity);

    }

    //获取请求IP
    public String getIP(HttpServletRequest request) {
        String ip = request.getHeader( "x-forwarded-for" );
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase( ip )) {
            ip = request.getHeader( "Proxy-Client-IP" );
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase( ip )) {
            ip = request.getHeader( "WL-Proxy-Client-IP" );
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase( ip )) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    /**
     * 动态获取 request中的值
     * @param parameterMap
     * @param isNull
     * @return
     */
    private Map transformParameterMap(Map parameterMap,boolean isNull)
    {
        Map returnMap = new HashMap();
        if(isNull)
        {
            returnMap=transformParameterMapWithNull( parameterMap );
        }else 
        {
            returnMap=transformParameterMapWithNotNull(parameterMap  );
        }
        return  returnMap;
    }
    
    
    /**
     * 动态获取 request中的值并去除空值
     * @param parameterMap
     * @return
     */
    private Map transformParameterMapWithNotNull(Map parameterMap) {
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
                //value = "";
                continue;
            } else if (valueObj instanceof String[]) {
                String[] values = (String[]) valueObj;//用于请求参数中有多个相同名称
                for (String s : values) {
                    if (s != null && s != "") {
                        value = s + ",";
                    } else {
                        continue;
                    }
                }
                if (value != null && value != "") {
                    value = value.substring( 0, value.length() - 1 );
                }
            } else {
                value = valueObj.toString();//用于请求参数中请求参数名唯一
            }
            if (value != null && value != "") {
                returnMap.put( name, value );
            }
        }
        return returnMap;
    }

    /**
     * 动态获取 request中的值包含空值
     * @param properties
     * @return
     */
    private Map<String,Object> transformParameterMapWithNull(Map<String,Object> properties){
        Map<String, Object> paramM = new HashMap<String, Object>();
        for(Map.Entry<String,Object> entrys:properties.entrySet()){
            Object valueObj =   entrys.getValue();
            String value = "";
            if(null==valueObj){
                value = "";
            }else if(valueObj instanceof String[]){
                String[] values = (String[])valueObj;
                for(int i=0;i<values.length;i++){
                    value += values[i] + ",";
                }
                value = value.substring(0, value.length()-1);
            }else{
                value = valueObj.toString();
            }
            paramM.put(entrys.getKey(), value);
        }
        return paramM;
    }

    /**
     * 获取注解中对方法的描述信息
     * @param joinPoint
     * @return
     */
    private static String getMthodDescription (JoinPoint joinPoint) {
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class targetClass = null;
        try {
            targetClass = Class.forName( targetName );
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        assert targetClass != null;
        Method[] methods = targetClass.getMethods();
        String description  = "无";
        for (Method method : methods) {
            if (method.getName().equals( methodName )) {
                Class[] clazzs = method.getParameterTypes();
                if (clazzs.length == arguments.length) {
                    description  = method.getAnnotation( Log.class ).descrption();
                    break;
                }
            }
        }
        return description;
    }

    /**
     * 获取注解中对方法的操作类型
     * @param joinPoint
     * @return
     */
    private static String getMthodOperationType (JoinPoint joinPoint) {
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class targetClass = null;
        try {
            targetClass = Class.forName( targetName );
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        assert targetClass != null;
        Method[] methods = targetClass.getMethods();
        String description  = "无";
        for (Method method : methods) {
            if (method.getName().equals( methodName )) {
                Class[] clazzs = method.getParameterTypes();
                if (clazzs.length == arguments.length) {
                    description  = method.getAnnotation( Log.class ).operationType().getValue();
                    break;
                }
            }
        }
        return description;
    }
}
