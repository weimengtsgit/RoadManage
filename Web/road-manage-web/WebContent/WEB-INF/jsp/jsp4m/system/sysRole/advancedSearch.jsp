<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/system/sysRole/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
	
	   		<div class="unit">
	   			<label>角色名称：</label>
	   			<input type="text" name="filter_LIKES_roleName" value="${pageData.filtraMap.LIKES_roleName}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>角色描述：</label>
	   			<input type="text" name="filter_LIKES_roleDesc" value="${pageData.filtraMap.LIKES_roleDesc}"/>
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
