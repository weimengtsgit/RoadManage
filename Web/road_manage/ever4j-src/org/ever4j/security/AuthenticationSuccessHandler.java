package org.ever4j.security;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.ever4j.main.constant.Constant;
import org.ever4j.system.dao.SysLogDao;
import org.ever4j.system.dao.SysUserDao;
import org.ever4j.system.entity.SysLog;
import org.ever4j.system.entity.SysUser;
import org.ever4j.utils.TimeUtil;

@Service
@Transactional
public class AuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

	@Resource(name = "sysUserDao")
	private SysUserDao sysUserDao;
	
	@Resource(name="sysLogDao")
	private SysLogDao sysLogDao;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException,
			ServletException {
		HttpSession session = request.getSession();
		String remoteHost = request.getRemoteHost();
		SysUser sysUser = (SysUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		request.getSession().setAttribute("curUser", sysUser);

		if(sysUser != null){
			System.out.println(sysUser.getName() + "--> 成功登录 -->登录IP: " + remoteHost);
			session.setAttribute("curUserName", sysUser.getName());
			if(sysUser.getUserRole() != null){
				session.setAttribute("curUserRole", sysUser.getUserRole().getRoleName());
			}
			session.setAttribute("logIp", remoteHost);
			session.setAttribute("logTime", TimeUtil.date2Str(new Date(), "yyyy-MM-dd HH:mm:ss"));
			
			String sql = "SELECT log_ip,log_time FROM sys_log where log_user=? order by log_time desc limit 0,1";
			List objList = sysLogDao.findBySql(sql, sysUser.getId());
			if(objList != null && objList.size() > 0){
				Object obj = objList.get(0);
				if(obj != null){
					Object[] curObj = (Object[])obj;
					if(curObj[1] != null){
						String logIp = (String)curObj[0];
						Timestamp logTime = (Timestamp)curObj[1];
						session.setAttribute("lastLogIp", logIp);
						session.setAttribute("lastLogTime", TimeUtil.timestamp2Str(logTime, null));
					}
				}
			}
			
			//1:登录,2:退出
			//1:"登录成功",2:登录失败-密码错误,3:登录失败-用户被锁定4:"退出成功"
			SysLog sysLog = new SysLog(sysUser, remoteHost, "1", "1", new Date());
			sysLogDao.save(sysLog);
			
			Map<String, UserLogStatus> loginMap = (Map<String, UserLogStatus>) session.getServletContext().getAttribute(Constant.LOG_MAP);
			UserLogStatus curUserLogStatus = loginMap.get(sysUser.getUsername()+remoteHost);
			if(curUserLogStatus != null){//成功登录一次，去掉以前登录失败的记录
				curUserLogStatus.setFailTimes(0);
				curUserLogStatus.setLockedStatus(false);
			}
		}
		
		super.onAuthenticationSuccess(request, response, authentication);
	}

	public SysUserDao getSysUserDao() {
		return sysUserDao;
	}

	public void setSysUserDao(SysUserDao sysUserDao) {
		this.sysUserDao = sysUserDao;
	}

	public SysLogDao getSysLogDao() {
		return sysLogDao;
	}

	public void setSysLogDao(SysLogDao sysLogDao) {
		this.sysLogDao = sysLogDao;
	}
}
