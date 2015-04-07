<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/system/sysLog/save?navTabId=system_sysLog_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${sysLog.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>用户：</dt>
				<dd><a href="${ctx}/system/sysUser/view?id=${sysLog.logUser.id}" target="dialog" rel="system_sysLog_dialog" title="${sysLog.logUser.name}">${sysLog.logUser.name}</a></dd>
			</dl>
		
			<dl>
				<dt>用户所在IP：</dt>
				<dd><input id="logIp" readonly="readonly" name="logIp" type="text" value="${sysLog.logIp}" size="30" maxlength="80" /></dd>
			</dl>
		
			<dl>
				<dt>登录类型：</dt>
				<dd><tag:enum isTag="false" id="logType" defaultValue="" name="logType" enumName="logType" enumKey="${sysLog.logType}" /></dd>
			</dl>
		
			<dl>
				<dt>登录结果：</dt>
				<dd><tag:enum isTag="false" id="logResultType" defaultValue="" name="logResultType" enumName="logResultType" enumKey="${sysLog.logResultType}" /></dd>
			</dl>
		
			<dl>
				<dt>登录时间：</dt>
				
				<dd><input id="logTime" readonly="readonly" name="logTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${sysLog.logTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" />
			</dl>
		
			<div class="divider"></div>
		</div>
		<div class="formBar">
			<ul>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
