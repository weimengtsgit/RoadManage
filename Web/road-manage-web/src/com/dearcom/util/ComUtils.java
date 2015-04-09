package com.dearcom.util;

import org.ever4j.main.constant.Constant;
import org.ever4j.system.entity.SysUser;
import org.ever4j.utils.SessionUtil;

public class ComUtils {

	public static String getMessageSign() {
		String sign = 	Constant.getSysConfig("common_message_sign"); 
		
		SysUser user = SessionUtil.getCurrentUser();
		// 系统管理员
		if("1".equals(user.getUserType())){
			
		}
		// 商场管理员
		else if("2".equals(user.getUserType())){
			sign = user.getMall().getName();
		}
		// 商铺管理员
		else if("3".equals(user.getUserType())){
			sign = user.getShop().getName();
		}
		return " 【 " + sign + "】";
	}

}
