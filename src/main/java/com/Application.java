package com;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.cache.annotation.EnableCaching;


//@EnableTransactionManagement
@SpringBootApplication
//@SpringBootApplication(exclude={DataSourceAutoConfiguration.class, HibernateJpaAutoConfiguration.class})
@EnableCaching
@ServletComponentScan//过滤器扫描
@MapperScan({ "com.jur.**/*.mapper", "com.guojiu.**/*.mapper", "com.gjbigdata.**/*.mapper" })
public class Application extends SpringBootServletInitializer {

    public Application(){}
    private static Logger logger = LoggerFactory.getLogger(Application.class);

    public static void main(String[] args) {
        logger.info("============SpringBoot Starting...=========");
        SpringApplication.run(Application.class, args);
        logger.info("============SpringBoot Start Success===========");
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(this.getClass());
    }

}
