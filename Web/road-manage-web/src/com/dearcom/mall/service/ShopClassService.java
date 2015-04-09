package com.dearcom.mall.service;

import javax.annotation.Resource;

import com.dearcom.mall.entity.ShopClass;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ShopClassService extends BaseService<ShopClass> {
	@Override
	@Resource(name="shopClassDao")
	public void setBaseDao(BaseDao<ShopClass> baseDao){
		this.baseDao = baseDao;
	}
}
