package com.guojiu.common.util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.guojiu.common.Constants;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * 日期工具类 提供了date类型与string类型的相互转换
 *
 * @author yany
 * @date 2014-7-23
 */
public class DateUtil {
	private static final Logger LOG = LoggerFactory.getLogger(DateUtil.class);
	private static SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd", Locale.CHINA);

	/**
	 * 转换日期格式
	 *
	 * @param dateStr
	 *            日期字符串
	 * @param src
	 *            日期源格式
	 * @param dest
	 *            日期转后后的目标格式
	 * @return 转换格式后的日期字符串
	 * @throws ParseException
	 *             如果格式转换失败，则抛出异常
	 */
	public static String changeDateStrFormate(String dateStr, String src, String dest) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat(src);
		Date date = sdf.parse(dateStr);
		sdf = new SimpleDateFormat(dest);
		return sdf.format(date);
	}

	/**
	 * 获取指定格式的当前时间字符串
	 *
	 * @param pattern
	 * @return
	 */
	public static String getCurDateStr(String pattern) {
		String dateStr = null;
		try {
			if (StringUtils.isNotBlank(pattern)) {
				dateStr = DateFormatUtils.format(new Date(), pattern);
			} else {
				dateStr = DateFormatUtils.format(new Date(), Constants.fullPattern2);
			}
		} catch (Exception ex) {
			LOG.error("数据格式化错误", ex);
		}
		return dateStr;
	}

	/**
	 * 将字符串转换为Date类型
	 *
	 * @param dateStr
	 *            日期字符串
	 * @param pattern
	 *            格式
	 * @return Date对象
	 * @throws ParseException
	 *             当进行格式化的时候失败，抛出该异常。
	 */
	public static Date getDateByString(String dateStr, String pattern) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.parse(dateStr);
	}

	/**
	 * 将Date类型转换为String类型
	 *
	 * @param date
	 *            日期
	 * @param pattern
	 *            格式
	 * @return 日期对应格式的字符串
	 */
	public static String getStringByDate(Date date, String pattern) {
		if (StringUtils.isBlank(pattern)) {
			return getDefaultDateFormat().format(date);
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat(pattern);
			return sdf.format(date);
		}
	}

	/**
	 * 将时间戳转换为时间
	 *
	 * @param stamp
	 *            时间戳
	 * @param pattern
	 *            格式
	 * @return 时间戳对应格式的日期
	 */
	public static String stampToDate(String stamp, String pattern) {
		String res;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		long lt = new Long(stamp);
		Date date = new Date(lt);
		res = simpleDateFormat.format(date);
		return res;
	}

	/**
	 * 获取默认格式对象
	 *
	 * @return 简单的时间格式化对象
	 */
	private static SimpleDateFormat getDefaultDateFormat() {
		return new SimpleDateFormat(Constants.PATTERN_DEFAULT);
	}

	/**
	 * 返回减去指定天数的日期.
	 *
	 * @param date
	 *            将运算日期.
	 * @param day
	 *            减去的天数. return
	 * @author liboc
	 */
	public static Date subtractDate(final Date date, final int day) {
		try {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			int currDay = Calendar.DAY_OF_MONTH;
			calendar.set(currDay, calendar.get(currDay) - day); // 让日期减 day天
			return calendar.getTime();
		} catch (Exception ex) {
			LOG.error("", ex);
			return null;
		}
	}

	/**
	 * 获取当前DATE
	 *
	 * @return
	 */
	public static Date nowDate() {
		return new Date();
	}

	/**
	 * 获取当前Timestamp 系统毫秒
	 *
	 * @return
	 */
	public static Timestamp nowTimestamp() {
		return new Timestamp(System.currentTimeMillis());
	}

	/**
	 * 获取参数本月的第一天
	 *
	 * @param calendar
	 * @return
	 */
	public static Date getFirstDate(Calendar calendar) {
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		return calendar.getTime();
	}

	/**
	 * 获取参数本月的第一天获取参数本月的最后一天
	 *
	 * @param cal
	 * @return
	 */
	public static Date getLastDate(Calendar cal) {
		int day = cal.getMaximum(Calendar.DAY_OF_MONTH);
		cal.set(Calendar.DAY_OF_MONTH, day);
		return cal.getTime();
	}

	/**
	 * 向字符串时间中增加指定天数
	 *
	 * @param begin
	 *            开始时间
	 * @param pattern
	 *            格式
	 * @param len
	 *            长度
	 * @return
	 */
	public static Date addByDay(String begin, String pattern, int len) {
		Date temp = null;
		try {
			if (begin.length() >= 10) {
				temp = getDateByString(begin, pattern);
			}
			Calendar ca = Calendar.getInstance();
			if (temp != null) {
				ca.setTime(temp);
				ca.add(Calendar.DATE, len);
			}
			return ca.getTime();
		} catch (ParseException e) {
			LOG.error("", e);
		}
		return null;
	}

	public static String getCurrentTime(String dateFormat) {
		String currentTimeStr = "";
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		DateFormat df = new SimpleDateFormat(dateFormat);
		currentTimeStr = df.format(date);
		return currentTimeStr;
	}

	/**
	 * 返回加上指定天数的日期.
	 *
	 * @param date
	 *            将运算日期.
	 * @param day
	 *            加上的天数. return
	 */
	public static Date plusDate(final Date date, final int day) {
		try {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			int currDay = Calendar.DAY_OF_MONTH;
			calendar.set(currDay, calendar.get(currDay) + day); // 让日期加 day天
			return calendar.getTime();
		} catch (Exception ex) {
			return null;
		}
	}

	/**
	 * 获取传入年月：yyyyMM的上一个月
	 *
	 * @param dateStr：格式yyyyMM
	 * @return
	 */
	public static String getBeforMonth(String dateStr) {
		SimpleDateFormat sdf = new SimpleDateFormat(Constants.smallMonth);
		Date date = null;
		try {
			date = sdf.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar cal = Calendar.getInstance();
		if (cal != null) {
			cal.setTime(date);
			cal.add(Calendar.MONTH, -1);
		}
		return sdf.format(cal.getTime());
	}

	/**
	 * 返回本年的开始日期和结束日期
	 *
	 * @return
	 */
	public static HashMap<String, String> getYear() {
		String year = DateUtil.getStringByDate(DateUtil.nowDate(), "yyyy");
		HashMap<String, String> timeMap = new HashMap<String, String>();
		timeMap.put("begin", year + "-01-01");
		timeMap.put("end", year + "-12-31");
		return timeMap;
	}

	/**
	 * 返回参数年的开始日期和结束日期
	 *
	 * @return
	 */
	public static HashMap<String, String> getYear(String year) {
		HashMap<String, String> timeMap = new HashMap<String, String>();
		if (ToolKit.isEmpty(year)) {
			return timeMap;
		}
		timeMap.put("begin", year + "-01-01");
		timeMap.put("end", year + "-12-31");
		return timeMap;
	}

	/**
	 * 返回本季度的开始日期和结束日期
	 *
	 * @return
	 */
	public static HashMap<String, String> getQuarter() {
		HashMap<String, String> timeMap = new HashMap<String, String>();
		Calendar c = Calendar.getInstance();
		int currentMonth = c.get(Calendar.MONTH) + 1;
		// System.out.println(c.get(Calendar.MONTH) );
		if (currentMonth >= 1 && currentMonth <= 3)
			c.set(Calendar.MONTH, 0);
		else if (currentMonth >= 4 && currentMonth <= 6)
			c.set(Calendar.MONTH, 3);
		else if (currentMonth >= 7 && currentMonth <= 9)
			c.set(Calendar.MONTH, 6);
		else if (currentMonth >= 10 && currentMonth <= 12)
			c.set(Calendar.MONTH, 9);
		c.set(Calendar.DATE, 1);
		String begin = fmt.format(c.getTime());
		c = Calendar.getInstance();
		fmt = new SimpleDateFormat("yyyy-MM-dd", Locale.CHINA);
		currentMonth = c.get(Calendar.MONTH) + 1;
		if (currentMonth >= 1 && currentMonth <= 3) {
			c.set(Calendar.MONTH, 2);
			c.set(Calendar.DATE, 31);
		} else if (currentMonth >= 4 && currentMonth <= 6) {
			c.set(Calendar.MONTH, 5);
			c.set(Calendar.DATE, 30);
		} else if (currentMonth >= 7 && currentMonth <= 9) {
			c.set(Calendar.MONTH, 8);
			c.set(Calendar.DATE, 30);
		} else if (currentMonth >= 10 && currentMonth <= 12) {
			c.set(Calendar.MONTH, 11);
			c.set(Calendar.DATE, 31);
		}
		String end = fmt.format(c.getTime());
		timeMap.put("begin", begin);
		timeMap.put("end", end);
		return timeMap;
	}
public static void main(String[] args) {
	System.out.println(getNextmoth());
	  System.out.println(getQuarter());
	  Map<String, String> map=getQuarter();
	  try {
		System.out.println(new SimpleDateFormat("yyyy-MM-dd").parse(map.get("end")));
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
	/**
	 * 返回本月的开始日期和结束日期
	 *
	 * @return
	 */
	public static HashMap<String, String> getMonth() {
		Calendar calendar = Calendar.getInstance();
		HashMap<String, String> timeMap = new HashMap<String, String>();
		calendar.setTime(new Date());
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		String begin = fmt.format(calendar.getTime());
		calendar.add(Calendar.MONTH, 1);
		calendar.add(Calendar.DAY_OF_MONTH, -1);
		String end = fmt.format(calendar.getTime());
		timeMap.put("begin", begin);
		timeMap.put("end", end);
		return timeMap;
	}

	/**
	 * 返回指定月的开始日期和结束日期
	 *
	 * @return
	 */
	public static HashMap<String, String> getMonth(Date date) {
		Calendar calendar = Calendar.getInstance();
		HashMap<String, String> timeMap = new HashMap<String, String>();
		calendar.setTime(date);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		String begin = fmt.format(calendar.getTime());
		calendar.add(Calendar.MONTH, 1);
		calendar.add(Calendar.DAY_OF_MONTH, -1);
		String end = fmt.format(calendar.getTime());
		timeMap.put("begin", begin);
		timeMap.put("end", end);
		return timeMap;
	}

	/**
	 * 返回本周的开始日期和结束日期
	 *
	 * @return
	 */
	public static HashMap<String, String> getWeek() {
		HashMap<String, String> timeMap = new HashMap<String, String>();
		Calendar calendar = Calendar.getInstance(Locale.CHINA);
		calendar.setFirstDayOfWeek(Calendar.MONDAY);
		// 当前时间，貌似多余，其实是为了所有可能的系统一致
		calendar.setTimeInMillis(System.currentTimeMillis());
		// System.out.println("当前时间:" + fmt.format(calendar.getTime()));
		calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		// System.out.println("周一时间:" + fmt.format(calendar.getTime()));
		String begin = fmt.format(calendar.getTime());
		calendar.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		// System.out.println("周一时间:" + fmt.format(calendar.getTime()));
		String end = fmt.format(calendar.getTime());
		timeMap.put("begin", begin);
		timeMap.put("end", end);
		return timeMap;
	}

	/**
	 * 返回从本年开始的多少年
	 *
	 * @return
	 */
	public static HashMap<String, String> getMoreYear(int year) {
		HashMap<String, String> yearTemp = getYear();
		if (year > 1) {
			String str = yearTemp.get("begin");
			String[] split = str.split("-");
			yearTemp.put("begin", Integer.valueOf(split[0]) - year + 1 + "-" + split[1] + "-" + split[2]);
			return yearTemp;
		} else {
			return yearTemp;
		}
	}

	/**
	 * 返回从当前天算起过去的十二个月
	 *
	 * @return
	 */
	public static HashMap<String, String> getABSYear() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		HashMap<String, String> timeMap = new HashMap<String, String>();
		Calendar cal = Calendar.getInstance();// 获取当前日期

		// 获取前月的最后一天
		cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));

		String last = format.format(cal.getTime());
		timeMap.put("end", last);
		// 获取前月的第一天
		cal.add(Calendar.MONTH, -11);
		cal.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
		String firstDay = format.format(cal.getTime());
		timeMap.put("begin", firstDay);
		return timeMap;

	}

	/**
	 * 返回从指定时间算起过去的十二个月
	 *
	 * @return
	 * @throws ParseException
	 */
	public static HashMap<String, String> getABSYear(Date date) throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		HashMap<String, String> timeMap = new HashMap<String, String>();
		Calendar cal = Calendar.getInstance();// 获取当前日期

		if (!ToolKit.isEmpty(date)) {
			cal.setTime(date);
		}

		// 获取当月的最后一天
		cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));

		String last = format.format(cal.getTime());
		timeMap.put("end", last);
		// 获取前月的第一天
		cal.add(Calendar.MONTH, -11);
		cal.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
		String firstDay = format.format(cal.getTime());
		timeMap.put("begin", firstDay);
		return timeMap;

	}

	/**
	 *   获取某一时间向前31的日期
	 * @param date  传入某一个时间
	 * @return
	 *        begin为传参的日期的前31天的日期
	 *        end为当前时间
	 *        返回的map
	 * @throws ParseException
	 */
	public static HashMap<String, String> getLastMoth(Date date) throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		HashMap<String, String> timeMap = new HashMap<String, String>();
		Calendar cal = Calendar.getInstance();// 获取当前日期

		if (!ToolKit.isEmpty(date)) {
			cal.setTime(date);
		}

		// 获取当月的最后一天
		cal.setTime(date);

		String last = format.format(cal.getTime());
		timeMap.put("end", last);
		// 获取前月的第一天
		cal.add(Calendar.DATE, -31);
		// cal.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天
		String firstDay = format.format(cal.getTime());
		timeMap.put("begin", firstDay);
		return timeMap;

	}

	/**
	 * 获取本月有多少天
	 * @return  返回int值
	 */
	public static int getCurrentMonthLastDay() {
		Calendar a = Calendar.getInstance();
		a.set(Calendar.DATE, 1);// 把日期设置为当月第一天
		a.roll(Calendar.DATE, -1);// 日期回滚一天，也就是最后一天
		int maxDate = a.get(Calendar.DATE);
		return maxDate;
	}

	/**
	 * 获取指定月的天数（传参任选其中一个参数，两个都有默认执行date参数）
	 *
	 * @param date
	 *            输入的时间为date类型
	 * @param datetime
	 *            输入的时间为字符类型
	 * @return    返回的int值
	 */
	public static int getAssigntime(Date date, String datetime) {
		Calendar calendar = Calendar.getInstance();
		if (date != null) {
			calendar.setTime(date);
		} else {
			try {
				calendar.setTime(new SimpleDateFormat("yyyy-MM").parse(datetime));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

	}

	/**
	 * 获取上月--年月
	 *
	 * @return 返回当前时间上月的年月的字符类型
	 */
	public static String getlastmoth() {
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, -1);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
		String time = format.format(c.getTime());
		return time;
	}

	/**
	 * 获取下个月--年月
	 *
	 * @return 返回当前时间上月的年月的字符类型
	 */
	public static String getNextmoth() {
		return getNextmoth(1);
	}



	/**
	 * 获取间隔个月--年月
	 *
	 * @return 返回当前时间上月的年月的字符类型
	 */
	public static String getNextmoth(int i) {
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, i);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");

		String time = format.format(c.getTime());
		return time;
	}

	private static final List<String> SHANG_BAN_NIAN = new ArrayList<String>(){{
		add("01");
		add("02");
		add("03");
		add("04");
		add("05");
		add("06");
	}};
	/**
	 * 获取当前半年最后一个月
	 *
	 */
	public static String getCurrentHalfYearFinalMonth() {

		String m = getStringByDate(new Date(), "MM");
		if(SHANG_BAN_NIAN.contains(m)){
			return getStringByDate(new Date(),"yyyy")+"-06";
		}else{
			return getStringByDate(new Date(),"yyyy")+"-12";
		}
	}

	/**
	 * 获取下个半年开始月
	 * @return
	 */
	public static String getNextHalfYear() {

		String m = getStringByDate(new Date(), "MM");
		if(SHANG_BAN_NIAN.contains(m)){
			return getStringByDate(new Date(),"yyyy")+"-07";
		}else{
			Calendar c = Calendar.getInstance();
			c.add(Calendar.YEAR, 1);
			SimpleDateFormat format = new SimpleDateFormat("yyyy");
			String time = format.format(c.getTime());
			return time+"-01";
		}
	}

	public static String getNextYear() {
		Calendar c = Calendar.getInstance();
		c.add(Calendar.YEAR, 1);
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		String time = format.format(c.getTime());
		return time;
	}

	/**
	 * 获取上一年
	 * @return
	 */
	public static String getLastYear() {
		return getLastYear(null);
	}

	public static String getLastYear(String year) {
		Calendar c = Calendar.getInstance();
		try {
			if(year!=null){
				c.setTime(getDateByString(year,"yyyy"));
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		c.add(Calendar.YEAR, -1);
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		String time = format.format(c.getTime());
		return time;
	}

	public static String getNextQuarterStratMonth() {
		HashMap<String, String> quarter = getQuarter();
		String end = quarter.get("end");
		Calendar c = Calendar.getInstance();
		try {
			c.setTime(getDateByString(end,"yyyy-MM-dd"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		c.add(Calendar.MONTH, 1);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
		String time = format.format(c.getTime());
		return time;
	}



	/**
	 * 获取当前日期向前后推的日期
	 *
	 * @param date
	 *            输入的日期
	 * @param x
	 *            向前向后的天数 正数为向前，负数为向后
	 * @return 返回字符类型日期
	 */
	public static String getTomorrow(Date date, int x) {
		Calendar calendar = new GregorianCalendar();
		// Date date2 = null;
		// try {
		// date2 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
		// } catch (ParseException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
		calendar.setTime(date);
		calendar.add(Calendar.DATE, x);// 把日期往后增加一天.整数往后推,负数往前移动
		date = calendar.getTime(); // 这个时间就是日期往后推一天的结果
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(date);
		return dateString;
	}

	public static String getTomorrow(String string, int x) throws ParseException {
		Calendar calendar = new GregorianCalendar();
		// Date date2 = null;
		// try {
		// date2 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
		// } catch (ParseException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
		Date date = null;
		date = new SimpleDateFormat("yyyy-MM-dd").parse(string);
		calendar.setTime(date);
		calendar.add(Calendar.DATE, x);// 把日期往后增加一天.整数往后推,负数往前移动

		date = calendar.getTime(); // 这个时间就是日期往后推一天的结果
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(date);
		return dateString;
	}
	/**
	 * 计算两个日期之间相差的天数
	 *
	 * @param
	 *
	 * @param
	 *
	 * @return 相差天数
	 * @throws ParseException
	 *             calendar 对日期进行时间操作 getTimeInMillis() 获取日期的毫秒显示形式
	 */

	public static int daysBetween(Date timeBegin, Date timeOut) throws ParseException {
		return daysBetween(getStringByDate(timeBegin,"yyyy-MM-dd"),getStringByDate(timeOut,"yyyy-MM-dd"));
	}
	public static int daysBetween(String timeBegin, String timeOut) throws ParseException {

		Date smdate = new SimpleDateFormat("yyyy-MM-dd").parse(timeBegin);
		Date bdate = new SimpleDateFormat("yyyy-MM-dd").parse(timeOut);
		Calendar cal = Calendar.getInstance();
		cal.setTime(smdate);
		long time1 = cal.getTimeInMillis();
		cal.setTime(bdate);
		long time2 = cal.getTimeInMillis();
		long between_days = (time2 - time1) / (1000 * 3600 * 24);
		return Integer.parseInt(String.valueOf(between_days));
	}

}
