package org.ever4j.security;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.dao.DataAccessException;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import org.ever4j.main.constant.Constant;
import org.ever4j.system.dao.SysUserDao;
import org.ever4j.system.entity.SysUser;
import org.ever4j.utils.ApplicationUtils;

/**
 * 该类的主要作用是为Spring Security提供一个经过用户认证后的UserDetails。
 * 该UserDetails包括用户名、密码、是否可用、是否过期等信息。 sparta 11/3/29
 */
@Service
@Transactional
public class CustomUserDetailsService implements UserDetailsService {

	public static final String USER_NOT_EXIST_MSG = "用户名不存在";
	
	@Resource(name = "sysUserDao")
	private SysUserDao sysUserDao;

	@Override
	@SuppressWarnings("unchecked")
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
		
		//转码
		try {
			username = new String(username.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		// 根据用户名取得一个SysUsers对象，以获取该用户的其他信息。
		SysUser userd = findByUserAccount(username);
		if(userd == null){
			throw new UsernameNotFoundException(USER_NOT_EXIST_MSG);
		}
		SysUser user = (SysUser) userd.cloneMe();
		if(user==null){
			throw new UsernameNotFoundException(USER_NOT_EXIST_MSG);
		}
		
		// 得到用户的权限
		Collection<GrantedAuthority> auths = loadUserAuthoritiesByName(username, user.getUserType());

		//获得是否被锁定
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		Map<String, UserLogStatus> loginMap = (Map<String, UserLogStatus>) request.getSession().getServletContext().getAttribute(Constant.LOG_MAP);
		String remoteHost = request.getRemoteHost();
		UserLogStatus curUserLogStatus = loginMap.get(username+remoteHost);
		if(curUserLogStatus != null){
			if(curUserLogStatus.isLockedStatus()){//锁定
				long nowTime = System.currentTimeMillis();
				if((nowTime - curUserLogStatus.getLockedTmie()) < Constant.LOG_FAILURE_TIME*1000*60){//时间范围内
					user.setAccountNonLocked(false);
				}else{//超过锁定时间,-->重新设置用户状态,防止超过锁定时间后再次登录错误影响首页显示
					curUserLogStatus.setFailTimes(0);
					curUserLogStatus.setLockedStatus(false);
				}
			}
		}
		
		String password = user.getPassword();
		
		if(ApplicationUtils.getAttribute("sysbaseConfig_verifycodeShow")==null?false:ApplicationUtils.getAttribute("sysbaseConfig_verifycodeShow").equals("1")){
//			String verifyCode = ((String) request.getSession().getAttribute("verifyCode")).toLowerCase();
//			password = new Md5PasswordEncoder().encodePassword(password,verifyCode);
//			password = new Md5PasswordEncoder().encodePassword(password,username);
		}else{
//			password = new Md5PasswordEncoder().encodePassword(password,username);
			
		}
		user.setPassword(password);
		user.setAuthorities(auths);
		return user;
	}

	/**
	 * 根据登录名查看该用户的权限
	 * @param name
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Collection<GrantedAuthority> loadUserAuthoritiesByName(String name, String userType){
		Collection<GrantedAuthority> auths = new ArrayList<GrantedAuthority>();
		String sql = "";
		List<Object> objs = null;
		if("1".equals(userType)){//超级管理员
			sql = "SELECT authority_name FROM sys_menu where menu_type != 1";
			objs = getSysUserDao().findBySql(sql);
		}else{
			sql = "SELECT m.authority_name FROM sys_user u, sys_role r,sys_menu_role mr, sys_menu m where u.user_name=? and u.user_role=r.id and r.id=mr.role_id and mr.menu_id=m.id and m.menu_type !=1";
			objs = getSysUserDao().findBySql(sql, name);
		}
		
		if(objs != null && objs.size() > 0){
					
			for (Object obj : objs) {
				if(obj != null){
					String authorityName = (String)obj;
					GrantedAuthority ga = new GrantedAuthorityImpl(authorityName);
					auths.add(ga);
				}
			}
		}
		return auths;
	}
	
	/**
	 * 根据登录名查看SysUser对象
	 * @param name
	 * @return
	 */
	public SysUser findByUserAccount(String name){
//		SysUser sysUser = this.sysUserDao.find("username", name);
		SysUser sysUser = sysUserDao.findHql("from SysUser where username=? ", name);
		sysUser.setEnabled(!sysUser.getIsDel());
		return sysUser;
	}
	
	public SysUserDao getSysUserDao() {
		return sysUserDao;
	}

	public void setSysUserDao(SysUserDao sysUserDao) {
		this.sysUserDao = sysUserDao;
	}
}
