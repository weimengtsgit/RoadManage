package org.ever4j.system.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.ever4j.system.entity.SysDept;

@Service
@Transactional
public class SysDeptService extends BaseService<SysDept> {
	@Override
	@Resource(name="sysDeptDao")
	public void setBaseDao(BaseDao<SysDept> baseDao){
		this.baseDao = baseDao;
	}
	
	public void deleteDeptMessage(int deptId){
		List<Integer> resultList = findChildrenById(deptId);
		StringBuilder sb = new StringBuilder();
		if(resultList != null){
			for (Integer integer : resultList) {
				if(StringUtils.isEmpty(sb.toString())){
					sb.append(integer);
				}else{
					sb.append(","+integer);
				}
			}
		}
		if(StringUtils.isNotEmpty(sb.toString())){
			this.executeBySql("UPDATE SYS_USER SET USER_DEPT=NULL WHERE USER_DEPT IN ("+sb.toString()+")");
		}
	}
	
	public List<Integer> findChildrenById(Integer deptId){
		List<SysDept> depts = this.findAll();
		List<Integer> targetList = new ArrayList<Integer>();
		targetList.add(deptId);
		List<Integer> resultList = traverseMenu(depts, deptId, targetList);
		
		return resultList;
	}
	
	public List<Integer> traverseMenu(List<SysDept> depts, Integer deptId, List<Integer> targetList){
		
		if(depts != null && depts.size() > 0){
			for (SysDept curSysDept : depts) {
				if(curSysDept != null && curSysDept.getParentId() != null && curSysDept.getParentId().getId().intValue() == deptId.intValue()){
					targetList.add(curSysDept.getId());
					traverseMenu(depts, curSysDept.getId(), targetList);
				}
			}
		}
		return targetList;
	}
}
