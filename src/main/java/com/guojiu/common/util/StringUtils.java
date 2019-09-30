package com.guojiu.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;


import org.apache.log4j.Logger;

public class StringUtils extends org.apache.commons.lang.StringUtils{


	private static final Logger log = Logger.getLogger(StringUtils.class);

	public static void main(String[] args) throws Exception {

		System.out.println(StringUtils.createUUID());

	}


	public static String firstToLowerCase(String s) {
		if(null != s) {
			return Character.toLowerCase(s.charAt(0))+s.substring(1);
		}
		return null;
	}

	public static String toUpperChar(String str){
		String restr = "";
		if(str != null && !"".equals(str)){
			char c  =(char)(str.charAt(0)- ' ');
			restr =  c + str.substring(1);
		}
		return restr;
	}


	public static String toUpperFirstChar(String str){
		String restr = "";
		if(str != null && !"".equals(str)){
			char c  =(char)(str.charAt(0)- ' ');
			restr =  c + str.substring(1);
		}
		return restr;
	}


	public static String toUtf8OrISOString(String agent, String fileName) {
		try {
			boolean isFireFox = (agent != null && agent.toLowerCase().indexOf("firefox") != -1);
			if (isFireFox) {
				fileName = new String(fileName.getBytes("UTF-8"), "ISO8859-1");
			} else {
				fileName = StringUtils.toUtf8String(fileName);
				if ((agent != null && agent.indexOf("MSIE") != -1)) {
					if (fileName.length() > 150) {
						// 根据request的locale 得出可能的编码
						fileName = new String(fileName.getBytes("UTF-8"),"ISO8859-1");
					}
				}
			}
		} catch (Exception e) {
			log.error("文件名为："+fileName+"的文件下载时文件名编码出错！！！", e);
			e.printStackTrace();
		}

		return fileName;
	}


	public static String toUtf8String(String s) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			if (c >= 0 && c <= 255) {
				sb.append(c);
			} else {
				byte[] b;
				try {
					b = Character.toString(c).getBytes("utf-8");
				} catch (Exception ex) {
					log.debug("将文件名中的汉字转为UTF8编码的串时错误，输入的字符串为：" +s);
					b = new byte[0];
				}
				for (int j = 0; j < b.length; j++) {
					int k = b[j];
					if (k < 0)
						k += 256;
					sb.append("%" + Integer.toHexString(k).toUpperCase());
				}
			}
		}
		return sb.toString();
	}

	/**
	 * 把class转换为包路径：com.sss.xx-->com/sss/xx
	 * @param clazz class对象
	 * @param addPackage 需要加入路径的包名
	 * @param xlsName 文件名称
	 * @return src路径
	 */
	public static String className2Path(Class<?> clazz,String addPackage,String xlsName) {
		String path="";
		if(clazz!=null){
			path=clazz.getPackage().getName().replace(".", "/");
			if(isNotEmpty(addPackage)){
				path+="/"+addPackage;
			}
			if(isNotEmpty(xlsName)){
				path+="/"+xlsName;
			}
		}
		return path;
	}

	/**
	 * 把class转换为包路径：com.sss.xx-->com/sss/xx
	 * @param clazz class对象
	 * @param addPackage 需要加入的包名
	 * @param delPackage 需要去掉的包名
	 * @param xlsName 文件名称
	 * @return src路径
	 */
	public static String className2Path(Class<?> clazz,String addPackage,String delPackage,String xlsName)throws Exception{
		String path="";
		if(isEmpty(xlsName)){
			RuntimeException r = new RuntimeException(clazz.getName()+"类中的DrdcPath注解没有值或者值为空！！！！！！！！！！！！！！！！！！");
			log.error(clazz.getName()+"类中的DrdcPath注解没有值或者值为空！！！！！！！！！！！！！！！！！！",r);
			throw r;
		}

		if(xlsName.contains("/")){
			if(xlsName.startsWith("/")){
				xlsName=xlsName.substring(1, xlsName.length());
			}
			return xlsName;
		}
		if(clazz!=null){
			path=clazz.getPackage().getName().replace(".", "/").replace("/"+delPackage, "");
			if(isNotEmpty(addPackage)){
				path+="/"+addPackage;
			}
			if(isNotEmpty(xlsName)){
				path+="/"+xlsName;
			}
		}
		return path;
	}

	/**
	 * 根据clazz获取路径
	 * @param clazz
	 * @param addPackage 需要添加的路径
	 * @param delPackage 需要删除的路径
	 * @return clazz的src路径
	 */
	public static String getSrcPathByClass(Class<?> clazz,String addPackage,String delPackage){
		String path="";
		if(clazz!=null){
			path=clazz.getPackage().getName().replace(".", "/");
			if(isNotEmpty(delPackage)){
				path=path.replace("/"+delPackage, "");
			}
			if(isNotEmpty(addPackage)){
				path+="/"+addPackage;
			}
		}
		return path;
	}

	/**
	 * 根据clazz获取路径
	 * @param clazz
	 * @return clazz的src路径
	 */
	public static String getSrcPathByClass(Class<?> clazz){
		return getSrcPathByClass(clazz,null,null);
	}

	public static String getSysTime(){
		SimpleDateFormat sim=new SimpleDateFormat("yyyyMMddHHmmssSSS");
		return sim.format(new Date());
	}



	public static String createUUID(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	public static boolean isBlank(String ...str){
		for(String s:str){
			if(org.apache.commons.lang.StringUtils.isNotBlank(s)){
				return false;
			}
		}
		return true;
	}

	public static boolean isNotBlank(String...str){
		for(String s:str){
			if(org.apache.commons.lang.StringUtils.isBlank(s)){
				return false;
			}
		}
		return true;
	}

	public static String firstToUpperCase(String s) {
		if(null != s) {
			return Character.toUpperCase(s.charAt(0))+s.substring(1);
		}
		return null;
	}

    /**
     * 将对象转化为string
     * @param obj
     * @return 如果对象为空则返回空字符串
     * @author hewei.co
     */
    public static String obj2Str(Object obj) {
        if (obj == null) {
            return "";
        }

        return obj.toString();
    }

    /**
     * 将对象转化为int
     * @param obj
     * @return 如果对象为空则返回0
     * @author hewei.co
     */
    public static int obj2Int(Object obj) {
        if (obj == null) {
            return 0;
        }

        return Integer.parseInt(obj.toString());
    }

    /**
     * 将对象转化为long
     * @param obj
     * @return 如果对象为空则返回0
     * @author hewei.co
     */
    public static long obj2Long(Object obj) {
        if (obj == null) {
            return 0;
        }

        return Long.parseLong(obj.toString());
    }
}

