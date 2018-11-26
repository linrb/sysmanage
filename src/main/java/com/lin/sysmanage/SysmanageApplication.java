package com.lin.sysmanage;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//在启动类中添加对mapper包扫描@MapperScan,或者直接在Mapper类上面添加注解@Mapper
@SpringBootApplication
@MapperScan("com.lin.sysmanage.dao")
public class SysmanageApplication {

    public static void main(String[] args) {
        SpringApplication.run(SysmanageApplication.class, args);
    }
}
