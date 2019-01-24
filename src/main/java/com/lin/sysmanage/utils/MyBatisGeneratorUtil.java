package com.lin.sysmanage.utils;


import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MyBatisGeneratorUtil {
    public static void main(String[] args) {
        List<String> warnings = new ArrayList<String>();
        boolean overwrite = true;
        ConfigurationParser cp = new ConfigurationParser( warnings );
        Configuration config = null;
        try {
            //读取generator配置文件
            //方式一
            //File file = ResourceUtils.getFile("classpath:mybatis/generatorConfig.xml");            
            //方式二
            Resource resource = new ClassPathResource( "mybatis/generatorConfig.xml" );
            File configFile = resource.getFile();
            System.out.println( configFile.getAbsoluteFile() );
            //方式三
            //File configFile1 = new File(MyBatisGeneratorUtil.class.getResource("/mybatis/generatorConfig.xml").getFile());
            config = cp.parseConfiguration( configFile );
        } catch (IOException e) {
            e.printStackTrace();
        } catch (XMLParserException e) {
            e.printStackTrace();
        }
        DefaultShellCallback callback = new DefaultShellCallback( overwrite );
        MyBatisGenerator myBatisGenerator = null;
        try {
            myBatisGenerator = new MyBatisGenerator( config, callback, warnings );
        } catch (InvalidConfigurationException e) {
            e.printStackTrace();
        }
        try {
            myBatisGenerator.generate( null );
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

}
