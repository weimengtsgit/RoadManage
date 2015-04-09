package org.ever4j.utils;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import org.ever4j.main.constant.Constant;
import org.ever4j.main.tags.EnumValuePojo;
import org.ever4j.system.entity.SysUser;

public class SessionUtil {
	public static SysUser getCurrentUser(){
		SysUser curUser= null;
		ServletRequestAttributes sras = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes());
		if(sras!=null){
			HttpSession session = sras.getRequest().getSession();
			curUser = (SysUser) session.getAttribute("curUser");
		}
		
		if(curUser == null){
			curUser = new SysUser();
			curUser.setId(0);
		}
		return curUser;
	}
	public static void setViewResolverPrefix(String prefix){
		ServletRequestAttributes sras = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes());
		if(sras!=null){
			HttpSession session = sras.getRequest().getSession();
		     session.setAttribute("InternalResourceViewResolver_prefix",prefix);
		}
	}
	public static String getViewResolverPrefix(){
		ServletRequestAttributes sras = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes());
		if(sras!=null){
			HttpSession session = sras.getRequest().getSession();
			return (String) session.getAttribute("InternalResourceViewResolver_prefix");
		}else{
			return null;
		}
	}
	// 
	public static String getEnumValue(String enumType,String enumKey){
		ServletRequestAttributes sras = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes());
		String value = "";
		if(sras!=null){
			ServletContext application = sras.getRequest().getSession().getServletContext();
			Map<String, List<EnumValuePojo>> enumMap = (Map<String, List<EnumValuePojo>>) application.getAttribute(Constant.ENUM);
			
			
			List<EnumValuePojo> EnumValuePojos = enumMap.get(enumType);
			if(EnumValuePojos != null && EnumValuePojos.size() > 0){
				for (EnumValuePojo enumValuePojo : EnumValuePojos) {
					if(enumValuePojo != null && enumKey.equals(enumValuePojo.getEnumKey())){
						value = enumValuePojo.getEnumVal();
						break;
					}
				}
			}
		}
		return value;
	}
	public static List<EnumValuePojo> getEnumValues(String enumType){
		ServletRequestAttributes sras = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes());
		List<EnumValuePojo> values=null;
		if(sras!=null){
			ServletContext application = sras.getRequest().getSession().getServletContext();
			Map<String, List<EnumValuePojo>> enumMap = (Map<String, List<EnumValuePojo>>) application.getAttribute(Constant.ENUM);
			
			
			values = enumMap.get(enumType);
			
		}
		return values;
	}
	public static String getCurrentUserIp(){
		String logIp= "127.0.0.1";
		ServletRequestAttributes sras = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes());
		if(sras!=null){
			HttpSession session = sras.getRequest().getSession();
		    logIp = (String) session.getAttribute("logIp");
		}
		if(logIp == null){
			logIp= "127.0.0.1";
		}
		return logIp;
	}
	public static String getViewPath(String string) {
		
		return getViewResolverPrefix()+string;
	}
}
