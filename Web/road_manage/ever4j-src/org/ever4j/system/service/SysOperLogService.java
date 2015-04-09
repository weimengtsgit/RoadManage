package org.ever4j.system.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import org.ever4j.system.entity.SysOperLog;
import org.ever4j.system.entity.SysUser;
import org.ever4j.utils.SessionUtil;

@Service
@Transactional
public class SysOperLogService extends BaseService<SysOperLog> {
	private List<SysOperLog> logCache = new ArrayList<SysOperLog>(); // 日志缓存
	@Override
	@Resource(name="sysOperLogDao")
	public void setBaseDao(BaseDao<SysOperLog> baseDao){
		this.baseDao = baseDao;
	}
	
	public void log(String logModule,String logType, LogResultType logResultType, String operContent){
		
		SysUser curUser = SessionUtil.getCurrentUser();
		if(curUser != null && curUser.getId() > 0){
			String logIp =SessionUtil.getCurrentUserIp();
			SysOperLog operLog = new SysOperLog(curUser,logType,logModule,logResultType.toString(),logIp,operContent);
			appendLog(operLog);
		}
	}
	
	private void appendLog(SysOperLog operLog) {
		logCache.add(operLog);
		if(logCache.size()>=10000){
			flushLog(false);
		}
	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public void flushLog(boolean force) {
		if(force || logCache.size()>=10000){
			this.batchSave(logCache);
			logCache.clear();
		}
	}

	public enum LogType{
		保存,
		修改,
		删除,
		查询,
		其他;
	}
	
	public enum LogResultType{
		成功,
		失败;
	}
	
	public void batchSave(List<SysOperLog> logCache){
		if(logCache != null && logCache.size() > 0){
			for (SysOperLog sysOperLog : logCache) {
				try{
					save(sysOperLog);
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
