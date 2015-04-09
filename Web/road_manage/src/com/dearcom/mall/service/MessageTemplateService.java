package com.dearcom.mall.service;

import javax.annotation.Resource;

import com.dearcom.mall.entity.MessageTemplate;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MessageTemplateService extends BaseService<MessageTemplate> {
	@Override
	@Resource(name="messageTemplateDao")
	public void setBaseDao(BaseDao<MessageTemplate> baseDao){
		this.baseDao = baseDao;
	}
}
