package org.ever4j.task.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;

import org.ever4j.main.constant.Constant.Cycle;
import org.ever4j.system.entity.SysSheet;
import org.ever4j.system.service.SysSheetService;
import org.ever4j.utils.TimeUtil;

public class QuartzSheet {

	@Resource
	private SysSheetService sysSheetService;
	
	public void quartzSheet(){//定时创建表
		
		List<SysSheet> sheetTablelist = sysSheetService.findAll();
		if(sheetTablelist != null && sheetTablelist.size() > 0){
			for (SysSheet sysSheet : sheetTablelist) {
				if(sysSheet != null){
					String cycle = sysSheet.getCycle();
					if(StringUtils.isNotBlank(cycle)){
						if(cycle.equals(Cycle.year.toString())){//年
							createTableOfYear(sysSheet);
						}else if(cycle.equals(Cycle.month.toString())){//月
							createTableOfMonth(sysSheet);
						}else if(cycle.equals(Cycle.day.toString())){//日
							createTableOfDay(sysSheet);
						}
					}
				}
			}
		}
	}
	
	/**
	 * 按天分表
	 * @param yearList
	 */
	public void createTableOfDay(SysSheet sysSheet){
			
		String tableName = sysSheet.getTableName();
		Date startTime = sysSheet.getStartTime();
		
		//创建本天之前(包含本天)的表
		Calendar begin = TimeUtil.date2Calendar(startTime);
		Calendar end = Calendar.getInstance();
		SimpleDateFormat strFormater = new SimpleDateFormat("yyyyMMdd");
		
		while (strFormater.format(begin.getTime()).compareTo(strFormater.format(end.getTime())) <= 0) {
			String tableExtensions = "_"+strFormater.format(begin.getTime());
			String sql = "CREATE TABLE IF NOT EXISTS "+tableName+tableExtensions+" LIKE " + tableName;
			sysSheetService.executeBySql(sql);
			begin.add(Calendar.DAY_OF_MONTH, 1);
		}
		
		//创建明天的表
		String sql = "CREATE TABLE IF NOT EXISTS "+tableName+TimeUtil.nextYearMonthDay()+" LIKE " + tableName;
		sysSheetService.executeBySql(sql);
	}
	
	/**
	 * 按月分表
	 * @param monthList
	 */
	public void createTableOfMonth(SysSheet sysSheet){
		String tableName = sysSheet.getTableName();
		Date startTime = sysSheet.getStartTime();
		
		//创建本月之前(包含本月)的表
		Calendar begin = TimeUtil.date2Calendar(startTime);
		Calendar end = Calendar.getInstance();
		SimpleDateFormat strFormater = new SimpleDateFormat("yyyyMM");
		
		while (strFormater.format(begin.getTime()).compareTo(strFormater.format(end.getTime())) <= 0) {
			String tableExtensions = "_"+strFormater.format(begin.getTime());
			String sql = "CREATE TABLE IF NOT EXISTS "+tableName+tableExtensions+" LIKE " + tableName;
			sysSheetService.executeBySql(sql);
			begin.add(Calendar.MONTH, 1);
		}
		
		//创建下月的表
		if(TimeUtil.firstDayOfMonth()){
			String sql = "CREATE TABLE IF NOT EXISTS "+tableName+TimeUtil.nextYearMonth()+" LIKE " + tableName;
			sysSheetService.executeBySql(sql);
		}
	}
	
	/**
	 * 按年分表
	 * @param yearList
	 */
	public void createTableOfYear(SysSheet sysSheet){
		String tableName = sysSheet.getTableName();
		Date startTime = sysSheet.getStartTime();

		//创建本年之前(包含本年)的表
		Calendar begin = TimeUtil.date2Calendar(startTime);
		Calendar end = Calendar.getInstance();
		SimpleDateFormat strFormater = new SimpleDateFormat("yyyy");
		
		while (strFormater.format(begin.getTime()).compareTo(strFormater.format(end.getTime())) <= 0) {
			String tableExtensions = "_"+strFormater.format(begin.getTime());
			String sql = "CREATE TABLE IF NOT EXISTS "+tableName+tableExtensions+" LIKE " + tableName;
			sysSheetService.executeBySql(sql);
			begin.add(Calendar.YEAR, 1);
		}
		
		//创建下年表
		if(TimeUtil.firstDayOfYear()){
			String sql = "CREATE TABLE IF NOT EXISTS "+tableName+TimeUtil.nextYear()+" LIKE " + tableName;
			sysSheetService.executeBySql(sql);
		}
	}
}
