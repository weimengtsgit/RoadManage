package com.dearcom.customer.service;

import javax.annotation.Resource;

import com.dearcom.customer.entity.Customer;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CustomerService extends BaseService<Customer> {
	@Override
	@Resource(name="customerDao")
	public void setBaseDao(BaseDao<Customer> baseDao){
		this.baseDao = baseDao;
	}
}
