package org.ever4j.security;

import java.io.IOException;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import org.ever4j.system.entity.SysLog;
import org.ever4j.system.entity.SysUser;
import org.ever4j.system.service.SysLogService;
import org.ever4j.system.service.SysUserService;

public class SysLogoutSuccessHandler implements LogoutSuccessHandler{

	@Resource
	private SysLogService sysLogService;
	
	@Resource
	private SysUserService userService;
	
	
	@Override
	public void onLogoutSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication auth) throws IOException, ServletException {
		
		request.getSession().invalidate();
		String remoteHost = request.getRemoteHost();
		String root = request.getContextPath();
		if (auth == null) {
			response.sendRedirect(root + "/login.jsp");
		} else {
//			SysUser sysUser  = userService.find("username",auth.getName());
			SysUser sysUser = userService.findHql("from SysUser where username=?", auth.getName());
			//1:登录,2:退出
			//1:"登录成功",2:登录失败-密码错误,3:登录失败-用户被锁定4:"退出成功"
			SysLog sysLog = new SysLog(sysUser, remoteHost, "2", "4", new Date());
			sysLogService.save(sysLog);
			response.sendRedirect(root + "/login.jsp");
		}
		
	}
	
}
