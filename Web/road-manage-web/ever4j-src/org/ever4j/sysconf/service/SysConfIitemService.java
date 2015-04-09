package org.ever4j.sysconf.service;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.ever4j.main.constant.Constant;
import org.ever4j.sysconf.entity.SysConfIitem;
import org.ever4j.sysconf.entity.SysConfType;

@Service
@Transactional
public class SysConfIitemService extends BaseService<SysConfIitem> {
	
	@Override
	@Resource(name="sysConfIitemDao")
	public void setBaseDao(BaseDao<SysConfIitem> baseDao){
		this.baseDao = baseDao;
	}
	
	/**
	 * 初始化configMap
	 */
	public void initConfigMap(SysConfTypeService sysConfTypeService, ServletContext application){
		//查询所有的类别
		List<SysConfType> typeList = sysConfTypeService.findAll();
		if(typeList != null && typeList.size() > 0){
			for (SysConfType sysConfType : typeList) {
				if(sysConfType != null && sysConfType.getId() != null){
					List<SysConfIitem> list = findList("confType.id", sysConfType.getId());
					Constant.configItemsWithTypeMap.put(sysConfType.getConfKey(), list);
					if(list != null && list.size() > 0){
						for (SysConfIitem sysConfIitem : list) {
							Constant.configMap.put(sysConfIitem.getConfType().getConfKey()+"_"+sysConfIitem.getItemKey(), sysConfIitem.getItemValue());
							application.setAttribute(sysConfIitem.getConfType().getConfKey()+"_"+sysConfIitem.getItemKey(), sysConfIitem.getItemValue());
						}
					}
				}
			}
//			System.out.println("====================typeConfigMap = " + Constant.configItemsWithTypeMap);
//			System.out.println("====================itemConfig.Map = "+Constant.configMap);
		}
	}
}
