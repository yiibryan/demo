package com.demo.config.dao;

import org.springframework.context.annotation.Bean;

public class DataSourceConfiguration {
    @Bean(name = "dataSource")
    public ComboPooledDataSource createDataSource(){

    }
}
