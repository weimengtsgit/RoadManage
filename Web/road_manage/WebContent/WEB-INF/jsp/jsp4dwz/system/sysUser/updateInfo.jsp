<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>

<div class="pageContent">
	<form method="post" action="${ctx}/system/sysUser/saveInfo?ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="58">
	   		<div class="unit">
	   			<label>原密码：</label>
	   			<input class="required" name="oldpassword" type="password" size="30" maxlength="32"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>新密码：</label>
	   			<input id="update_password" class="required alphanumeric" name="password" type="password" size="30" maxlength="32"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>确认密码：</label>
	   			<input class="required" equalto="#update_password" name="password1" type="password" size="30" maxlength="32"/>
			</div>
			<div class="divider">divider</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>