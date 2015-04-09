package com.dearcom.customer.service;

import javax.annotation.Resource;

import com.dearcom.customer.entity.UserLog;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserLogService extends BaseService<UserLog> {
	@Override
	@Resource(name="userLogDao")
	public void setBaseDao(BaseDao<UserLog> baseDao){
		this.baseDao = baseDao;
	}
}
