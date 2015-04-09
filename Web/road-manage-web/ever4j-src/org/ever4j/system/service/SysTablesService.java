package org.ever4j.system.service;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.main.constant.Constant;
import org.ever4j.system.entity.SysTables;
import org.hibernate.SessionFactory;
import org.hibernate.metadata.ClassMetadata;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SysTablesService extends BaseService<SysTables> {
	@Override
	@Resource(name="sysTablesDao")
	public void setBaseDao(BaseDao<SysTables> baseDao){
		this.baseDao = baseDao;
	}
	
	/**
	 * 查询数据库中所有表
	 * @param sessionFactory
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SysTables> findAllTables(SessionFactory sessionFactory){
		List<SysTables> tables = new ArrayList<SysTables>();
		Map<String, String> tableMap = new HashMap<String, String>();

		Map<String, ClassMetadata> mdMap = sessionFactory.getAllClassMetadata();
		if(mdMap != null && mdMap.size() > 0){
			Set<String> set = mdMap.keySet();
			if(set != null){
				Iterator<String> setI = set.iterator();
				while(setI.hasNext()){
					String key = setI.next();
					try {
						Class<?> curClazz = Class.forName(key);
						ClassConfig classConfig = curClazz.getAnnotation(ClassConfig.class);
						Table tableConfig = curClazz.getAnnotation(Table.class);
						
						tableMap.put(tableConfig.name().toLowerCase(), classConfig.title());
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		try {
			ResultSet rs = sessionFactory.openSession().connection().getMetaData().getTables(Constant.configMap.get("sysbaseConfig_database"), null, null, null);
			while (rs.next()) {
	           String tableName = rs.getString(3).toLowerCase();
	           if(tableMap.get(tableName) == null){
	        	   tableMap.put(tableName, "");
	           }
	        }  
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Set<String> set = tableMap.keySet();
		if(set != null){
			Iterator<String> setI = set.iterator();
			while(setI.hasNext()){
				String tableName = setI.next();
				String tableDesc = tableMap.get(tableName);
				
				SysTables sysTable = new SysTables(tableName, tableDesc);
				tables.add(sysTable);
			}
		}
		return tables;
	}
	
	public void initSysTables(List<SysTables> tables){
		this.executeBySql("delete FROM sys_tables");
		
		if(tables != null && tables.size() > 0){
			for (SysTables sysTable : tables) {
				this.save(sysTable);
			}
		}
	}
}
