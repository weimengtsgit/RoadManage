<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/system/sysUser/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
	
	   		<div class="unit">
	   			<label>账号：</label>
	   			<input type="text" name="filter_LIKES_username" value="${pageData.filtraMap.LIKES_username}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<%-- <div class="unit">
	   			<label>密码：</label>
	   			<input type="text" name="filter_LIKES_password" value="${pageData.filtraMap.LIKES_password}"/>
			</div> --%>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>昵称：</label>
	   			<input type="text" name="filter_LIKES_name" value="${pageData.filtraMap.LIKES_name}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit" style="display: none">
				<label>用户类型：</label>
				<tag:enum id="userType" defaultValue="" name="filter_EQS_userType" enumName="userType" enumKey="${pageData.filtraMap.EQS_userType}" />
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>用户描述：</label>
	   			<input type="text" name="filter_LIKES_userDesc" value="${pageData.filtraMap.LIKES_userDesc}"/>
			</div>
			<div class="divider">divider</div>
	   		
			<div class="unit">
				<label>所属部门：</label>
				<input id="system_userDept_deptName_search" type="hidden" name="userDept.id" value='' />
				<input type="text" name="filter_LIKES_userDept.deptName" value='${pageData.filtraMap["LIKES_userDept.deptName"]}' suggestFields="deptName" suggestUrl="${ctx}/system/sysDept/lookupJson" lookupGroup="userDept" />
				<a class="btnLook" rel="system_sysDept_lookupList" href="${ctx}/system/sysDept/lookupList" lookupGroup="userDept">查找带回</a>
			</div>
			<div class="divider">divider</div>
	   		
			<div class="unit">
				<label>所属角色：</label>
				<input id="system_userRole_roleName_search" type="hidden" name="userRole.id" value='' />
				<input type="text" name="filter_LIKES_userRole.roleName" value='${pageData.filtraMap["LIKES_userRole.roleName"]}' suggestFields="roleName" suggestUrl="${ctx}/system/sysRole/lookupJson" lookupGroup="userRole" />
				<a class="btnLook" rel="system_sysRole_lookupList" href="${ctx}/system/sysRole/lookupList" lookupGroup="userRole">查找带回</a>
			</div>
			<div class="divider">divider</div>
	   
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">开始查询</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="reset">清空重输</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
