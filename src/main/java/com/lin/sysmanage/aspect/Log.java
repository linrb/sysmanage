package com.lin.sysmanage.aspect;

import com.lin.sysmanage.utils.enums.OperationType;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Log {
    
    String descrption() default "";//描述

    /**
     * 操作类型(enum):主要是select,insert,update,delete
     *
     * @return
     */
    OperationType operationType() default OperationType.UNKNOWN;
}
