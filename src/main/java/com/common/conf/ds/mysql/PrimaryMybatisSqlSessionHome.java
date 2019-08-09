package com.common.conf.ds.mysql;

import java.util.Properties;

import javax.annotation.Resource;
import javax.sql.DataSource;

import com.common.conf.ds.PackagesSqlSessionFactoryBean;
import com.common.intercepts.GeneratorIdInterceptor;
import com.common.intercepts.TableSegInterceptor;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.core.JdbcTemplate;

import com.github.pagehelper.PageHelper;

@Configuration
public class PrimaryMybatisSqlSessionHome {
	public static final String MYSQL_SESSIONFACTORY = "sqlSessionFactory";
	public static final String MYSQL_SESSIONTEMPLATE = "sqlSessionTemplate";
	@Resource
	private DataSource dataSource;
	public static SqlSessionFactory buildSqlSessionFactory(DataSource ds, String packagepath, String location) {
		PackagesSqlSessionFactoryBean bean = new PackagesSqlSessionFactoryBean();

		bean.setDataSource(ds);

		bean.setTypeAliasesPackage(packagepath);
		PageHelper pageHelper = new PageHelper();
		Properties properties = new Properties();
		properties.setProperty("reasonable", "true");
		properties.setProperty("supportMethodsArguments", "true");
		properties.setProperty("returnPageInfo", "check");
		properties.setProperty("params", "count=countSql");
		properties.setProperty("dialect", "mysql");
		pageHelper.setProperties(properties);
		bean.setPlugins(new Interceptor[] { pageHelper, new TableSegInterceptor(), new GeneratorIdInterceptor() });
		PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
		try {
			bean.setMapperLocations(resolver.getResources(location));

			return bean.getObject();
		} catch (Exception var6) {
			var6.printStackTrace();
			throw new RuntimeException(var6);
		}
	}

	@Bean(name = { MYSQL_SESSIONFACTORY })
	@Primary
	public SqlSessionFactory sqlSessionFactoryBean() {
		String packagepath = "com.guojiu.**/*.domain";
		String location = "classpath*:com/**/*mapper.xml";
		return buildSqlSessionFactory(dataSource, packagepath, location);
	}

	@Bean(name = MYSQL_SESSIONTEMPLATE)
	@Primary
	public SqlSessionTemplate sqlSessionTemplate(@Qualifier(MYSQL_SESSIONFACTORY) SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory);
	}

	// @Bean(name = "platformTransactionManager")
	// @Primary
	// public PlatformTransactionManager
	// annotationDrivenTransactionManager(@Qualifier(DataSourceConfiguration.DS_MYSQL)
	// DataSource dataSource) {
	// return new DataSourceTransactionManager(dataSource);
	// }

	// @Bean(name = "dataSourceMqlTransactionManager")
	// @Primary
	// public DataSourceTransactionManager
	// transactionManager(@Qualifier(DataSourceConfiguration.DS_MYSQL)
	// DataSource dataSource) {
	// return new DataSourceTransactionManager(dataSource);
	// }

	@Bean(name = "jdbcTemplate")
	@Primary
	public JdbcTemplate jdbcTemplate() {
		return new JdbcTemplate(dataSource);
	}

}
