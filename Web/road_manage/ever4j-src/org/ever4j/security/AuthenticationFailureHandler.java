package org.ever4j.security;

import java.io.IOException;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
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
public class AuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {

	private String msg = "";
	@Resource(name = "sysUserDao")
	private SysUserDao sysUserDao;
	
	@Resource(name="sysLogDao")
	private SysLogDao sysLogDao;
	
	@SuppressWarnings("unchecked")
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception)
			throws IOException, ServletException {
		HttpSession curSession = request.getSession();
		String remoteHost = request.getRemoteHost();
		String username = request.getParameter(UsernamePasswordAuthenticationFilter.SPRING_SECURITY_FORM_USERNAME_KEY);
//		SysUser curUser = sysUserDao.find("username", username);
		SysUser curUser = sysUserDao.findHql("from SysUser where username=? and isDel != ?", username, true);
		if(curUser != null){
			System.out.println(curUser.getName() + "--> 登录失败 -->登录IP: " + remoteHost);
			Map<String, UserLogStatus> loginMap = (Map<String, UserLogStatus>) request.getSession().getServletContext().getAttribute(Constant.LOG_MAP);
			//1:登录,2:退出
			//1:"登录成功",2:登录失败-密码错误,3:登录失败-用户被锁定,4:"退出成功"
			SysLog sysLog = new SysLog(curUser, remoteHost, "1", "2", new Date());

			UserLogStatus curUserLogStatus = loginMap.get(username+remoteHost);
			if(curUserLogStatus == null){
				UserLogStatus userLogStatus = new UserLogStatus(1,false,System.currentTimeMillis());
				loginMap.put(username+remoteHost, userLogStatus);
				sysLog.setLogResultType("2");
				msg = "登录失败!您还有"+(Constant.FAIL_NUM - 1)+"次尝试机会，账户将被锁定! ";
			}else{
				long nowTime = System.currentTimeMillis();
				boolean curStatus = curUserLogStatus.isLockedStatus();
				if(!curStatus){//未锁定,添加失败次数
					int curFailTimes = curUserLogStatus.getFailTimes();
					if(curFailTimes < (Constant.FAIL_NUM - 1)){
						sysLog.setLogResultType("2");
						msg = "登录失败!您还有"+(Constant.FAIL_NUM - 1 - curFailTimes)+"次尝试机会，账户将被锁定! ";
						curUserLogStatus.setFailTimes(curFailTimes+1);
					}else{
						sysLog.setLogResultType("3");
						msg = "登录失败!您的账号已经被锁定!请"+Constant.LOG_FAILURE_TIME+"分钟后登录! ";
						curUserLogStatus.setLockedStatus(true);
						curUserLogStatus.setLockedTmie(nowTime);
					}
				}else{
					sysLog.setLogResultType("3");
					msg = "登录失败!您的账号已经被锁定!请"+ TimeUtil.getTimesConvert(nowTime-curUserLogStatus.getLockedTmie(), Constant.LOG_FAILURE_TIME*1000*60)+"后登录! ";
				}
			}
			sysLogDao.save(sysLog);
		}else{
			System.out.println("账号名：" + username + " 的用户不存在, 登录失败 -->登录IP: " + remoteHost);
			msg = "登录失败!用户名或密码错误!";
		}
		curSession.setAttribute("msg", msg);
		super.onAuthenticationFailure(request, response, exception);
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
