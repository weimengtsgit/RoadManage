<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/system/sysSheet/save?navTabId=system_sysSheet_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${sysSheet.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>基础表名：</dt>
				<dd><input class="required" id="tableName" name="tableName" type="text" value="${sysSheet.tableName}" size="30"  maxlength=30 /></dd>
			</dl>
		
			<dl>
				<dt>分表周期：</dt>
				<dd><tag:enum id="cycle" inputType="select" defaultValue="" cssClass="required" name="cycle" enumName="sheetCycle" enumKey="${sysSheet.cycle}" /></dd>
			</dl>
		
			<dl>
				<dt>起始时间：</dt>
				
				<dd><input id="startTime" name="startTime" type="text" class="date required" dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${sysSheet.startTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" />
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
