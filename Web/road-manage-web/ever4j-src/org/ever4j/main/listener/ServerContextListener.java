package org.ever4j.main.listener;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.ever4j.main.constant.Constant;
import org.ever4j.main.tags.EnumValuePojo;
import org.ever4j.security.UserLogStatus;
import org.ever4j.sysconf.service.SysConfIitemService;
import org.ever4j.sysconf.service.SysConfTypeService;
import org.ever4j.system.entity.SysTables;
import org.ever4j.system.service.SysSheetService;
import org.ever4j.system.service.SysTablesService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ServerContextListener implements ServletContextListener{

	@Override
	@SuppressWarnings("unchecked")
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext application =  sce.getServletContext();
		Map<String, UserLogStatus> loginMap = new HashMap<String, UserLogStatus>(); 
		Map<String, List<EnumValuePojo>> enumMap = new HashMap<String, List<EnumValuePojo>>();
		
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:/applicationContext.xml");
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		Session session = sessionFactory.openSession();
		
		System.out.println("初始化ConfigMap_STATR...");
		SysConfIitemService sysConfIitemService = context.getBean(SysConfIitemService.class);
		SysConfTypeService sysConfTypeService = context.getBean(SysConfTypeService.class);
		sysConfIitemService.initConfigMap(sysConfTypeService,application);
		System.out.println("初始化ConfigMap_END...");
		
		System.out.println("查询分表信息...");
		SysSheetService sysSheetService = (SysSheetService) context.getBean("sysSheetService");
		Map<String, String> sheetMap = sysSheetService.initSheetStartDate();
		
		System.out.println("查询数据库所有表...");
		SysTablesService sysTablesService = (SysTablesService) context.getBean("sysTablesService");
		List<SysTables> tables = sysTablesService.findAllTables(sessionFactory);
		sysTablesService.initSysTables(tables);
		
		System.out.println("初始化MENU_STATR...");
		String sql = "SELECT enum_name, enum_key, enum_val, enum_seq FROM sys_enum e, sys_enum_value ev where e.id=ev.enum_id order by enum_seq";
		List<Object> enumList = session.createSQLQuery(sql).list();
		
		if(session != null){
			session.close();
		}
		if(enumList != null){
			for (Object enumObj : enumList) {
				if(enumObj != null){
					Object[] enumObjArray = (Object[])enumObj;
					String enumName = (String)enumObjArray[0];
					String enumKey = (String)enumObjArray[1];
					String enumVal = (String)enumObjArray[2];
					Integer enumSeq = (Integer)enumObjArray[3];
					
					EnumValuePojo curEnumValueObj = new EnumValuePojo(enumKey, enumVal, enumSeq);
					
					List<EnumValuePojo> enumValueList = enumMap.get(enumName);
					if(enumValueList == null){
						enumValueList = new ArrayList<EnumValuePojo>();
					}
					enumValueList.add(curEnumValueObj);
					
					enumMap.put(enumName, enumValueList);
				}
			}
		}
		
		application.setAttribute(Constant.ENUM, enumMap);
		application.setAttribute(Constant.LOG_MAP, loginMap);
		System.out.println("初始化MENU_END...");
		
		application.setAttribute("sheetMap", sheetMap);//初始化分表的开始时间-->页面进行时间范围控制
		application.setAttribute(Constant.BATCH_NUM, Integer.valueOf(Constant.configMap.get("sysbaseConfig_batchNum")));
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}
}
