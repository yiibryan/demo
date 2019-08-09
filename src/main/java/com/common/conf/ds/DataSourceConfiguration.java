package com.common.conf.ds;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import com.alibaba.druid.pool.DruidDataSource;

/**
 * Created by wilds on 2017/04/08.
 */
//@Configuration
public class DataSourceConfiguration implements InitializingBean{

    public static final String DS_MYSQL = "primaryDataSource";
    private static final String PREFIX_MYSQLPRIMARY = "spring.datasource.primary";

    public static final String DS_MYSQLSLAVE = "secondDataSource";
    private static final String PREFIX_MYSQLSLAVE = "spring.datasource.secondary";


    public static final String DS_KYLIN = "kylinDataSource";
    private static final String PREFIX_KYLIN = "kylin.datasource";

    private static final Logger logger = LoggerFactory.getLogger(DataSourceConfiguration.class);



    @Bean(name = DS_KYLIN)
    @ConfigurationProperties(prefix = PREFIX_KYLIN)
    public DataSource KylinDataSource() {
        return new DruidDataSource();
    }
    @Bean(name = DS_MYSQL)
    @Primary
    @ConfigurationProperties(prefix = PREFIX_MYSQLPRIMARY)
    public DataSource primaryDataSource() {
        return new DruidDataSource();
    }
    @Bean(name = DS_MYSQLSLAVE)
    @ConfigurationProperties(prefix = PREFIX_MYSQLSLAVE)
    public DataSource secondDataSource() {
        return new DruidDataSource();
    }
    @Override
    public void afterPropertiesSet() throws Exception {
        logger.info("Datasource init sucessfull.");
    }
    
}
