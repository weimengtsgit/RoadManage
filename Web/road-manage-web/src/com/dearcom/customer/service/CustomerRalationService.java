package com.dearcom.customer.service;

import javax.annotation.Resource;

import com.dearcom.customer.entity.CustomerRalation;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CustomerRalationService extends BaseService<CustomerRalation> {
	@Override
	@Resource(name="customerRalationDao")
	public void setBaseDao(BaseDao<CustomerRalation> baseDao){
		this.baseDao = baseDao;
	}
}
