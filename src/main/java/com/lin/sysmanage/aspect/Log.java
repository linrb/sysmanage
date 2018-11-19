package com.lin.sysmanage.aspect;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Log {
    String descrption() default "" ;//描述
    String actionType() default "" ;//操作的类型，1、添加 2、修改 3、删除 4、查询
}
