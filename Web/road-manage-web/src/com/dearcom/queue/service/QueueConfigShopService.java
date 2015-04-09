package com.dearcom.queue.service;

import javax.annotation.Resource;

import com.dearcom.queue.entity.QueueConfigShop;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class QueueConfigShopService extends BaseService<QueueConfigShop> {
	@Override
	@Resource(name="queueConfigShopDao")
	public void setBaseDao(BaseDao<QueueConfigShop> baseDao){
		this.baseDao = baseDao;
	}
}
