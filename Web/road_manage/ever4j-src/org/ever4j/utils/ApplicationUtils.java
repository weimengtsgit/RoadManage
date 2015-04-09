package org.ever4j.utils;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class ApplicationUtils {
	
private static ServletContext application = null;
	
	static{
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		application = request.getSession().getServletContext();
	}
	
	public static void setAttribute(String attributekey, Object attributeVal){
		if(application != null){
			application.setAttribute(attributekey, attributeVal);
		}
	}
	
	public static Object getAttribute(String attributekey){
		if(application != null){
			Object ruleURL = application.getAttribute(attributekey);
			return ruleURL;
		}
		return null;
	}
	
	public static void removeAttribute(String attributekey){
		if(application != null){
			application.removeAttribute(attributekey);
		}
	}
}
