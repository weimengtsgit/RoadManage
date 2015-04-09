package org.ever4j.system.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.ever4j.main.constant.Constant;
import org.ever4j.main.tags.EnumValuePojo;
import org.ever4j.system.entity.SysEnum;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SysEnumService extends BaseService<SysEnum> {
	@Override
	@Resource(name="sysEnumDao")
	public void setBaseDao(BaseDao<SysEnum> baseDao){
		this.baseDao = baseDao;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, List<EnumValuePojo>> getEnumMap(HttpServletRequest request){
		ServletContext application = request.getSession().getServletContext();
		Map<String, List<EnumValuePojo>> enumMap = (Map<String, List<EnumValuePojo>>)application.getAttribute(Constant.ENUM);
		
		return enumMap;
	}
	
	/**
	 * 添加枚举对象
	 * @param enumName
	 */
	public void addEnumMap(String enumName, HttpServletRequest request){
		Map<String, List<EnumValuePojo>> enumMap = getEnumMap(request);
		
		enumMap.put(enumName, new ArrayList<EnumValuePojo>());
	}
	
	/**
	 * 修改枚举对象
	 * @param modifyEnumName
	 * @param enumName
	 * @param request
	 */
	public void updateEnumMap(String modifyEnumName, String enumName, HttpServletRequest request){
		Map<String, List<EnumValuePojo>> enumMap = getEnumMap(request);
		List<EnumValuePojo> curEnumList = enumMap.get(modifyEnumName);

		enumMap.remove(modifyEnumName);
		enumMap.put(enumName, curEnumList);
	}
	
	/**
	 * 删除枚举对象By name
	 * @param enumName
	 * @param request
	 */
	public void deleteEnumMap(String enumName, HttpServletRequest request){
		Map<String, List<EnumValuePojo>> enumMap = getEnumMap(request);
		
		enumMap.remove(enumName);
	}
}
