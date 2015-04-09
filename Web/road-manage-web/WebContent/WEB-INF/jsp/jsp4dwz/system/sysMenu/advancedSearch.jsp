<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/system/sysMenu/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
	
	   		<div class="unit">
	   			<label>菜单名称：</label>
	   			<input type="text" name="filter_LIKES_menuDesc" value="${pageData.filtraMap.LIKES_menuDesc}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
				<label>菜单类型：</label>
				<tag:enum id="menuType" inputType="select" defaultValue="" name="filter_EQS_menuType" enumName="menuType" enumKey="${pageData.filtraMap.EQS_menuType}" />
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>菜单URL：</label>
	   			<input type="text" name="filter_LIKES_menuName" value="${pageData.filtraMap.LIKES_menuName}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>菜单序列：</label>
				<input type="text" name="filter_EQI_menuSeq" value="${pageData.filtraMap.EQI_menuSeq}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
				<label>是否IFRAME：</label>
				<tag:enum id="external" inputType="select" defaultValue="" name="filter_EQI_external" enumName="isOrNot" enumKey="${pageData.filtraMap.EQI_external}" />
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
				<label>打开目标：</label>
				<tag:enum id="target" inputType="select" defaultValue="" name="filter_EQS_target" enumName="target" enumKey="${pageData.filtraMap.EQS_target}" />
			</div>
			<div class="divider">divider</div>
	   		
			<div class="unit">
				<label>上级菜单：</label>
				<input id="system_parentId_menuDesc_list" type="hidden" name="parentId.id" value='' />
				<input type="text" name="filter_LIKES_parentId.menuDesc" value='${pageData.filtraMap["LIKES_parentId.menuDesc"]}' suggestFields="menuDesc" suggestUrl="${ctx}/system/sysMenu/lookupJson" lookupGroup="parentId" />
				<a class="btnLook" href="${ctx}/system/sysMenu/lookupList" lookupGroup="parentId">查找带回</a>
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
