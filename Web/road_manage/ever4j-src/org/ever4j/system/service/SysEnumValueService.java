package org.ever4j.system.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import org.ever4j.main.constant.Constant;
import org.ever4j.main.tags.EnumValuePojo;
import org.ever4j.system.entity.SysEnum;
import org.ever4j.system.entity.SysEnumValue;

@Service
@Transactional
public class SysEnumValueService extends BaseService<SysEnumValue> {
	@Override
	@Resource(name="sysEnumValueDao")
	public void setBaseDao(BaseDao<SysEnumValue> baseDao){
		this.baseDao = baseDao;
	}
	
	/**
	 * 查询同级key相同的对象集合
	 * @param enumId
	 * @param enumValueKey
	 * @return
	 */
	public SysEnumValue findSibListByKey(SysEnumValue sysEnumValue){
		String enumValueKey = sysEnumValue.getEnumKey();
		SysEnum curSysEnum = sysEnumValue.getEnumId();

		return this.findHql("FROM SysEnumValue where enumId=? and enumKey=?", curSysEnum, enumValueKey);
	}
	
	/**
	 * 查询同级key相同的对象是否存在，true:存在，false:不存在
	 * @param enumId
	 * @param enumValueKey
	 * @return 
	 */
	public boolean findSibFlagByKey(SysEnumValue curEnumValue){
		if(curEnumValue == null){
			return false;
		}else{
			return true;
		}
	}
	
	/**
	 * 查询同级key相同的对象是否存在，true:存在，false:不存在
	 * @param enumId
	 * @param enumValueKey
	 * @return 
	 */
	public boolean findSibFlagByKey(SysEnumValue curEnumValue, SysEnumValue curSysEnumValue){
		if(curEnumValue == null){
			return false;
		}else{
			if(curEnumValue != null && curSysEnumValue != null && curSysEnumValue.getId().intValue() != curEnumValue.getId().intValue()){
				return true;
			}
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, List<EnumValuePojo>> getEnumMap(HttpServletRequest request){
		ServletContext application = request.getSession().getServletContext();
		Map<String, List<EnumValuePojo>> enumMap = (Map<String, List<EnumValuePojo>>)application.getAttribute(Constant.ENUM);
		
		return enumMap;
	}
	
	/**
	 * 通过当前枚举值对象获得同级所有的枚举值对象
	 * @param sysEnumValue
	 * @param request
	 * @return
	 */
	public List<EnumValuePojo> getEnumValuePojoList(SysEnumValue sysEnumValue, HttpServletRequest request){
		SysEnum sysEnum = sysEnumValue.getEnumId();
		String enumName = sysEnum.getEnumName();
		
		Map<String, List<EnumValuePojo>> enumMap = getEnumMap(request);
		List<EnumValuePojo> enumValueList = enumMap.get(enumName);
		
		return enumValueList;
	}
	
	/**
	 * 向enumMap中指定枚举对象中添加枚举值
	 * @param sysEnumValue
	 * @param request
	 */
	public void addEnumValueToEnumMap(SysEnumValue sysEnumValue, HttpServletRequest request){
		List<EnumValuePojo> enumValueList = getEnumValuePojoList(sysEnumValue, request);
		EnumValuePojo enumValuePojo = new EnumValuePojo(sysEnumValue.getEnumKey(), sysEnumValue.getEnumVal(), sysEnumValue.getEnumSeq());
		enumValueList.add(enumValuePojo);
	}
	
	/**
	 * 修改枚举值时，重新加载数据库
	 * @param request
	 */
	@SuppressWarnings("unchecked")
	public void updateEnumValueToEnumMap(){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		ServletContext application = request.getSession().getServletContext();
		
		Map<String, List<EnumValuePojo>> enumMap = new HashMap<String, List<EnumValuePojo>>();
		String sql = "SELECT enum_name, enum_key, enum_val, enum_seq FROM sys_enum e left join sys_enum_value ev on e.id=ev.enum_id order by enum_name, enum_seq";
		List<Object> enumList = this.findBySql(sql);
		if(enumList != null){
			for (Object enumObj : enumList) {
				if(enumObj != null){
					Object[] enumObjArray = (Object[])enumObj;
					String enumName = (String)enumObjArray[0];
					String enumKey = (String)enumObjArray[1];
					String enumVal = (String)enumObjArray[2];
					Integer enumSeq = enumObjArray[3] == null ? null : (Integer)enumObjArray[3];
					
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
		
		application.removeAttribute(Constant.ENUM);
		application.setAttribute(Constant.ENUM, enumMap);
	}
	
	/**
	 * 删除枚举对象中的某个枚举值
	 * @param sysEnumValue
	 * @param request
	 */
	public void deleteEnumValueFromEnumMap(SysEnumValue sysEnumValue, HttpServletRequest request){
		List<EnumValuePojo> enumValueList = getEnumValuePojoList(sysEnumValue, request);
		if(enumValueList != null && enumValueList.size() > 0){
			EnumValuePojo deleteEnumValuePojo = null;
			for (EnumValuePojo enumValuePojo : enumValueList) {
				if(enumValuePojo != null &&  enumValuePojo.getEnumKey().equals(sysEnumValue.getEnumKey())){
					deleteEnumValuePojo = enumValuePojo;
					break;
				}
			}
			
			if(deleteEnumValuePojo != null){
				enumValueList.remove(deleteEnumValuePojo);
			}
		}
	}
}
