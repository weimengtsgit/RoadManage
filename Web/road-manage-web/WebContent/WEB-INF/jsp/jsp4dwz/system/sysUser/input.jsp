<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/system/sysUser/save?navTabId=system_sysUser_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${sysUser.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>账号：</dt>
				<dd><input class="required regcheck" id="username" name="username" type="text" value="${sysUser.username}" size="30"  maxlength=32 /></dd>
			</dl>
		
			<dl>
				<dt>密码：</dt>
				<dd><input class="required" id="password" name="password" type="password" value="${sysUser.password}" size="30"  maxlength=32 /></dd>
			</dl>
			<div class="divider"></div>
		
			<dl>
				<dt>昵称：</dt>
				<dd><input class="required regcheck" id="name" name="name" type="text" value="${sysUser.name}" size="30"  maxlength=32 /></dd>
			</dl>
			<dl>
				<dt>用户类型：</dt><!-- cssClass="required"  -->
				<dd>
				<c:if test="${curUser.userType==1 }">
					<input type="radio" name="userType" value="3" id="usertype3" checked="checked">
					<label for="usertype3" style="float: none;">商铺</label>
					<input type="radio" name="userType" value="2" id="usertype2">
					<label for="usertype2" style="float: none;">商场</label>
					<input type="radio" name="userType" value="1" id="usertype1">
					<label for="usertype1" style="float: none;">超级管理员</label>
				</c:if>
				<c:if test="${curUser.userType==2 }">
					<input type="radio" name="userType" value="3" id="usertype3" checked="checked">
					<label for="usertype3" style="float: none;">商铺管理员</label>
					<input type="radio" name="userType" value="2" id="usertype2">
					<label for="usertype2" style="float: none;">商场管理员</label>
				</c:if>
				<c:if test="${curUser.userType==3 }">
					<input type="radio" name="userType" value="3" id="usertype3" checked="checked">
					<label for="usertype3" style="float: none;">商铺管理员</label>
				</c:if>
				</dd>
			</dl>
			<div class="divider"></div>
			
			<dl>
				<dt>所属商铺：</dt>
				<input id="system_shop_name_input" type="hidden" class="" name="shop.id" value="${sysUser.shop.id}"/>
				<input type="text" class="" size="24" value="${sysUser.shop.name}" suggestFields="name" suggestUrl="${ctx}/mall/shop/lookupJson" lookupGroup="shop"  onchange="if(!this.value) document.getElementById('system_shop_name_input').value=''" />
				<a class="btnLook" href="${ctx}/mall/shop/lookupList" lookupGroup="shop">查找带回</a>		
			</dl>
		
			<dl>
				<dt>所属角色：</dt>
				<input id="system_userRole_roleName_input" type="hidden" class="" name="userRole.id" value="${sysUser.userRole.id}"/>
				<input type="text" class="" size="24" name="userRole.roleName" value="${sysUser.userRole.roleName}" suggestFields="roleName" suggestUrl="${ctx}/system/sysRole/lookupJson" lookupGroup="userRole"  onchange="if(!this.value) document.getElementById('system_userRole_roleName_input').value=''" />
				<a class="btnLook" href="${ctx}/system/sysRole/lookupList" lookupGroup="userRole">查找带回</a>		
			</dl>
			<div class="divider"></div>
		
			<dl class="nowrap">
				<dt>用户描述：</dt>
				<dd>
					<textarea class="" id="userDesc" name="userDesc" cols="95" rows="5" width="480">${sysUser.userDesc}</textarea>
				</dd>
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
