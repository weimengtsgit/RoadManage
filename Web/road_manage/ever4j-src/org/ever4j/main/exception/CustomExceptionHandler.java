package org.ever4j.main.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.ever4j.utils.SessionUtil;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class CustomExceptionHandler implements HandlerExceptionResolver {

	private Logger log = Logger.getLogger(org.ever4j.main.exception.CustomExceptionHandler.class);
	
	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
		
		ex.printStackTrace();
		log.error(ex);
		
		String message = ex.getMessage();
		
		ModelAndView mav = new ModelAndView(SessionUtil.getViewPath("/commons/ajaxDone")); 
		mav.addObject("navTabId", request.getParameter("navTabId"));
		mav.addObject("callbackType", request.getParameter("callbackType"));
		mav.addObject("ajax", request.getParameter("ajax"));
		mav.addObject("code", "300");
		mav.addObject("type", "warning");
		if(message != null && message.contains("org.hibernate.exception.ConstraintViolationException")){
			mav.addObject("message", "该数据关联了其他数据,不能进行删除!");
		}else if(message != null && message.equals("could not execute query")){
			mav.addObject("message", "暂无数据!");
		}else {
			mav.addObject("message", "处理异常!");
		}
		return mav;  
	}

}
