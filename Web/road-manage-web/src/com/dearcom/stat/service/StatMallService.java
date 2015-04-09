package com.dearcom.stat.service;

import javax.annotation.Resource;

import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dearcom.stat.entity.StatMall;

@Service
@Transactional
public class StatMallService extends BaseService<StatMall> {
	@Override
	@Resource(name = "statMallDao")
	public void setBaseDao(BaseDao<StatMall> baseDao) {
		this.baseDao = baseDao;
	}
}
