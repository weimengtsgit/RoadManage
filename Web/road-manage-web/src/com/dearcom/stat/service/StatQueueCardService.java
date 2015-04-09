package com.dearcom.stat.service;

import javax.annotation.Resource;

import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dearcom.queue.entity.QueueCard;

@Service
@Transactional
public class StatQueueCardService extends BaseService<QueueCard> {
	@Override
	@Resource(name = "statQueueCardDao")
	public void setBaseDao(BaseDao<QueueCard> baseDao) {
		this.baseDao = baseDao;
	}
}
