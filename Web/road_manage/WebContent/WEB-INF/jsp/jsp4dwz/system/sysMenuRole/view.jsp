<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/system/sysMenuRole/save?navTabId=system_sysMenuRole_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${sysMenuRole.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>角色ID：</dt>
				<dd><input id="roleId" readonly="readonly" name="roleId" type="text" value="${sysMenuRole.roleId}" size="30" maxlength="80" /></dd>
			</dl>
		
			<dl>
				<dt>菜单ID：</dt>
				<dd><input id="menuId" readonly="readonly" name="menuId" type="text" value="${sysMenuRole.menuId}" size="30" maxlength="80" /></dd>
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
