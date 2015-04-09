package org.ever4j.main.constant;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ever4j.sysconf.entity.SysConfIitem;


public class Constant {
	
	/**
	 *	逻辑删除字段名称
	 */
	public static final String LOGIC_DELETE_FIELD = "is_del"; 
	/**
	 * 初始化枚举时，application中Map的key
	 */
	public static final String ENUM = "enum"; 
	/**
	 * 系统当前登录用户在session中的key
	 */
	public static final String CURRENT_USER = "curUser"; 
	
	public static final String LOG_MAP = "logmap"; 
	
	/**
	 * 菜单权限前缀
	 */
	public static final String AUTH_PREFIX = "ROLE_"; 
	
	/**
	 * 连续登录失败次数
	 */
	public static final Integer FAIL_NUM = 5;
	
	/**
	 * 锁定时间（单位：分钟）
	 */
	public static final Integer LOG_FAILURE_TIME = 1;
	
	public static final String BATCH_NUM = "batchnum";
	
	/**
	 * 系统各种配置项 
	 * 请使用 getSysConfig(String key) 
	 */
	@Deprecated
	public static Map<String, String> configMap = new HashMap<String, String>();
	
	/**
	 * 系统各种配置项
	 */
	public static String getSysConfig(String key){
		return configMap.get(key);
	}
	public static Map<String, List<SysConfIitem>> configItemsWithTypeMap = new HashMap<String, List<SysConfIitem>>();
	
	public enum Cycle{
		year, // 年
		month, // 月
		day; // 日
	}
	
	public enum Operators{
		single, //单表
		union,
		union_all; 
	}
}
