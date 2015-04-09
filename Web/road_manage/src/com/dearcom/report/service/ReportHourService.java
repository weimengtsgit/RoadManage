package com.dearcom.report.service;

import javax.annotation.Resource;

import com.dearcom.report.entity.ReportHour;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ReportHourService extends BaseService<ReportHour> {
	@Override
	@Resource(name="reportHourDao")
	public void setBaseDao(BaseDao<ReportHour> baseDao){
		this.baseDao = baseDao;
	}
}
