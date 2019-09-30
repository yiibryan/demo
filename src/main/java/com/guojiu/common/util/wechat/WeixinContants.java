package com.guojiu.common.util.wechat;

import java.util.HashMap;
import java.util.Map;

/**
 * 微信相关的常量
 *
 * @author admin
 *
 */
public class WeixinContants {
	// appid 是 第三方用户唯一凭证
	public static final String APPID = "wx422bccec013b603a";
	// secret 是 第三方用户唯一凭证密钥，即appsecret
	public static final String APPSECRET = "8ee4ef3d0b608c77ff8361c6293fe47c";

	//	public static final String APPID = "wx2d660cfec9550fe5";
//	public static final String APPSECRET = "b27df7e27068a1ca865b9548da51f27a";
	//获取AccessToken的url
	public static final String GET_ACCESSTOKEN = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
	//AccessToken
	//public static String ACCESSTOKEN = "6fBenFiIkqO5PNmu3ahKAzIgO9ZZHK68qmNQ_h15fusugDvzfixvrQ-tQuYIwV5EcZZJrxSoGXD4qBkGLDwdTrlybTrHditmqgNSfHJxshuNnZpHC-2wmOL3z5lT9-z8GQEhAFAYIW";
	public static Map<String,Object> ACCESS_TOKEN_MAP = new HashMap<>();
	//获取的url
	public static final String GET_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=ACCESS_TOKEN";
}
