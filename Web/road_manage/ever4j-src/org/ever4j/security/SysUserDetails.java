package org.ever4j.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class SysUserDetails implements UserDetails {

	private static final long serialVersionUID = 1L;
	
	private Integer userId;
	
	/**
	 * 登录名称
	 */
	private String username;
	
	/**
	 * 登录密码
	 */
	private String password;
	
	/**
	 * 用户姓名
	 */
	private String name;
	
	/**
	 * 权限
	 */
	private Collection<GrantedAuthority> authorities;
	
	/**
	 * 账号未过期
	 */
	private boolean accountNonExpired = true;
	/**
	 * 账号未锁定
	 */
	private boolean accountNonLocked = true;
	/**
	 * 证书未过期
	 */
	private boolean credentialsNonExpired = true;
	/**
	 * 是否启用
	 */
	private boolean enabled = true;
	
	public SysUserDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SysUserDetails(Integer userId, String username, String password, String name, Collection<GrantedAuthority> authorities,
			boolean accountNonExpired, boolean accountNonLocked, boolean credentialsNonExpired, boolean enabled) {
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.name = name;
		this.authorities = authorities;
		this.accountNonExpired = accountNonExpired;
		this.accountNonLocked = accountNonLocked;
		this.credentialsNonExpired = credentialsNonExpired;
		this.enabled = enabled;
	}



	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Collection<GrantedAuthority> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(Collection<GrantedAuthority> authorities) {
		this.authorities = authorities;
	}

	public boolean isAccountNonExpired() {
		return accountNonExpired;
	}

	public void setAccountNonExpired(boolean accountNonExpired) {
		this.accountNonExpired = accountNonExpired;
	}

	public boolean isAccountNonLocked() {
		return accountNonLocked;
	}

	public void setAccountNonLocked(boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}

	public boolean isCredentialsNonExpired() {
		return credentialsNonExpired;
	}

	public void setCredentialsNonExpired(boolean credentialsNonExpired) {
		this.credentialsNonExpired = credentialsNonExpired;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}	
}
