<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/system/sysUser/save?navTabId=system_sysUser_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${sysUser.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>账号：</dt>
				<dd><input id="username" readonly="readonly" name="username" type="text" value="${sysUser.username}" size="30" maxlength="80" /></dd>
			</dl>
		
			<dl>
				<dt>密码：</dt>
				<dd><input id="password" readonly="readonly" name="password" type="password" value="${sysUser.password}" size="30" maxlength="80" /></dd>
			</dl>
			<div class="divider"></div>
			
			<dl>
				<dt>昵称：</dt>
				<dd><input id="name" readonly="readonly" name="name" type="text" value="${sysUser.name}" size="30" maxlength="80" /></dd>
			</dl>
		
			<dl style="display: none">
				<dt>用户类型：</dt>
				<dd><tag:enum isTag="false" id="userType" defaultValue="" name="userType" enumName="userType" enumKey="${sysUser.userType}" /></dd>
			</dl>
			<div class="divider"></div>
			
			<dl>
				<dt>所属部门：</dt>
				<dd><a href="${ctx}/system/sysDept/view?id=${sysUser.userDept.id}" target="dialog" mask="true" rel="system_sysUser_dialog" title="${sysUser.userDept.deptName}">${sysUser.userDept.deptName}</a></dd>
			</dl>
		
			<dl>
				<dt>所属角色：</dt>
				<dd><a href="${ctx}/system/sysRole/view?id=${sysUser.userRole.id}" target="dialog" rel="system_sysUser_dialog" title="${sysUser.userRole.roleName}">${sysUser.userRole.roleName}</a></dd>
			</dl>
			<div class="divider"></div>
			
			<dl class="nowrap">
				<dt>用户描述：</dt>
				<dd><textarea readonly="readonly" id="userDesc" cols="91" rows="5" width="480">${sysUser.userDesc}</textarea></dd>
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
