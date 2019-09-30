package com.guojiu.common.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Hashtable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class InformationUtil {
	/**
	 * 验证身份证编号是否合法
	 * @param iDCardStr 身份证编号
	 * @return
	 */
	public static  String  IDCardIf(String iDCardStr) {
		 String[] wf = { "1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2" };
	        String[] checkCode = { "7", "9", "10", "5", "8", "4", "2", "1", "6", "3", "7", "9", "10", "5", "8", "4", "2" };
	        String iDCardNo = "";
	        try {
	            //判断号码的长度 15位或18位
	            if (iDCardStr.length() != 15 && iDCardStr.length() != 18) {
	                return "身份证号码长度应该为15位或18位";
	            }
	            if (iDCardStr.length() == 18) {
	                iDCardNo = iDCardStr.substring(0, 17);
	            } else if (iDCardStr.length() == 15) {
	                iDCardNo = iDCardStr.substring(0, 6) + "19" + iDCardStr.substring(6, 15);
	            }
	            if (isStrNum(iDCardNo) == false) {
	                return "身份证15位号码都应为数字;18位号码除最后一位外,都应为数字";
	            }
	            //判断出生年月
	            String strYear = iDCardNo.substring(6, 10);// 年份
	            String strMonth = iDCardNo.substring(10, 12);// 月份
	            String strDay = iDCardNo.substring(12, 14);// 月份
	            if (isStrDate(strYear + "-" + strMonth + "-" + strDay) == false) {
	                return "身份证生日无效";
	            }
	            GregorianCalendar gc = new GregorianCalendar();
	            SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
	            if ((gc.get(Calendar.YEAR) - Integer.parseInt(strYear)) > 150 || (gc.getTime().getTime() - s.parse(strYear + "-" + strMonth + "-" + strDay).getTime()) < 0) {
	                return "身份证生日不在有效范围";
	            }
	            if (Integer.parseInt(strMonth) > 12 || Integer.parseInt(strMonth) == 0) {
	                return "身份证月份无效";
	            }
	            if (Integer.parseInt(strDay) > 31 || Integer.parseInt(strDay) == 0) {
	                return "身份证日期无效";
	            }
	            //判断地区码
	            Hashtable<String, String> h = GetAreaCode();
	            if (h.get(iDCardNo.substring(0, 2)) == null) {
	                return "身份证地区编码错误";
	            }
	            //判断最后一位
	            int theLastOne = 0;
	            for (int i = 0; i < 17; i++) {
	                theLastOne = theLastOne + Integer.parseInt(String.valueOf(iDCardNo.charAt(i))) * Integer.parseInt(checkCode[i]);
	            }
	            int modValue = theLastOne % 11;
	            String strVerifyCode = wf[modValue];
	            iDCardNo = iDCardNo + strVerifyCode;
	            if (iDCardStr.length() == 18 && !iDCardNo.equals(iDCardStr)) {
	                return "身份证无效，不是合法的身份证号码";
	            }
	        }catch (Exception e){
	            e.printStackTrace();
	        }
	        return "";
	}

	public static void main(String[] args) {
		System.out.println(IDCardIf("510504199104290652"));
	}

	/**
     * 地区代码
     * @return Hashtable
     */
    private static Hashtable<String, String> GetAreaCode() {
        Hashtable<String, String> hashtable = new Hashtable<String, String>();
        hashtable.put("11", "北京");
        hashtable.put("12", "天津");
        hashtable.put("13", "河北");
        hashtable.put("14", "山西");
        hashtable.put("15", "内蒙古");
        hashtable.put("21", "辽宁");
        hashtable.put("22", "吉林");
        hashtable.put("23", "黑龙江");
        hashtable.put("31", "上海");
        hashtable.put("32", "江苏");
        hashtable.put("33", "浙江");
        hashtable.put("34", "安徽");
        hashtable.put("35", "福建");
        hashtable.put("36", "江西");
        hashtable.put("37", "山东");
        hashtable.put("41", "河南");
        hashtable.put("42", "湖北");
        hashtable.put("43", "湖南");
        hashtable.put("44", "广东");
        hashtable.put("45", "广西");
        hashtable.put("46", "海南");
        hashtable.put("50", "重庆");
        hashtable.put("51", "四川");
        hashtable.put("52", "贵州");
        hashtable.put("53", "云南");
        hashtable.put("54", "西藏");
        hashtable.put("61", "陕西");
        hashtable.put("62", "甘肃");
        hashtable.put("63", "青海");
        hashtable.put("64", "宁夏");
        hashtable.put("65", "新疆");
        hashtable.put("71", "台湾");
        hashtable.put("81", "香港");
        hashtable.put("82", "澳门");
        hashtable.put("91", "国外");
        return hashtable;
    }
    /**
     * 判断字符串是否为数字
     * @param str
     * @return
     */
    private static boolean isStrNum(String str) {
        Pattern pattern = Pattern.compile("[0-9]*");
        Matcher isNum = pattern.matcher(str);
        if (isNum.matches()) {
            return true;
        } else {
            return false;
        }
    }
    /**
     * 判断字符串是否为日期格式
     * @param strDate
     * @return
     */
    public static boolean isStrDate(String strDate) {
        Pattern pattern = Pattern.compile("^((\\d{2}(([02468][048])|([13579][26]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])))))|(\\d{2}(([02468][1235679])|([13579][01345789]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))(\\s(((0?[0-9])|([1-2][0-3]))\\:([0-5]?[0-9])((\\s)|(\\:([0-5]?[0-9])))))?$");
        Matcher m = pattern.matcher(strDate);
        if (m.matches()) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 判断手机号码
     * @param phone
     * @return
     */
    public static boolean isMobilePhone(String phone) {
        boolean flag=true;
        String regex = "^((13[0-9])|(14[5,7,9])|(15([0-3]|[5-9]))|(166)|(17[0,1,3,5,6,7,8])|(18[0-9])|(19[8|9]))\\d{8}$";
        if (phone.length() != 11) {
            flag= false;
        } else {
            Pattern p = Pattern.compile(regex);
            Matcher m = p.matcher(phone);
            flag = m.matches();
        }

        return flag;
    }

}
