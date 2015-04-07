<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/system/sysLog/save?navTabId=system_sysLog_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${sysLog.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>用户：</dt>
				<input id="system_logUser_username_input" type="hidden" class="required" name="logUser.id" value="${sysLog.logUser.id}"/>
				<input type="text" class="required" size="24" name="logUser.name" value="${sysLog.logUser.name}" suggestFields="name" suggestUrl="${ctx}/system/sysUser/lookupJson" lookupGroup="logUser"  onchange="if(!this.value) document.getElementById('system_logUser_username_input').value=''" />
				<a class="btnLook" href="${ctx}/system/sysUser/lookupList" lookupGroup="logUser">查找带回</a>		
			</dl>
			
		
			<dl>
				<dt>用户所在IP：</dt>
				<dd><input class="required" id="logIp" name="logIp" type="text" value="${sysLog.logIp}" size="30"  maxlength=32 /></dd>
			</dl>
		
			<dl>
				<dt>登录类型：</dt>
				<dd><tag:enum id="logType" defaultValue="" cssClass="" name="logType" enumName="logType" enumKey="${sysLog.logType}" /></dd>
			</dl>
		
			<dl>
				<dt>登录结果：</dt>
				<dd><tag:enum id="logResultType" defaultValue="" cssClass="" name="logResultType" enumName="logResultType" enumKey="${sysLog.logResultType}" /></dd>
			</dl>
		
			<dl>
				<dt>登录时间：</dt>
				
				<dd><input id="logTime" name="logTime" type="text" class="date required" dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${sysLog.logTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" />
				<a class="inputDateButton" href="javascript:;">选择</a></dd>
			</dl>
		
			<div class="divider"></div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
