package org.ever4j.sysconf.service;

import javax.annotation.Resource;

import org.ever4j.sysconf.entity.SysConfType;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SysConfTypeService extends BaseService<SysConfType> {
	@Override
	@Resource(name="sysConfTypeDao")
	public void setBaseDao(BaseDao<SysConfType> baseDao){
		this.baseDao = baseDao;
	}
}
