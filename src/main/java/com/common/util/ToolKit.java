package com.common.util;

import com.google.gson.Gson;

import java.io.UnsupportedEncodingException;
import java.math.RoundingMode;
import java.net.URLDecoder;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ToolKit {
    // 升序
    public static final boolean ASC = true;
    // 降序
    public static final boolean DESC = false;
    public static final java.text.DecimalFormat DECIMAL_FORMAT = new java.text.DecimalFormat("#.00");

    public static String getEightRandomNumber() {
        StringBuffer sb = new StringBuffer();
        int a[] = new int[8];
        for (int i = 0; i < a.length; i++) {
            a[i] = (int) (10 * (Math.random()));
            sb = sb.append(a[i]);
        }
        return sb.toString();
    }

    /*
     * 保留几位小数 Object ---- 转换值 number ---- 保留小数位数 flag ---- 是否需要四舍五入 return
     */
    public static String getRetain(double ob, int number, Boolean flag) {
        NumberFormat nf = NumberFormat.getNumberInstance();
        // 保留几位小数
        nf.setMaximumFractionDigits(number);
        // 如果不需要四舍五入，可以使用RoundingMode.DOWN
        if (flag) {
            nf.setRoundingMode(RoundingMode.UP);
        } else {
            nf.setRoundingMode(RoundingMode.DOWN);
        }
        return nf.format(ob);
    }

    public static void main(String[] args) {
        boolean checkUsername = checkName("杨萨斯");
        System.out.println(checkUsername);
    }

    public static HashMap<String, String> getReqParams(String strs) throws UnsupportedEncodingException {

        Map<String, String> map = new HashMap<String, String>();

        if ("".equals(strs))
            return (HashMap<String, String>) map;

        String[] warningReq = strs.split(",");

        for (String str : warningReq) {
            String[] args = str.split("=");

            String property = args[0];
            String propertyValue = URLDecoder.decode(URLDecoder.decode(args[1], "utf-8"), "utf-8");

            map.put(property, propertyValue);
        }

        return (HashMap<String, String>) map;
    }

    public static boolean isEmpty(Object obj) {
        if (obj == null) {
            return true;
        }
        if ((obj instanceof List)) {
            return ((List) obj).size() == 0;
        }
        if ((obj instanceof String)) {
            return ((String) obj).trim().equals("");
        }
        return false;
    }

    // 把一个字符串的第一个字母大写、效率是最高的、
    public static String getMethodName(String fildeName) {
        byte[] items = fildeName.getBytes();
        items[0] = (byte) ((char) items[0] - 'a' + 'A');
        return new String(items);
    }

    /**
     * 邮箱校验
     *
     * @param email
     * @return true 表示合法 flase表示被合法
     */
    public static boolean checkEmail(String email) {
        boolean flag = false;
        if (ToolKit.isEmpty(email)) {
            return flag;
        }
        try {
            String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
            Pattern regex = Pattern.compile(check);
            Matcher matcher = regex.matcher(email);
            flag = matcher.matches();
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    /**
     * 验证手机号码 //0?(13|14|15|18)[0-9]{9}
     *
     * @param mobileNumber
     * @return true 表示合法 flase表示被合法
     */
    public static boolean checkMobileNumber(String mobileNumber) {
        boolean flag = false;
        if (ToolKit.isEmpty(mobileNumber)) {
            return flag;
        }
        try {
            Pattern regex = Pattern.compile("(^(\\d{3,4}-)?\\d{7,8})$|^(1[0-9]{10})$|^([4|8]00-[0-9]{3}-[0-9]{4})$");
            Matcher matcher = regex.matcher(mobileNumber);
            flag = matcher.matches();
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    /**
     * 年月日校验 yyyy-MM-dd
     *
     * @param date
     * @return true 表示合法 flase表示被合法
     */
    public static boolean checkDate(String date) {
        boolean flag = false;
        if (ToolKit.isEmpty(date)) {
            return flag;
        }
        try {
            Pattern regex = Pattern.compile("\\d{4}(\\-|\\/|.)\\d{1,2}\\1\\d{1,2}");
            Matcher matcher = regex.matcher(date);
            flag = matcher.matches();
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    /**
     * 年月校验 yyyy-MM
     *
     * @param date
     * @return true 表示合法 flase表示被合法
     */
    public static boolean isMonth(String month) {
        boolean flag = false;
        if (ToolKit.isEmpty(month)) {
            return flag;
        }
        try {
            Pattern regex = Pattern.compile("(\\d{4})(\\-|\\/|.)(\\d{1,2})");
            Matcher matcher = regex.matcher(month);
            flag = matcher.matches();
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    /**
     * 用户名校验
     *
     * @param date
     * @return true 表示合法 flase表示被合法
     */
    public static boolean checkUsername(String username) {
        boolean flag = false;
        if (ToolKit.isEmpty(username) || username.length() < 6 || username.length() > 32) {
            return flag;
        }
        try {
            Pattern regex = Pattern.compile("[A-Za-z0-9_\\-\\u4e00-\\u9fa5]+");
            Matcher matcher = regex.matcher(username);
            flag = matcher.matches();
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }
    ///^[\u4E00-\u9FA5A-Za-z]+$/

    /**
     * 姓名校验
     *
     * @return true 表示合法 flase表示被合法
     */
    public static boolean checkName(String name) {
        boolean flag = false;
        if (ToolKit.isEmpty(name) || name.length() < 2) {
            return flag;
        }
        try {
            Pattern regex = Pattern.compile("^[\u4e00-\u9fa5]+(·[\u4e00-\u9fa5]+)*$");
            Matcher matcher = regex.matcher(name);
            flag = matcher.matches();
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    /**
     * 企业名称校验
     *
     * @param name
     * @return
     */
    public static boolean checkEnterpriseName(String name) {
        boolean flag = false;
        if (ToolKit.isEmpty(name) || name.length() < 2) {
            return flag;
        } else {
            flag = true;
        }
//		try {
//			Pattern regex = Pattern.compile("/^[A-Za-z0-9\u4e00-\u9fa5]{2,20}$/");
//			Matcher matcher = regex.matcher(name);
//			flag = matcher.matches();
//		} catch (Exception e) {
//			flag = false;
//		}
        return flag;
    }

    /**
     * 组织机构代码校验
     *
     * @param username
     * @return
     */
    // [a-zA-Z0-9]{8}-[a-zA-Z0-9]
    public static boolean checkOrganizationCode(String organizationCode) {
        boolean flag = false;
        if (ToolKit.isEmpty(organizationCode) || organizationCode.length() != 9) {
            return flag;
        }
        try {
            Pattern regex = Pattern.compile("[a-zA-Z0-9]{9}");
            Matcher matcher = regex.matcher(organizationCode);
            flag = matcher.matches();
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }
//	[A-Z0-9]{18}

    /**
     * 企业信用代码校验
     *
     * @param organizationCode
     * @return
     */
    public static boolean checkCreditCode(String creditCode) {
        boolean flag = false;
        if (ToolKit.isEmpty(creditCode) || creditCode.length() != 18) {
            return flag;
        }
        try {
            Pattern regex = Pattern.compile("[A-Z0-9]{18}");
            Matcher matcher = regex.matcher(creditCode);
            flag = matcher.matches();
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    /**
     * Session数据结合组合条件,预留
     */
    public static HashMap<String, Object> queryCondition(Map<String, Object> map) {
        return null;
    }

    // public static void main(String[] args) {
    // // System.out.println(checkMobileNumber("400-885-2651"));
    // List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
    // Map<String, Object> map1 = new HashMap<String, Object>();
    // map1.put("key", 1.11);
    // list.add(map1);
    //
    // Map<String, Object> map2 = new HashMap<String, Object>();
    // map2.put("key", 43.11);
    // list.add(map2);
    //
    // Map<String, Object> map3 = new HashMap<String, Object>();
    // map3.put("key", 61111.11);
    // list.add(map3);
    //
    // Map<String, Object> map4 = new HashMap<String, Object>();
    // map4.put("key", 5.11);
    // list.add(map4);
    //
    // Map<String, Object> map5 = new HashMap<String, Object>();
    // map5.put("key", 112.11);
    // list.add(map5);
    //
    // compareMapInList(list, "key", "newKey", false);
    // for (Map<String, Object> temp : list) {
    // System.out.println(temp.get("key"));
    // }
    //
    // }

    /**
     * 校验年份
     *
     * @param year
     * @return true 表示合法 flase表示被合法
     */
    public static boolean isYear(String year) {
        boolean flag = false;
        if (ToolKit.isEmpty(year) || year.length() != 4) {
            return flag;
        }
        try {
            Integer value = Integer.valueOf(year);
            flag = true;
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    /**
     * 格式化map取出来的json数据
     *
     * @param object
     * @return
     */
    public static String toString(Object object) {
        // TODO Auto-generated method stub
        return object == null ? "" : object.toString().replaceAll("\\.0", "");
    }

    /**
     * 对形如List<Map<String,Object>>的数据排序
     *
     * @param list
     * List<Map<String,Object>>对象
     * @param key
     * 对对应key的value进行排序
     * @param ascOrDesc
     * ToolKit.ASC 升序 ToolKit.DESC降序
     * @param newKey
     * 新的key
     */
    static String newKey;

    public static void compareMapInList(List<Map<String, Object>> list, String key, String newKeyTemp,
                                        boolean ascOrDesc) {
        newKey = newKeyTemp;
        if (ToolKit.isEmpty(newKey)) {
            newKey = "unUseKey";
        }
        if (list.size() > 0) {
            Map<String, Object> current = list.get(0);
            Object currentValue = current.get(key);
            current.put(newKey, currentValue);
        }

        for (int i = 1; i < list.size(); i++) {
            Map<String, Object> current = list.get(i);
            Object currentValue = current.get(key);
            Double currentValueDouble = Double.valueOf(currentValue.toString());
            current.put(newKey, currentValue);
            int j;
            for (j = i - 1; j >= 0; j--) {
                Map<String, Object> next = list.get(j);
                Object nextValue = next.get(key);
                Double nextValueDouble = Double.valueOf(nextValue.toString());

                if (ascOrDesc) {
                    if (nextValueDouble > currentValueDouble) {
                        list.set(j + 1, list.get(j));
                    } else {
                        break;
                    }
                } else {
                    if (nextValueDouble < currentValueDouble) {
                        list.set(j + 1, list.get(j));
                    } else {
                        break;
                    }
                }

            }
            list.set(j + 1, current);
        }

        /*
         * Collections.sort(list, new Comparator<Map<String, Object>>() { public
         * int compare(Map<String, Object> o1, Map<String, Object> o2) { Double
         * map1value = Double.valueOf( ToolKit.toString(o1.get(key)));
         * o1.put(newKey, o1.get(key)); Double map2value = Double.valueOf(
         * ToolKit.toString(o2.get(key))); o2.put(newKey, o2.get(key));
         * if(ascOrDesc){ return map1value.compareTo(map2value); }else{ return
         * map2value.compareTo(map1value); } } });
         */
    }

    private static List<Map<String, Object>> swap(List<Map<String, Object>> list, int i, int j) {
        Map<String, Object> temp = list.get(i);
        // list.get(i) = list.get(i);
        list.set(i, list.get(j));
        list.set(j, temp);

        return list;
    }

    public static Gson getGson() {
        // final Gson gson = new GsonBuilder().setExclusionStrategies(new
        // FooAnnotationExclusionStrategy()).create();
        final Gson gson = new Gson();
        return gson;
    }

    /**
     * 获取UUID对象
     *
     * @return
     */
    private static UUID getUUID() {
        final UUID uuid = UUID.randomUUID();
        return uuid;
    }

    /**
     * 获取32位UUID
     *
     * @return
     */
    public static String getId() {
        return getUUID().toString().replaceAll("-", "");
    }

    /**
     * 校验企业ID
     *
     * @param enterpriseId
     * @return
     */
    public static boolean checkEnterpriseId(String enterpriseId) {
        boolean flag = false;
        if (ToolKit.isEmpty(enterpriseId) || enterpriseId.length() != 32) {
            return flag;
        } else {
            flag = true;
        }
        return flag;
    }

    /**
     * 判断一个字符串是否为数字类型
     * @param str
     * @return
     */
    public static boolean isNumber(String str) {
        if (str == null) {
            return false;
        } else {
            return str.matches("-?[0-9]+.*[0-9]*");
        }
    }
}
