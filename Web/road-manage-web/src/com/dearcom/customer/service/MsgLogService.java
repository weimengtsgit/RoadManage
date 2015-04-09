package com.dearcom.customer.service;

import javax.annotation.Resource;

import com.dearcom.customer.entity.MsgLog;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MsgLogService extends BaseService<MsgLog> {
	@Override
	@Resource(name="msgLogDao")
	public void setBaseDao(BaseDao<MsgLog> baseDao){
		this.baseDao = baseDao;
	}
}
