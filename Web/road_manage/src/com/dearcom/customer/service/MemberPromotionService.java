package com.dearcom.customer.service;

import javax.annotation.Resource;

import com.dearcom.customer.entity.MemberPromotion;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberPromotionService extends BaseService<MemberPromotion> {
	@Override
	@Resource(name="memberPromotionDao")
	public void setBaseDao(BaseDao<MemberPromotion> baseDao){
		this.baseDao = baseDao;
	}
}
