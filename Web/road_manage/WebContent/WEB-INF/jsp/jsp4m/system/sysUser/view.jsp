<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>

<form method="post" id="system_sysUser_view_form_1"  class="form-horizontal" >
	  <div class="form-body">
		<form:field name="username" label="账号" value="${sysUser.username}" type="p" cssClass="form-control"  fwidth="6" ></form:field>
		<form:field name="name" label="昵称" value="${sysUser.name}" type="p" cssClass="form-control"  fwidth="6"></form:field>
		<form:field name="userType" label="用户类型" value="" useBody="true" fwidth="6">
			<p class="form-control"><tag:enum tagType="view" enumName="userType" enumKey="${sysUser.userType}" /></p>
		</form:field>
		<form:field name="" label="所属商铺" value="${sysUser.shop.name}" type="p" cssClass="form-control"   fwidth="6">
		</form:field>
		<form:field name="" label="所属角色" value="${sysUser.userRole.roleName}"  type="p" cssClass="form-control"  fwidth="6">
		</form:field>
		<form:field name="userDesc" label="用户描述" type="textarea" value="${sysUser.userDesc}" attrs=' rows="4" ' fwidth="6"></form:field>
		
	  </div>
</form>
