package com.dearcom.mall.service;

import javax.annotation.Resource;

import com.dearcom.mall.entity.MallPromotion;
import com.dearcom.mall.entity.ShopPromotion;

import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MallPromotionService extends BaseService<MallPromotion> {
	@Override
	@Resource(name="mallPromotionDao")
	public void setBaseDao(BaseDao<MallPromotion> baseDao){
		this.baseDao = baseDao;
	}
	
	@Override
	public void save(MallPromotion entity) {
		
		getBaseDao().save(entity);
		// 设置优先级
		if(entity.getSort()==null || entity.getSort().intValue()==0){
			entity.setSort(entity.getId());
		}
	}
}
