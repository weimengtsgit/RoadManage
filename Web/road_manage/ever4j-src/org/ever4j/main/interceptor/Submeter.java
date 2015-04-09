package org.ever4j.main.interceptor;

import java.util.Map;

import org.ever4j.main.constant.Constant.Cycle;
import org.ever4j.main.constant.Constant.Operators;
/**
 * 分表查询对象
 * 一条SQL对应一个Submeter对象
 * @author Administrator
 *
 */
public class Submeter {

	/**
	 * 基础表名称
	 */
	private String oldTableName;
	
	/**
	 * 查询开始时间(得到当前查询的表)
	 * 格式：yyyy-MM-dd HH:mm:ss
	 */
	private String searchStartTime;
	
	/**
	 * 分表周期
	 */
	private Cycle cycle;
	
	/**
	 * 操作符，为null时为单表查询
	 */
	private Operators operators;
	
	/**
	 * 查询结束时间(使用operators进行多表取并集等查询时，利用查询结束时间得到查询的所有表)
	 * 格式：yyyy-MM-dd HH:mm:ss
	 */
	private String searchEndTime;
	
	private Map<String, String> subTables = null;
	
	public Submeter() {
		super();
	}
	
	/**
	 * 单表查询
	 * @param oldTableName
	 * @param searchStartTime
	 * @param cycle
	 */
	public Submeter(String oldTableName, String searchStartTime, Cycle cycle) {
		super();
		this.oldTableName = oldTableName;
		this.searchStartTime = searchStartTime;
		this.cycle = cycle;
	}

	public Submeter(String oldTableName, String searchStartTime, Cycle cycle, Operators operators, String searchEndTime) {
		super();
		this.oldTableName = oldTableName;
		this.searchStartTime = searchStartTime;
		this.cycle = cycle;
		this.operators = operators;
		this.searchEndTime = searchEndTime;
	}

	public String getSearchStartTime() {
		return searchStartTime;
	}

	public void setSearchStartTime(String searchStartTime) {
		this.searchStartTime = searchStartTime;
	}

	public String getOldTableName() {
		return oldTableName;
	}

	public Map<String, String> getSubTables() {
		return subTables;
	}

	public void setOldTableName(String oldTableName) {
		this.oldTableName = oldTableName;
	}

	public void setSubTables(Map<String, String> subTables) {
		this.subTables = subTables;
	}
	
	public Cycle getCycle() {
		return cycle;
	}

	public void setCycle(Cycle cycle) {
		this.cycle = cycle;
	}

	public Operators getOperators() {
		return operators;
	}

	public void setOperators(Operators operators) {
		this.operators = operators;
	}

	public String getSearchEndTime() {
		return searchEndTime;
	}

	public void setSearchEndTime(String searchEndTime) {
		this.searchEndTime = searchEndTime;
	}
}
