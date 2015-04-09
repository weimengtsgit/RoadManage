package com.dearcom.mall.service;

import javax.annotation.Resource;

import com.dearcom.mall.entity.Shop;
import com.dearcom.mall.entity.ShopPromotion;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ShopPromotionService extends BaseService<ShopPromotion> {
	@Override
	@Resource(name="shopPromotionDao")
	public void setBaseDao(BaseDao<ShopPromotion> baseDao){
		this.baseDao = baseDao;
	}
	
	@Override
	public void save(ShopPromotion entity) {
		
		getBaseDao().save(entity);
		// 设置优先级
		if(entity.getSort()==null || entity.getSort().intValue()==0){
			entity.setSort(entity.getId());
		}
	}
}
