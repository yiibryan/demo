package com.common;

/**
 * <pre>Title: Constants.java</pre>
 * <pre>Description: Constants.java</pre>
 * <pre>Copyright: Copyright (c) 2017</pre>
 * <pre>Company: JUSFOUN </pre>
 *
 * @author yany
 * @version 1.0
 * @creattime 2017年2月21日 上午9:36:49
 */
public class Constants {
    // 空字符串
    public final static String STRNULL = "";
    /**
     * 字符集编码
     */
    public final static String UTF8 = "UTF-8";
    // . point
    public final static String POINT = ".";
    /**
     * 密钥
     */
    public final static String DEFALUT_KEY = "V1ZBdAMe1TB/9Vc2jUKl4w==";
    public static final String PATTERN_DEFAULT = "yyyy-MM-dd";
    public static final String fullPattern = "yyyy-MM-dd HH:mm:ss";
    public static final String AREA = "area";
    public static final String ROOM = "room";
    public static final Integer BASE_INFO_TYPE = 161;
    public static final Integer PARTMENT_PIC = 162;
    public static final Integer RENDERING_PIC = 163;
    public static String defaultPattern = "yyyy-MM-dd HH:mm";
    public static String otaPattern = "yyyyMMdd HH:mm:ss";
    public static String simpPatn = "yyyy-MM";
    public static String simpyearPatn = "yyyy";
    public static String smallPatn = "yyyyMMdd";
    public static String smallMonth = "yyyyMM";
    public static String smalllestPatn = "yyMMdd";
    public static String dayInWeek = "EEE";
    public static String loginAllowTimePattern = "HH";
    public static String fullPattern1 = "yyyyMMddHHmmss";
    public static String fullPattern2 = "yyyyMMddHHmmssSSS";
    public static String NAME = "name";
    public static String ICON = "icon";
    public static String TOP = "top";
    public static String DATA = "data";

    public static final String TIME = "time";
    public static final String DOUBLE = "double";
    public static final String DICT = "dict";
    public static final String COMPANY = "company";
    public static final String REDIS_PRRFIX = "dcs_demant_";

    public static final String DEFAULT_PASSENGER_ROLE_ID = "-1";
    public static final String DEFAULT_DEPARTMENT_ID = "-1";
    public static final String DEFAULT_PROJECT_ID = "1";

    //房间状态字典
    //未售
    public static final Integer BOOK_HOUSE_TYPE_UNLOCK = 21;
    //已锁定
    public static final Integer BOOK_HOUSE_TYPE_LOCKED = 22;
    //未售
    public static final Integer BOOK_HOUSE_TYPE_SELLED = 23;

    //通用状态
    //正常状态
    public static final Integer STATUS_NORMAL = 191;
    //失效状态
    public static final Integer STATUS_INVALID = 192;
}
