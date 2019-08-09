package com.common.conf.ds.mysql;

import java.util.Properties;

import com.common.conf.ds.DataSourceConfiguration;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;



@Configuration
public class MapperScannerHome {
    private static final Logger logger = LoggerFactory.getLogger(DataSourceConfiguration.class);

    @Bean
    public MapperScannerConfigurer primaryMapperScannerBuild() {
        MapperScannerConfigurer mapperScannerConfigurer = new MapperScannerConfigurer();
        mapperScannerConfigurer.setSqlSessionFactoryBeanName(PrimaryMybatisSqlSessionHome.MYSQL_SESSIONFACTORY);
        mapperScannerConfigurer.setBasePackage("com.guojiu.**/*.mapper");
        /*Properties properties = new Properties();
        properties.setProperty("mappers", "tk.mybatis.mapper.common.Mapper");
        properties.setProperty("notEmpty", "false");
        properties.setProperty("IDENTITY", "mysql");
        mapperScannerConfigurer.setProperties(properties);

        logger.info("Primary Mapper Scanner init sucessfull.");*/
        return mapperScannerConfigurer;
    }

    @Bean
    public MapperScannerConfigurer secondMapperScannerBuild() {
        MapperScannerConfigurer mapperScannerConfigurer = new MapperScannerConfigurer();
        mapperScannerConfigurer.setSqlSessionFactoryBeanName(SecondMybatisSqlSessionHome.MYSQL_SESSIONFACTORY);
        mapperScannerConfigurer.setBasePackage("com.guojiu.**/*.mapper");
        /*Properties properties = new Properties();
        properties.setProperty("mappers", "tk.mybatis.mapper.common.Mapper");
        properties.setProperty("notEmpty", "false");
        properties.setProperty("IDENTITY", "mysql");
        mapperScannerConfigurer.setProperties(properties);*/

        logger.info("Second Mapper Scanner init sucessfull.");
        return mapperScannerConfigurer;
    }
}
