package com.dearcom.customer.service;

import javax.annotation.Resource;

import com.dearcom.customer.entity.Terminal;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TerminalService extends BaseService<Terminal> {
	@Override
	@Resource(name="terminalDao")
	public void setBaseDao(BaseDao<Terminal> baseDao){
		this.baseDao = baseDao;
	}
}
