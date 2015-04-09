package org.ever4j.utils.aop;

import java.lang.reflect.Method;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.aop.AfterReturningAdvice;
import org.springframework.aop.MethodBeforeAdvice;
import org.springframework.aop.ThrowsAdvice;
import org.springframework.context.support.ApplicationObjectSupport;

import com.alibaba.fastjson.JSONObject;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.system.service.SysOperLogService;
import org.ever4j.system.service.SysOperLogService.LogResultType;

public class LoggerAdvice extends ApplicationObjectSupport implements MethodBeforeAdvice, AfterReturningAdvice,
		ThrowsAdvice {
	private SysOperLogService logService;
	
	@Override
	public void before(Method method, Object[] args, Object target)
			throws Throwable {
	}
	
	@Override
	public void afterReturning(Object retuVal, Method method, Object[] args,
			Object target) throws Throwable {
		if(logService==null){
			logService = getApplicationContext().getBean(SysOperLogService.class);
		}
		String className = target.getClass().getName();
		String methodName = method.getName();
		String entityClassName = className.replace(".service.", ".entity.").replace("Service", "");
		String entityName = entityClassName.substring(entityClassName.lastIndexOf(".")+1);
		logService.log(generateModuleName(entityClassName),generateOperName(methodName), LogResultType.成功, methodName.startsWith("find")?"查询"+entityName:generateContent(args, entityClassName));
	}

	private String generateContent(Object[] args, String entityName) {
		String content="";
		try {
			
			content = JSONObject.toJSONString(args, true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(content.length()>10000){
			content = content.substring(0, 9999);
		}
		return content;
//		return "";
	}

	private String generateModuleName(String entityClassName) {
		String module = entityClassName;
		if(entityClassName != null && entityClassName.equals("org.ever4j.main.entity.Main")){
			return "首页展示";
		}
		if(StringUtils.isNotBlank(entityClassName)){
			try {
				Class entity = Class.forName(entityClassName);
				ClassConfig cc = (ClassConfig) entity.getAnnotation(ClassConfig.class);
				if(cc!=null){
					module = cc.title();
				}
			} catch (Exception e) {
				
			}
		}
		return module;
	}

	private String generateOperName(String methodName) {
		String operName = methodName;
		if(StringUtils.isNotBlank(methodName)){
			if(methodName.startsWith("save")){
				operName = "新增";
			}
			else if(methodName.startsWith("update")){
				operName = "修改";
			}
			else if(methodName.startsWith("find")){
				operName = "查询";
			}
			else if(methodName.startsWith("delete")){
				operName = "删除";
			}
			else if(methodName.startsWith("batch")){
				operName = "批量执行";
			}
			else if(methodName.startsWith("execute")){
				operName = "执行";
			}
		}
		return operName;
	}

	public void afterThrowing(Method method, Object[] args, Object target,
			Exception ex) {
		if(logService==null){
			logService = getApplicationContext().getBean(SysOperLogService.class);
		}
		Logger logger = Logger.getLogger(target.getClass());
		logger.error("数据处理时发生异常", ex);
		logService.log("","保存", LogResultType.失败, "");
	}

	public SysOperLogService getLogService() {
		return logService;
	}

	public void setLogService(SysOperLogService logService) {
		this.logService = logService;
	}
}
