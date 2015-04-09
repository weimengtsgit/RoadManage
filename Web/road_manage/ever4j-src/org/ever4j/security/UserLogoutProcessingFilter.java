package org.ever4j.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;

public class UserLogoutProcessingFilter extends SecurityContextLogoutHandler{

	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response,
			Authentication aut) {
		
//		System.out.println((String)(request.getSession().getAttribute("userAccount")) + " 退出系统！");
			
		super.logout(request, response, aut);
	}
}
