<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/system/sysTables/save?navTabId=system_sysTables_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${sysTables.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>名称：</dt>
				<dd><input class="" id="tableName" name="tableName" type="text" value="${sysTables.tableName}" size="30"  maxlength=30 /></dd>
			</dl>
		
			<dl>
				<dt>描述：</dt>
				<dd><input class="" id="tableDesc" name="tableDesc" type="text" value="${sysTables.tableDesc}" size="30"  maxlength=30 /></dd>
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
