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

import java.net.InetAddress;


//@EnableTransactionManagement
@SpringBootApplication
//@SpringBootApplication(exclude={DataSourceAutoConfiguration.class, HibernateJpaAutoConfiguration.class})
@EnableCaching
@ServletComponentScan//过滤器扫描
@MapperScan({"com.jur.**/*.mapper", "com.guojiu.**/*.mapper", "com.demo.**/*.mapper", "com.gjbigdata.**/*.mapper"})
public class WebApplication extends SpringBootServletInitializer {

    public WebApplication() {
    }

    private static Logger logger = LoggerFactory.getLogger(WebApplication.class);

    public static void main(String[] args) throws Exception {
        InetAddress addr = InetAddress.getLocalHost();
        logger.info("============SpringBoot Starting...=========");
        SpringApplication.run(WebApplication.class, args);
        logger.info("============SpringBoot Start Success===========");
        System.out.println("Local HostAddress:" + addr.getHostAddress());
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(this.getClass());
    }

}
