<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/system/sysEnum/save?navTabId=system_sysEnum_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${sysEnum.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>枚举标识：</dt>
				<dd><input id="enumName" readonly="readonly" name="enumName" type="text" value="${sysEnum.enumName}" size="30" maxlength="80" /></dd>
			</dl>
		
			<dl>
				<dt>枚举名称：</dt>
				<dd><input id="enumDesc" readonly="readonly" name="enumDesc" type="text" value="${sysEnum.enumDesc}" size="30" maxlength="80" /></dd>
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
