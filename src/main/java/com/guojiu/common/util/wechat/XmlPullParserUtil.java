package com.guojiu.common.util.wechat;

import java.io.Reader;
import java.io.StringReader;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;


/**
 * 微信请求的XML解析帮助类
 * @author admin
 *
 */
public class XmlPullParserUtil {

	/*
	 * 1、返回消息对象Msg,这消息对象封装XML所有的属性
	 *    问题:消息分很多类型，
	 *         如果只创建一个类，要把所有类型的所有属性都包含到里面。
	 *         可以抽取基类，让它具有所有类型公共的属性，发送者等。。。对不同的类型派生出很多类型
	 * 2、返回一个Map<String,String>,以标签名作为Key，以标签的内容作为value
	 * */
	public static Map<String, String> parse(Reader reader) {
		//声明
		Map<String, String> result = new HashMap<String, String>();
		try {
			//1、获取解析器
			/*XmlPullParser parser = XmlPullParserFactory.newInstance().newPullParser();
			//2、设置解决XML流
			parser.setInput(reader);
			//3、解析
			//常用的事件类型
			//XmlPullParser.START_DOCUMENT//文档开始
			// XmlPullParser.END_DOCUMENT //文档结束
			// XmlPullParser.START_TAG//标签开始
			// XmlPullParser.END_TAG //标签结束

			//如果文档没有结束则要一直解析
			int eventType = parser.getEventType();
			while (XmlPullParser.END_DOCUMENT != eventType) {

				//解析操作 标签开始时就解析，并且标签不能为xml
				String tagName = parser.getName();
				if (XmlPullParser.START_TAG == eventType && !"xml".equals(tagName)) {
					String tagConent = parser.nextText();
					//解析内容放到Map
					result.put(tagName, tagConent);
				}
				//解析一个事件完成后，要走下一个事件
				eventType = parser.next();
			}*/

		} catch (Exception e) {
			e.printStackTrace();
		}
		//做返回
		return result;
	}

	public static void main(String[] args) {
		String content =
				"<xml>"+
			    "<ToUserName><![CDATA[gh_ae9b8f50b1b3]]></ToUserName>"+
					"<FromUserName><![CDATA[oxLXms6cL0ECuVST7vQiDZdg4RbU]]></FromUserName>"+
					"<CreateTime>1478845261</CreateTime>"+
					"<MsgType><![CDATA[text]]></MsgType>"+
					"<Content><![CDATA[test]]></Content>"+
					"<MsgId>6351592032393405755</MsgId> "+
				"</xml>";

		Map<String, String> parse = parse(new StringReader(content));
		Set<Entry<String, String>> entrySet = parse.entrySet();
		Iterator<Entry<String, String>> iterator = entrySet.iterator();
		while (iterator.hasNext()) {
			Entry<String, String> next = iterator.next();
			System.out.println(next.getKey()+":"+next.getValue());

		}
	}
}
