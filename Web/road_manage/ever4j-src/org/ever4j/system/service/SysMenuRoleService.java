package org.ever4j.system.service;

import javax.annotation.Resource;

import org.ever4j.system.entity.SysMenuRole;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SysMenuRoleService extends BaseService<SysMenuRole> {
	@Override
	@Resource(name="sysMenuRoleDao")
	public void setBaseDao(BaseDao<SysMenuRole> baseDao){
		this.baseDao = baseDao;
	}
}
