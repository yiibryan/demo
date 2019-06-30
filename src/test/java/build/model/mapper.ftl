<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="${nameSpace}" >
  <!--实体与数据库表字段映射-->
  	<resultMap id="resultMap" type="${type}">
		<#list fields as attr> 
		<result property="${attr.fieldName}" column="${attr.colName}" />
  		</#list>
  	</resultMap>
  	
  	<!--查询SQL-->
  	<sql id="querySql">
  		 <#list fields as attr> 
  		 ${attr.colName}<#if attr_has_next>,</#if>
  		 </#list>
  	</sql>
  	
  	<!--条件SQL-->
  	<sql id="whereSql">
		<#list fields as attr> 
		<if test="${attr.fieldName}!=null and ${attr.fieldName}!=''">
			and ${attr.colName}=${r"#{"}${attr.fieldName}${r"}"}
		</if>
	 	</#list>
  	</sql>
  	
  	<!--自动生成查询语句-->
  	<select id="find" parameterType="${type}" resultMap="resultMap">
  		select
  			<include refid="querySql"/>
  		from
  			${tableName}
  		<where>
  			<include refid="whereSql"/>
  		</where>
  	</select>
  	
  	<!--自动生成更新语句-->
  	<update id="update" parameterType="${type}">
  		update
  			${tableName}
  		<set>
  			<#list fields as attr> 
  			<if test="${attr.fieldName}!=null and ${attr.fieldName}!=''">
  				${attr.colName}=${r"#{"}${attr.fieldName}${r"},"}
  			</if>
  		 	</#list>
  		</set>
  		<where>
  			
  			<#if id??>
  			<if test="${id.fieldName}!=null and ${id.fieldName}!=''">
  				and ${id.colName} = ${r"#{"}${id.fieldName}${r"}"}
  			</if>
  			<if test="ids!=null and ids.size>0">
  				and ${id.colName} in
  				 <foreach collection="ids" item="item" index="index" open="(" close=")" separator=",">  
         			${r"#{"}item${r"}"}
         		</foreach>  
  			</if>
			</#if>
  		</where>
  	</update>
  	
  	<!--自动生成插入语句-->
  	<insert id="save" parameterType="${type}" useGeneratedKeys="true" keyProperty="id">
  		insert into 
  			${tableName}(<include refid="querySql"/>)
  		values(
  		<#list fields as attr>
  		${r"#{"}${attr.fieldName}${r"}"}<#if attr_has_next>,</#if>
  		</#list>)
  	</insert> 
  	<!--自动生成删除语句-->
  	<delete id="delete"  parameterType="${type}">
  		delete from ${tableName}
  		<where>
  			<include refid="whereSql"/>
  			<#if id??>
  			<if test="${id.fieldName}!=null and ${id.fieldName}!=''">
  				and ${id.colName} = ${r"#{"}${id.fieldName}${r"}"}
  			</if>
  			<if test="ids!=null and ids.size>0">
  				and ${id.colName} in
  				 <foreach collection="ids" item="item" index="index" open="(" close=")" separator=",">  
         			${r"#{"}item${r"}"}
         		</foreach>  
  			</if>
			</#if>
  		</where>
  	</delete>
  	
  	
  	
</mapper>
