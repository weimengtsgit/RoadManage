package com.dearcom.mall.service;

import javax.annotation.Resource;

import com.dearcom.mall.entity.Shop;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ShopService extends BaseService<Shop> {
	@Override
	@Resource(name="shopDao")
	public void setBaseDao(BaseDao<Shop> baseDao){
		this.baseDao = baseDao;
	}
	
	@Override
	public void save(Shop entity) {
		
		getBaseDao().save(entity);
		// 设置优先级
		if(entity.getPriority()==null || entity.getPriority().intValue()==0){
			entity.setPriority(entity.getId());
		}
	}
}
