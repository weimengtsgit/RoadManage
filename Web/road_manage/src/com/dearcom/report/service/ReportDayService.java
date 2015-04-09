package com.dearcom.report.service;

import javax.annotation.Resource;

import com.dearcom.report.entity.ReportDay;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ReportDayService extends BaseService<ReportDay> {
	@Override
	@Resource(name="reportDayDao")
	public void setBaseDao(BaseDao<ReportDay> baseDao){
		this.baseDao = baseDao;
	}
}
