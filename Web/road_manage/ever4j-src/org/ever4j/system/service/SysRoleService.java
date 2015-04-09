package org.ever4j.system.service;

import javax.annotation.Resource;

import org.ever4j.system.entity.SysRole;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SysRoleService extends BaseService<SysRole> {
	@Override
	@Resource(name="sysRoleDao")
	public void setBaseDao(BaseDao<SysRole> baseDao){
		this.baseDao = baseDao;
	}
	
	/**
	 * 删除菜单角色中间表中数据
	 * @param roleId
	 */
	public void deleteMenuRole(int roleId){
		this.executeBySql("DELETE FROM SYS_MENU_ROLE WHERE ROLE_ID=?", roleId);
	}
	
	/**
	 * 删除用户表中的角色
	 * @param roleId
	 */
	public void deleteUserRole(int roleId){
		this.executeBySql("UPDATE SYS_USER SET USER_ROLE=NULL WHERE USER_ROLE=?", roleId);
	}
	
	public void deleteRoleMessage(int roleId){
		deleteMenuRole(roleId);
		deleteUserRole(roleId);
	}
}
