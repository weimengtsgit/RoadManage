package org.ever4j.utils;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;


public class TimeUtil {
	
	public static Date parseDate(String dateString) {
		try {
			return DateUtils.parseDate(dateString, new String[] {
					"yyyyMMddHHmmss", "yyyy-MM-dd HH:mm:ss",
					"yyyy/MM/dd HH:mm:ss", "yyyy-MM-dd", "yyyy/MM/dd",
					"yyyyMMdd", "yyyyMM", "yyyy-MM", "yyyy/MM", });
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 日期转换为字符串
	 * 
	 * @param date
	 *            日期
	 * @param format
	 *            日期格式
	 * @return 字符串
	 */
	public static String getFormatedDate(String format) {
		
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(new Date());
	}
	
	/**
	 * 获得当前时间是一年的第几周
	 * @param calendar
	 * @return
	 */
	public static int getWeekOfYear(Calendar calendar){
		return calendar.get(Calendar.WEEK_OF_YEAR);
	}
	
	/**
	 * calendar2Str
	 * @param calendar
	 * @param formatStr
	 * @return
	 */
	public static String calendar2Str(Calendar calendar, String formatStr){
		if(StringUtils.isEmpty(formatStr)){
			formatStr = "yyyy-MM-dd HH:mm:ss";
		}
		SimpleDateFormat strFormater = new SimpleDateFormat(formatStr);
		
		return strFormater.format(calendar.getTime());
	}
	
	/**
	 * str2Calendar
	 * @param dateStr
	 * @param formatStr
	 * @return
	 */
	public static Calendar str2Calendar(String dateStr, String formatStr){
		Calendar calendar = Calendar.getInstance();
		try{
			
			if(StringUtils.isEmpty(dateStr)){
//				dateStr = calendar2Str(calendar, null);
				return calendar;
			}
			
			if(StringUtils.isEmpty(formatStr)){
				formatStr = "yyyy-MM-dd HH:mm:ss";
			}
			
			SimpleDateFormat strFormater = new SimpleDateFormat(formatStr);
			Date date = strFormater.parse(dateStr);
			
			calendar.setTime(date);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return calendar;
	}
	
	/**
	 * date2Calendar
	 * @param date
	 * @return
	 */
	public static Calendar date2Calendar(Date date){
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		
		return calendar;
	}
	
	/**
	 * 获得当前年月
	 * @return
	 */
	public static String curYearMonth(){
		SimpleDateFormat strFormater = new SimpleDateFormat("yyyyMM");
		Calendar lastDate = Calendar.getInstance();
		return "_"+strFormater.format(lastDate.getTime());
	}
	
	/**
	 * 获得当前年月
	 * @param dateString
	 * @return
	 */
	public static String curYearMonth(String dateString){
		if(StringUtils.isEmpty(dateString)){
			return curYearMonth();
		}else{
			Date date = TimeUtil.parseDate(dateString);
			SimpleDateFormat strFormater = new SimpleDateFormat("yyyyMM");
			return "_"+strFormater.format(date);
		}
	}
	
	/**
	 * 获得当前年月日
	 * @return
	 */
	public static String curYearMonthDay(){
		SimpleDateFormat strFormater = new SimpleDateFormat("yyyyMMdd");
		Calendar lastDate = Calendar.getInstance();
		return "_"+strFormater.format(lastDate.getTime());
	}
	
	/**
	 * 获得当前年月日
	 * @param dateString
	 * @return
	 */
	public static String curYearMonthDay(String dateString){
		if(StringUtils.isEmpty(dateString)){
			return curYearMonthDay();
		}else{
			Date date = TimeUtil.parseDate(dateString);
			SimpleDateFormat strFormater = new SimpleDateFormat("yyyyMMdd");
			return "_"+strFormater.format(date);
		}
	}
	
	/**
	 * 获得当前年
	 * @return
	 */
	public static String curYear(){
		SimpleDateFormat strFormater = new SimpleDateFormat("yyyy");
		Calendar lastDate = Calendar.getInstance();
		return "_"+strFormater.format(lastDate.getTime());
	}
	
	/**
	 * 获得当前年
	 * @param dateString
	 * @return
	 */
	public static String curYear(String dateString){
		if(StringUtils.isEmpty(dateString)){
			return curYear();
		}else{
			Date date = TimeUtil.parseDate(dateString);
			SimpleDateFormat strFormater = new SimpleDateFormat("yyyy");
			return "_"+strFormater.format(date);
		}
	}
	
	/**
	 * 获得下一个年月
	 * @return
	 */
	public static String nextYearMonth(){
		SimpleDateFormat strFormater = new SimpleDateFormat("yyyyMM");
		Calendar lastDate = Calendar.getInstance();
		lastDate.add(Calendar.MONTH,1);
		return "_"+strFormater.format(lastDate.getTime());
	}
	
	/**
	 * 获得下一个年
	 * @return
	 */
	public static String nextYear(){
		SimpleDateFormat strFormater = new SimpleDateFormat("yyyy");
		Calendar lastDate = Calendar.getInstance();
		lastDate.add(Calendar.YEAR,1);
		return "_"+strFormater.format(lastDate.getTime());
	}
	
	/**
	 * 获得下一天
	 * @return
	 */
	public static String nextYearMonthDay(){
		SimpleDateFormat strFormater = new SimpleDateFormat("yyyyMMdd");
		Calendar lastDate = Calendar.getInstance();
		lastDate.add(Calendar.DAY_OF_MONTH,1);
		return "_"+strFormater.format(lastDate.getTime());
	}
	
	/**
	 * 获取今天在本年的第几天
	 * @return
	 */
	public static int getDayOfYear() {
		return Calendar.getInstance().get(Calendar.DAY_OF_YEAR);
	}
	
	/**
	 * 今天是否是一年的第一天
	 * @return
	 */
	public static boolean firstDayOfYear(){
		return Calendar.getInstance().get(Calendar.DAY_OF_YEAR) == 1 ? true : false;
	}
	
	/**
	 * 获取今天在本月的第几天
	 * @return
	 */
	public static int getDayOfMonth() {
		return Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
	}
	
	/**
	 * 今天是否是一月的第一天
	 * @return
	 */
	public static boolean firstDayOfMonth(){
		return Calendar.getInstance().get(Calendar.DAY_OF_MONTH) == 1 ? true : false;
	}
	
	public static String getFirstDayOfMonth(String dateformat){      
       String str = "";
       if(StringUtils.isBlank(dateformat)){
			dateformat = "yyyy-MM-dd HH:mm:ss";
		}
       
       SimpleDateFormat sdf=new SimpleDateFormat(dateformat);        
   
       Calendar lastDate = Calendar.getInstance();    
       lastDate.set(Calendar.DATE,1);//设为当前月的1号    
       lastDate.set(Calendar.HOUR_OF_DAY,0);//设为当前时间为0    
       lastDate.set(Calendar.MINUTE,0);//设为当前分钟为0
       lastDate.set(Calendar.SECOND,0);//设为当前秒为0 
       str=sdf.format(lastDate.getTime());    
       return str;      
    }    
	
	/**
	 * 获得当前时间
	 * @param dateformat
	 * @return
	 */
	public static String getNowTime(String dateformat){
		if(StringUtils.isBlank(dateformat)){
			dateformat = "yyyy-MM-dd HH:mm:ss";
		}
		Date now = new Date();       
        SimpleDateFormat dateFormat = new SimpleDateFormat(dateformat);//可以方便地修改日期格式       
        String nowStr = dateFormat.format(now);       
        return nowStr;    
    }    
	
	/**
	 * 获得距离calendar的某天时间 
	 * @param calendar 日期
	 * @param dateformat dateformat
	 * @param amount 相差天数
	 * @param hourOfDay 小时
	 * @param minute 分钟
	 * @param second 秒
	 * @return
	 */
	public static String getSomedayTime(Calendar calendar, String dateformat, int amount, int hourOfDay, int minute, int second){
		if(StringUtils.isBlank(dateformat)){
			dateformat = "yyyy-MM-dd HH:mm:ss";
		}
		
		SimpleDateFormat dateFormat = new SimpleDateFormat(dateformat);
		calendar.add(Calendar.DATE, amount);
		calendar.set(Calendar.HOUR_OF_DAY,hourOfDay);//设为当前时间为0    
		calendar.set(Calendar.MINUTE,minute);//设为当前分钟为0
		calendar.set(Calendar.SECOND,second);//设为当前秒为0 
		String str = dateFormat.format(calendar.getTime());
		
		return str;
	}
	
	/**
	 * 获得当天00:00:00
	 * @param dateformat
	 * @return
	 */
	public static String getTodayTime(String dateformat){
		if(StringUtils.isBlank(dateformat)){
			dateformat = "yyyy-MM-dd HH:mm:ss";
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat(dateformat);
		Calendar lastDate = Calendar.getInstance();
		lastDate.set(Calendar.HOUR_OF_DAY,0);//设为当前时间为0    
		lastDate.set(Calendar.MINUTE,0);//设为当前分钟为0
		lastDate.set(Calendar.SECOND,0);//设为当前秒为0 
		String str = dateFormat.format(lastDate.getTime());
		
		return str;
	}
	
	/**
	 * 获得昨天00:0:00
	 * @return
	 */
	public static Calendar getYesterdayCalendar(){
		
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, -1);
		calendar.set(Calendar.HOUR_OF_DAY,0);//设为当前时间为0    
		calendar.set(Calendar.MINUTE,0);//设为当前分钟为0
		calendar.set(Calendar.SECOND,0);//设为当前秒为0 
		
		return calendar;
	}
	
	/**
	 * 获得距离calendar的某天
	 * @param calendar 日期
	 * @param amount 相差天数
	 * @param hourOfDay 小时
	 * @param minute 分钟
	 * @param second 秒
	 * @return
	 */
	public static Calendar getSomedayCalendar(Calendar calendar, int amount, int hourOfDay, int minute, int second){
		calendar.add(Calendar.DATE, amount);
		calendar.set(Calendar.HOUR_OF_DAY,hourOfDay);//设为当前时间为0    
		calendar.set(Calendar.MINUTE,minute);//设为当前分钟为0
		calendar.set(Calendar.SECOND,second);//设为当前秒为0 
		
		return calendar;
	}
	
	/**
	 * 日期转换为字符串
	 * 
	 * @param date
	 *            日期
	 * @param format
	 *            日期格式
	 * @return 字符串
	 */
	public static String date2Str(Date date, String format) {
		if (null == date) {
			return null;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(date);
	}
	
	/**
	 * 字符串转换成日期 如果转换格式为空，则利用默认格式进行转换操作
	 * 
	 * @param str
	 *            字符串
	 * @param format
	 *            日期格式
	 * @return 日期
	 * @throws java.text.ParseException
	 */
	public static Date str2Date(String str, String format) {
		if (null == str || "".equals(str)) {
			return null;
		}
		// 如果没有指定字符串转换的格式，则用默认格式进行转换
		if (null == format || "".equals(format)) {
			format = "yyyy-MM-dd HH:mm:ss";
		}
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Date date = null;
		try {
			date = sdf.parse(str);
			return date;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 字符串转换时间戳
	 * 
	 * @param str
	 * @return
	 */
	public static Timestamp str2Timestamp(String str) {
		Date date = str2Date(str, "yyyy-MM-dd HH:mm:ss");
		return new Timestamp(date.getTime());
	}

	/**
	 * 时间戳转换为字符串
	 * 
	 * @param time
	 * @return
	 */
	public static String timestamp2Str(Timestamp time,String format) {
		Date date = null;
		if (null != time) {
			date = new Date(time.getTime());
		}
		
		if(StringUtils.isBlank(format)){
			format = "yyyy-MM-dd HH:mm:ss";
		}
		
		return date2Str(date, format);
	}
	
	public static String getTimesConvert(long beginTime, long endTime){
		long between = endTime - beginTime;  
		long day = between / (24 * 60 * 60 * 1000);
        long hour = (between / (60 * 60 * 1000) - day * 24);
        long min = ((between / (60 * 1000)) - day * 24 * 60 - hour * 60);
        long s = (between / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);
        long ms = (between - day * 24 * 60 * 60 * 1000 - hour * 60 * 60 * 1000
                - min * 60 * 1000 - s * 1000);
        if(day != 0){
        	return day + "天" + hour + "小时" + min + "分" + s + "秒" + ms + "毫秒";
        }else if(hour != 0){
        	return hour + "小时" + min + "分" + s + "秒" + ms + "毫秒";
        }else if(min != 0){
        	return min + "分" + s + "秒" + ms + "毫秒";
        }else if(s != 0){
        	return s + "秒" + ms + "毫秒";
        }else {
        	return ms + "毫秒";
        }
//        String result = day + "天" + hour + "小时" + min + "分" + s + "秒" + ms + "毫秒";
	}
	
	
	public static int getDate4int(Date date){
		return Integer.parseInt(date2Str(date,"yyyyMMdd"));
	}
	public static SimpleDateFormat strFormater = new SimpleDateFormat("yyyyMMdd");
	public static int getDate4int(int i){
		Calendar lastDate = Calendar.getInstance();
		lastDate.add(Calendar.DAY_OF_MONTH,i);
		return Integer.parseInt(strFormater.format(lastDate.getTime()));
	}
	public static String getDate4String(int i){
		Calendar lastDate = Calendar.getInstance();
		lastDate.add(Calendar.DAY_OF_MONTH,i);
		return strFormater.format(lastDate.getTime());
	}
	public static void main(String[] args) {
		
		int today = TimeUtil.getDate4int(0);
		int yestody = TimeUtil.getDate4int(-1);
		System.out.println(today);
		System.out.println(yestody);
	}
}
