package com.common.conf.ds.mysql;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.jdbc.core.JdbcTemplate;


//@Configuration
public class SecondMybatisSqlSessionHome {
    public static final String MYSQL_SESSIONFACTORY = "sqlSessionFactory2";
    public static final String MYSQL_SESSIONTEMPLATE = "sqlSessionTemplate2";

    @Bean(name = {MYSQL_SESSIONFACTORY})
    @Primary
    public SqlSessionFactory sqlSessionFactoryBean( DataSource dataSource) {
        String packagepath="com.guojiu.**/*.domain";
        String location="classpath*:com/**/*mapper.xml";
        return PrimaryMybatisSqlSessionHome.buildSqlSessionFactory(dataSource,packagepath,location);
    }

    @Bean(name = MYSQL_SESSIONTEMPLATE)
    @Primary
    public SqlSessionTemplate sqlSessionTemplate(@Qualifier(MYSQL_SESSIONFACTORY) SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

//    @Bean(name = "platformTransactionManager")
//    @Primary
//    public PlatformTransactionManager annotationDrivenTransactionManager(@Qualifier(DataSourceConfiguration.DS_MYSQLSLAVE) DataSource dataSource) {
//        return new DataSourceTransactionManager(dataSource);
//    }

    @Bean(name = "jdbcTemplate")
    @Primary
    public JdbcTemplate jdbcTemplate( DataSource dataSource) {
        return new JdbcTemplate(dataSource);
    }
    
    
}
