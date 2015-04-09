package org.ever4j.system.service;

import javax.annotation.Resource;

import org.ever4j.system.entity.SysLog;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SysLogService extends BaseService<SysLog> {
	@Override
	@Resource(name="sysLogDao")
	public void setBaseDao(BaseDao<SysLog> baseDao){
		this.baseDao = baseDao;
	}
}
