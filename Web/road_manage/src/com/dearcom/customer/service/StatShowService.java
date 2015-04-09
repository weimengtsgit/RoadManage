package com.dearcom.customer.service;

import javax.annotation.Resource;

import com.dearcom.customer.entity.StatShow;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class StatShowService extends BaseService<StatShow> {
	@Override
	@Resource(name="statShowDao")
	public void setBaseDao(BaseDao<StatShow> baseDao){
		this.baseDao = baseDao;
	}
}
