package org.ever4j.task.action;

import javax.annotation.Resource;

import org.ever4j.system.service.SysOperLogService;

public class QuartzTest {
	
	@Resource
	private SysOperLogService logService;
	public void testQuartz(){
		
		logService.flushLog(true);
	}
	public SysOperLogService getLogService() {
		return logService;
	}
	public void setLogService(SysOperLogService logService) {
		this.logService = logService;
	}
}
