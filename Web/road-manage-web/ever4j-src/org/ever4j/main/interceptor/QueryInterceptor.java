package org.ever4j.main.interceptor;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.hibernate.EmptyInterceptor;
import org.hibernate.type.Type;

import org.ever4j.utils.TimeUtil;

public class QueryInterceptor extends EmptyInterceptor {

	private static final long serialVersionUID = 1L;

	private static final String FROM = " from ";
	private static final String SELECT = "select ";
	private static final String INSERT = "insert into ";
	private static final String UPDATE = "update ";
	
	public static ThreadLocal<Set<Submeter>> submeter = new ThreadLocal<Set<Submeter>>(); 
	
	@Override
	public boolean onSave(Object entity, Serializable id, Object[] state, String[] propertyNames, Type[] types) {

		return super.onSave(entity, id, state, propertyNames, types);
	}

	@Override
	public String onPrepareStatement(String sql) {
		sql = sql.toLowerCase();
		if(submeter.get() != null){
			
			Iterator<Submeter> submeterI = submeter.get().iterator();
			if(submeterI != null){
				while(submeterI.hasNext()){
					Submeter curSubmeter = submeterI.next();
					
					String oldTableName = curSubmeter.getOldTableName();
					String newTableName = oldTableName;
					if(curSubmeter.getCycle().toString().equals("year")){//年
						newTableName = oldTableName + TimeUtil.curYear(curSubmeter.getSearchStartTime());
					}else if(curSubmeter.getCycle().toString().equals("month")){//月
						newTableName = oldTableName + TimeUtil.curYearMonth(curSubmeter.getSearchStartTime());
					}else if(curSubmeter.getCycle().toString().equals("day")){//日
						newTableName = oldTableName + TimeUtil.curYearMonthDay(curSubmeter.getSearchStartTime());
					}
					
					if(sql.contains(SELECT) && sql.contains(oldTableName)){
						if(curSubmeter.getOperators() == null || curSubmeter.getOperators().toString().equals("single")){
							sql = sql.replaceAll(FROM + oldTableName, FROM + newTableName);
						}else{
							
							String newSql = createSql(curSubmeter, sql, oldTableName, newTableName);
							
							if(StringUtils.isNotEmpty(newSql)){
								sql = newSql;
							}
						}
					}else if(sql.contains(INSERT + oldTableName)){
						sql = sql.replaceAll(oldTableName, newTableName);
					}else if(sql.contains(UPDATE+oldTableName + " ")){
						sql = sql.replaceAll(oldTableName, newTableName);
					}
				}
			}
//			
//			Map<String, String> subTables = submeter.get().getSubTables();
//			if(subTables != null && subTables.size() > 0){
//				Set<String> set = subTables.keySet();
//				Iterator<String> setI = set.iterator();
//				while(setI.hasNext()){
//					String subOldTableName = setI.next();
//					String subNewTableName = subTables.get(subOldTableName);
//					sql = sql.replaceAll(subOldTableName, subNewTableName);
//				}
//			}
//			
			System.out.println(sql);
		}
		
		return super.onPrepareStatement(sql);
	}
	
	/**
	 * 创建SQL
	 * @param curSubmeter
	 * @param oldSql
	 * @param oldTableName
	 * @param newTableName
	 * @return
	 */
	public String createSql(Submeter curSubmeter, String oldSql, String oldTableName, String newTableName){
		
		StringBuilder newSql = new StringBuilder();
		
		if(curSubmeter != null){
			
			String oper = "";
			if(curSubmeter.getOperators() != null){															//获得操作符
				if(curSubmeter.getOperators().toString().equals("union")){
					oper = " UNION ";
				}else if(curSubmeter.getOperators().toString().equals("union_all")){
					oper = " UNION ALL ";
				}
			}
			
			Calendar startCalendar = TimeUtil.str2Calendar(curSubmeter.getSearchStartTime(), null);	//开始日期
			Calendar endCalendar = TimeUtil.str2Calendar(curSubmeter.getSearchEndTime(), null);		//截止日期
			
			if(curSubmeter.getCycle() != null && curSubmeter.getCycle().toString().equals("year")){//年
				newSql.append("( " + oldSql.replaceAll(FROM + oldTableName, FROM + newTableName) + " )");
				
				SimpleDateFormat strFormater = new SimpleDateFormat("yyyy");

				startCalendar.add(Calendar.YEAR, 1);
				while (strFormater.format(startCalendar.getTime()).compareTo(strFormater.format(endCalendar.getTime())) <= 0) {
					newTableName = oldTableName + TimeUtil.curYear(TimeUtil.calendar2Str(startCalendar, null));
					newSql.append(oper + "( " + oldSql.replaceAll(FROM + oldTableName, FROM + newTableName)  + " )");
					startCalendar.add(Calendar.YEAR, 1);
				}
			}else if(curSubmeter.getCycle() != null && curSubmeter.getCycle().toString().equals("month")){//月
				newSql.append("( " + oldSql.replaceAll(FROM + oldTableName, FROM + newTableName) + " )");
				
				SimpleDateFormat strFormater = new SimpleDateFormat("yyyyMM");
				
				startCalendar.add(Calendar.MONTH, 1);
				while (strFormater.format(startCalendar.getTime()).compareTo(strFormater.format(endCalendar.getTime())) <= 0) {
					newTableName = oldTableName + TimeUtil.curYearMonth(TimeUtil.calendar2Str(startCalendar, null));
					newSql.append(oper + "( " + oldSql.replaceAll(FROM + oldTableName, FROM + newTableName) + " )");
					startCalendar.add(Calendar.MONTH, 1);
				}
			}else if(curSubmeter.getCycle() != null && curSubmeter.getCycle().toString().equals("day")){//日
				newSql.append("SELECT * FROM (( " + oldSql.replaceAll(FROM + oldTableName, FROM + newTableName) + " )");
				
				SimpleDateFormat strFormater = new SimpleDateFormat("yyyyMMdd");
				
				startCalendar.add(Calendar.DAY_OF_MONTH, 1);
				while (strFormater.format(startCalendar.getTime()).compareTo(strFormater.format(endCalendar.getTime())) <= 0) {
					newTableName = oldTableName + TimeUtil.curYearMonthDay(TimeUtil.calendar2Str(startCalendar, null));
					newSql.append(oper + "( " + oldSql.replaceAll(FROM + oldTableName, FROM + newTableName) + " )");
					startCalendar.add(Calendar.DAY_OF_MONTH, 1);
				}
				newSql.append(")");
			}
		}
		
		return newSql.toString();
	}
}
