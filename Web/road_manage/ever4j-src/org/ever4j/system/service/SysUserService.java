package org.ever4j.system.service;

import javax.annotation.Resource;

import org.ever4j.system.entity.SysUser;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SysUserService extends BaseService<SysUser> {
	@Override
	@Resource(name="sysUserDao")
	public void setBaseDao(BaseDao<SysUser> baseDao){
		this.baseDao = baseDao;
	}
}
