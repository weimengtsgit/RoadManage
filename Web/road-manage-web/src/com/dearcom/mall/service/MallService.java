package com.dearcom.mall.service;

import java.util.Date;

import javax.annotation.Resource;

import com.dearcom.mall.entity.Mall;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MallService extends BaseService<Mall> {
	@Override
	@Resource(name="mallDao")
	public void setBaseDao(BaseDao<Mall> baseDao){
		this.baseDao = baseDao;
	}
	
	/**
	 * 新增对象.
	 */
	public void save(Mall mall)
	{
		mall.setCreateTime(new Date());
		getBaseDao().save(mall);
		
	}

	/**
	 * 修改对象.
	 */
	public void update(Mall mall)
	{
		getBaseDao().update(mall);
	}
}
