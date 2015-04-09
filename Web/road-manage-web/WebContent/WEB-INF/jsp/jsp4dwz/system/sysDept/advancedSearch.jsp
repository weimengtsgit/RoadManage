<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/system/sysDept/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
	
	   		<div class="unit">
	   			<label>部门名称：</label>
	   			<input type="text" name="filter_LIKES_deptName" value="${pageData.filtraMap.LIKES_deptName}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>部门编号：</label>
	   			<input type="text" name="filter_LIKES_deptNum" value="${pageData.filtraMap.LIKES_deptNum}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>部门地址：</label>
	   			<input type="text" name="filter_LIKES_deptAddr" value="${pageData.filtraMap.LIKES_deptAddr}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>部门描述：</label>
	   			<input type="text" name="filter_LIKES_deptDesc" value="${pageData.filtraMap.LIKES_deptDesc}"/>
			</div>
			<div class="divider">divider</div>
	   		
			<div class="unit">
				<label>上级部门：</label>
				<input id="system_parentId_deptName_list" type="hidden" name="parentId.id" value='' />
				<input type="text" name="filter_LIKES_parentId.deptName" value='${pageData.filtraMap["LIKES_parentId.deptName"]}' suggestFields="deptName" suggestUrl="${ctx}/system/sysDept/lookupJson" lookupGroup="parentId" />
				<a class="btnLook" rel="system_sysDept_lookuplist" href="${ctx}/system/sysDept/lookupList" lookupGroup="parentId">查找带回</a>
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
