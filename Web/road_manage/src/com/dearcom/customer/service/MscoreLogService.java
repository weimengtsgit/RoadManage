package com.dearcom.customer.service;

import javax.annotation.Resource;

import com.dearcom.customer.entity.MscoreLog;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MscoreLogService extends BaseService<MscoreLog> {
	@Override
	@Resource(name="mscoreLogDao")
	public void setBaseDao(BaseDao<MscoreLog> baseDao){
		this.baseDao = baseDao;
	}
}
