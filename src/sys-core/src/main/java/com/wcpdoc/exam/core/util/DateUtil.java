package com.wcpdoc.exam.core.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.wcpdoc.exam.core.exception.MyException;

/**
 * 日期工具类
 * 
 * @author zhanghc 2015-7-21下午10:20:39
 */
public class DateUtil {
	/** yyyy-MM-dd */
	public static final String FORMAT_DATE = "yyyy-MM-dd";
	/** yyyy-MM-dd HH:mm:ss */
	public static final String FORMAT_DATE_TIME = "yyyy-MM-dd HH:mm:ss";

	/**
	 * 获取格式化时间
	 * 
	 * v1.0 zhanghc 2015-7-21下午10:20:39
	 * @param date
	 * @param pattern
	 * @return String
	 */
	public static String formatDateCustom(Date date, String pattern) {
		SimpleDateFormat format = new SimpleDateFormat(pattern);
		return format.format(date);
	}
	
	/**
	 * 获取格式化时间
	 * 
	 * v1.0 zhanghc 2015-7-21下午10:20:39
	 * @param date yyyy-MM-dd
	 * @return String
	 */
	public static String formatDate(Date date) {
		return formatDateCustom(date, DateUtil.FORMAT_DATE);
	}
	
	/**
	 * 获取格式化时间
	 * 
	 * v1.0 zhanghc 2015-7-21下午10:20:39
	 * @param date yyyy-MM-dd HH:mm:ss
	 * @return String
	 */
	public static String formatDateTime(Date date) {
		return formatDateCustom(date, DateUtil.FORMAT_DATE_TIME);
	}
	
	/**
	 * 获取解析后的时间
	 * 
	 * v1.0 zhanghc 2017年4月23日下午6:05:19
	 * @param dateStr
	 * @param pattern
	 * @return Date
	 */
	public static Date getDateCustom(String dateStr, String pattern) {
		SimpleDateFormat format = new SimpleDateFormat(pattern);
		try {
			return format.parse(dateStr);
		} catch (ParseException e) {
			throw new MyException(String.format("时间格式化异常：%s,%s", dateStr, pattern));
		}
	}
	
	/**
	 * 获取解析后的时间
	 * 
	 * v1.0 zhanghc 2017年4月23日下午6:08:48
	 * @param dateStr yyyy-MM-dd HH:mm:ss 
	 * @return Date
	 */
	public static Date getDateTime(String dateStr) {
		return getDateCustom(dateStr, DateUtil.FORMAT_DATE_TIME);
	}
	
	/**
	 * 获取解析后的时间
	 * 
	 * v1.0 zhanghc 2017年4月23日下午6:08:48
	 * @param dateStr yyyy-MM-dd
	 * @return Date
	 */
	public static Date getDate(String dateStr) {
		return getDateCustom(dateStr, DateUtil.FORMAT_DATE);
	}

	/**
	 * 获取下一月时间
	 * 
	 * v1.0 zhanghc 2017年4月23日下午6:04:23
	 * 
	 * @param date
	 * @param month
	 * @return Date
	 */
	public static Date getNextMonth(Date date, int month) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, month);
		return calendar.getTime();
	}

	/**
	 * 获取下一天时间
	 * 
	 * v1.0 zhanghc 2017年4月23日下午6:04:23
	 * 
	 * @param date
	 * @param day
	 * @return Date
	 */
	public static Date getNextDay(Date date, int day) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, day);
		return calendar.getTime();
	}
	
	/**
	 * 获取下一小时时间
	 * 
	 * v1.0 zhanghc 2017年4月23日下午6:04:23
	 * 
	 * @param date
	 * @param hour
	 * @return Date
	 */
	public static Date getNextHour(Date date, int hour) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.HOUR_OF_DAY, hour);
		return calendar.getTime();
	}
	
	/**
	 * 获取下一分钟时间
	 * 
	 * v1.0 zhanghc 2017年4月23日下午6:04:23
	 * 
	 * @param date
	 * @param minute
	 * @return Date
	 */
	public static Date getNextMinute(Date date, int minute) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MINUTE, minute);
		return calendar.getTime();
	}
	
	/**
	 * 获取下一秒时间
	 * 
	 * v1.0 zhanghc 2017年4月23日下午6:04:23
	 * 
	 * @param date
	 * @param second
	 * @return Date
	 */
	public static Date getNextSecond(Date date, int second) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.SECOND, second);
		return calendar.getTime();
	}

	/**
	 * 相差年份
	 * 
	 * v1.0 zhanghc 2020年1月7日下午2:26:49
	 * @param t1 减数
	 * @param t2 被减数
	 * @return int
	 */
	public static int diffYear(Date t1, Date t2) {
		Calendar bef = Calendar.getInstance();
		bef.setTime(t1);
		Calendar aft = Calendar.getInstance();
		aft.setTime(t2);
		return bef.get(Calendar.YEAR) - aft.get(Calendar.YEAR);
	}
	
	/**
	 * 获取一天的起始时间
	 * 
	 * v1.0 zhanghc 2020年3月2日下午12:51:43
	 * @param date
	 * @return Date
	 */
	public static Date getDayStart(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
		return calendar.getTime();
	}
	
	/**
	 * 获取一天的结束时间
	 * 
	 * v1.0 zhanghc 2020年3月2日下午12:51:43
	 * @param date
	 * @return Date
	 */
	public static Date getDayEnd(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.HOUR_OF_DAY, 23);
		calendar.set(Calendar.MINUTE, 59);
		calendar.set(Calendar.SECOND, 59);
		return calendar.getTime();
	}
	
	/**
	 * 获取一月的起始时间
	 * 
	 * v1.0 zhanghc 2020年3月2日下午12:51:43
	 * @param date
	 * @return Date
	 */
	public static Date getMonthStart(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		return calendar.getTime();
	}
	
	/**
	 * 获取一月的结束时间
	 * 
	 * v1.0 zhanghc 2020年3月2日下午12:51:43
	 * @param date
	 * @return Date
	 */
	public static Date getMonthEnd(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		return calendar.getTime();
	}
	
	/**
	 * 获取随机时间
	 * 
	 * v1.0 zhanghc 2020年4月9日下午1:45:06
	 * @param startTime
	 * @param endTime
	 * @return Date
	 */
	public static Date getRandomDate(Date startTime, Date endTime) {
		long randomLong = Math.round(Math.random() * (endTime.getTime() - startTime.getTime()) + startTime.getTime());
		return new Date(randomLong);
	}
}
