/**
 * 
 */
package com.common.conf.ds.mysql;

import javax.sql.DataSource;

import com.common.conf.ds.DataSourceConfiguration;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.jdbc.core.JdbcTemplate;


/**
* <p>Title: ThirdMybatisSqlSessionHome.java</p>
* <p>Description: <／p>
* <p>Copyright: Copyright (c) 2007</p>
* <p>Company: GuoJiu</p>
* @author xiejianghua
* @date 2017年12月22日
* @version 1.0
*/


//@Configuration
public class ThirdMybatisSqlSessionHome {
    public static final String KYLIN_SESSIONFACTORY = "kylinSessionFactory";
    public static final String KYLIN_SESSIONTEMPLATE = "kylinSessionTemplate";

    @Bean(name = {KYLIN_SESSIONFACTORY})
    @Primary
    public SqlSessionFactory sqlSessionFactoryBean(@Qualifier(DataSourceConfiguration.DS_KYLIN) DataSource dataSource) {
    	String packagepath="com.**/*.product.domain";
        String location="classpath*:com/**/product/kmapper/*.xml";
        System.out.println("ThirdMybatisSqlSessionHome:" + packagepath);
        return PrimaryMybatisSqlSessionHome.buildSqlSessionFactory(dataSource,packagepath,location);
    }

    @Bean(name = KYLIN_SESSIONTEMPLATE)
    @Primary
    public SqlSessionTemplate sqlSessionTemplate(@Qualifier(KYLIN_SESSIONFACTORY) SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }
    
}
