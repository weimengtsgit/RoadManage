<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/system/sysEnumValue/save?navTabId=system_sysEnumValue_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${sysEnumValue.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>枚举键：</dt>
				<dd><input id="enumKey" readonly="readonly" name="enumKey" type="text" value="${sysEnumValue.enumKey}" size="30" maxlength="80" /></dd>
			</dl>
		
			<dl>
				<dt>枚举值：</dt>
				<dd><input id="enumVal" readonly="readonly" name="enumVal" type="text" value="${sysEnumValue.enumVal}" size="30" maxlength="80" /></dd>
			</dl>
		
			<dl>
				<dt>枚举序列：</dt>
				<dd><input id="enumSeq" readonly="readonly" name="enumSeq" type="text" value="${sysEnumValue.enumSeq}" size="30" maxlength="80" /></dd>
			</dl>
		
			<dl>
				<dt>枚举对象：</dt>
				<dd><a href="${ctx}/system/sysEnum/view?id=${sysEnumValue.enumId.id}" target="dialog" rel="system_sysEnumValue_dialog" title="${sysEnumValue.enumId.enumDesc}">${sysEnumValue.enumId.enumDesc}</a></dd>
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
