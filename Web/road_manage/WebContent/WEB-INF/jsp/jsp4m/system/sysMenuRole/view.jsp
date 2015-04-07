<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="角色ID"  value="${sysMenuRole.roleId}" ></form:field>
		
			<form:field type="p" label="菜单ID"  value="${sysMenuRole.menuId}" ></form:field>
			
		</div>
	</form>
