package com.common.conf.ds;

import java.io.IOException;
import java.util.ArrayList;

import org.apache.commons.lang3.StringUtils;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.type.classreading.CachingMetadataReaderFactory;
import org.springframework.core.type.classreading.MetadataReader;
import org.springframework.util.ClassUtils;

public class PackagesSqlSessionFactoryBean extends SqlSessionFactoryBean {

   private static final Logger logger = LoggerFactory.getLogger(PackagesSqlSessionFactoryBean.class);
   static final String DEFAULT_RESOURCE_PATTERN = "**/*.class";


   public void setTypeAliasesPackage(String typeAliasesPackage) {
      PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
      CachingMetadataReaderFactory metadataReaderFactory = new CachingMetadataReaderFactory(resolver);
      typeAliasesPackage = "classpath*:" + ClassUtils.convertClassNameToResourcePath(typeAliasesPackage) + "/" + "**/*.class";

      try {
         ArrayList<String> e = new ArrayList<String>();
         Resource[] resources = resolver.getResources(typeAliasesPackage);
         if(resources != null && resources.length > 0) {
            MetadataReader metadataReader = null;
            Resource[] var7 = resources;
            int var8 = resources.length;

            for(int var9 = 0; var9 < var8; ++var9) {
               Resource resource = var7[var9];
               if(resource.isReadable()) {
                  metadataReader = metadataReaderFactory.getMetadataReader(resource);

                  try {
                     e.add(Class.forName(metadataReader.getClassMetadata().getClassName()).getPackage().getName());
                  } catch (ClassNotFoundException var12) {
                     var12.printStackTrace();
                  }
               }
            }
         }

         if(e.size() > 0) {
            String str=StringUtils.join(e.toArray(), ",");
            logger.info("setTypeAliasesPackage:"+str);
            super.setTypeAliasesPackage(str);
         } else {
            logger.debug("参数typeAliasesPackage:" + typeAliasesPackage + "，未找到任何包");
         }
      } catch (IOException ex) {
         ex.printStackTrace();
         logger.error(ex.getMessage(), ex);
      }

   }

}
