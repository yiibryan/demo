package com.guojiu.common.generator;

import java.util.Arrays;
import java.util.List;

/**
 * 常用工具类
 * Created by wangcan on 2016/12/1.
 */
public class CommonUtils {

    /**
     * 字符串指定位置的字母转换成小写
     * @param s 字符串
     * @param index 位置
     * @return 字符串
     */
    public static String toLowerCaseOne(String s,int index) {
        if(Character.isLowerCase(s.charAt(index)))
            return s;
        else
            return (new StringBuilder()).append(s.substring(0,index))
                    .append(Character.toLowerCase(s.charAt(index))).append(s.substring(index+1)).toString();
    }

    /**
     * 字符串指定位置的字母转换成大写
     * @param s 字符串
     * @param index 位置
     * @return 字符串
     */
    public static String toUpperCaseOne(String s,int index) {
        if(Character.isUpperCase(s.charAt(index)))
            return s;
        else
            return (new StringBuilder()).append(s.substring(0,index))
                    .append(Character.toUpperCase(s.charAt(index))).append(s.substring(index+1)).toString();
    }

    public static void sleep(long m) {
        try {
            Thread.sleep(m);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }


    /**
     * 把数组字符串转换转换成List
     *
     * @param arrayString  eg: "[a,b]"
     * @return 数组
     */
    public static List<String> arrayStringToList(String arrayString) {
        if (arrayString == null){
            return null;
        }
        return Arrays.asList(arrayString.replaceAll("\\[", "").replaceAll("]", "").split(","));
    }


}
