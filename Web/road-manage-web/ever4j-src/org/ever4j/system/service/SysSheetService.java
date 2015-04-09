package org.ever4j.system.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.ever4j.system.entity.SysSheet;
import org.ever4j.utils.TimeUtil;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SysSheetService extends BaseService<SysSheet> {
	@Override
	@Resource(name="sysSheetDao")
	public void setBaseDao(BaseDao<SysSheet> baseDao){
		this.baseDao = baseDao;
	}
	
	public Map<String, String> initSheetStartDate(){
		Map<String, String> sheetMap = new HashMap<String, String>();
		List<SysSheet> sysSheets = this.findAll();
		if(sysSheets != null && sysSheets.size() > 0){
			for (SysSheet sysSheet : sysSheets) {
				if(sysSheet != null){
					String curSheetTableName = sysSheet.getTableName();
					String curSheetStartDate = findSheetStartDate(sysSheet);
					
					sheetMap.put(curSheetTableName, curSheetStartDate);
				}
			}
		}
		
		return sheetMap;
	}
	
	public String findSheetStartDate(SysSheet sysSheet){
		String sheetSatrtDate = "1970-01-01";
		if(sysSheet != null){
			Date starTime = sysSheet.getStartTime();
			sheetSatrtDate = TimeUtil.date2Str(starTime, "yyyy-MM-dd");
		}
		
		return sheetSatrtDate;
	}
}
