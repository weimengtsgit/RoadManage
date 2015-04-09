package com.dearcom.customer.service;

import javax.annotation.Resource;

import com.dearcom.customer.entity.Mcard;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class McardService extends BaseService<Mcard> {
	@Override
	@Resource(name="mcardDao")
	public void setBaseDao(BaseDao<Mcard> baseDao){
		this.baseDao = baseDao;
	}
}
