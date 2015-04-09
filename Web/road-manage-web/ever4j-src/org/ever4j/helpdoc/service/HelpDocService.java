package org.ever4j.helpdoc.service;

import javax.annotation.Resource;

import org.ever4j.helpdoc.entity.HelpDoc;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class HelpDocService extends BaseService<HelpDoc> {
	@Override
	@Resource(name="helpDocDao")
	public void setBaseDao(BaseDao<HelpDoc> baseDao){
		this.baseDao = baseDao;
	}
}
