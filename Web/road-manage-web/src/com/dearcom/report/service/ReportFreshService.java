package com.dearcom.report.service;

import javax.annotation.Resource;

import com.dearcom.report.entity.ReportFresh;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ReportFreshService extends BaseService<ReportFresh> {
	@Override
	@Resource(name="reportFreshDao")
	public void setBaseDao(BaseDao<ReportFresh> baseDao){
		this.baseDao = baseDao;
	}
}
