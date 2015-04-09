<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/system/sysDept/save?navTabId=system_sysDept_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${sysDept.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>部门名称：</dt>
				<dd><input id="deptName" readonly="readonly" name="deptName" type="text" value="${sysDept.deptName}" size="30" maxlength="80" /></dd>
			</dl>
		
			<dl>
				<dt>部门编号：</dt>
				<dd><input id="deptNum" readonly="readonly" name="deptNum" type="text" value="${sysDept.deptNum}" size="30" maxlength="80" /></dd>
			</dl>
		<div class="divider"></div>
			<dl>
				<dt>部门地址：</dt>
				<dd><input id="deptAddr" readonly="readonly" name="deptAddr" type="text" value="${sysDept.deptAddr}" size="30" maxlength="80" /></dd>
			</dl>
		
			<dl>
				<dt>上级部门：</dt>
				<dd><a href="${ctx}/system/sysDept/view?id=${sysDept.parentId.id}" target="dialog" rel="system_sysDept_dialog" title="${sysDept.parentId.deptName}">${sysDept.parentId.deptName}</a></dd>
			</dl>
		<div class="divider"></div>
			<dl class="nowrap">
				<dt>部门描述：</dt>
				<dd><textarea readonly="readonly" id="deptDesc" cols="91" rows="5" width="480">${sysDept.deptDesc}</textarea></dd>
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
