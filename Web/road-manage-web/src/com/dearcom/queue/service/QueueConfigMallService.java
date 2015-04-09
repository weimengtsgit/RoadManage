package com.dearcom.queue.service;

import javax.annotation.Resource;

import com.dearcom.queue.entity.QueueConfigMall;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class QueueConfigMallService extends BaseService<QueueConfigMall> {
	@Override
	@Resource(name="queueConfigMallDao")
	public void setBaseDao(BaseDao<QueueConfigMall> baseDao){
		this.baseDao = baseDao;
	}
}
