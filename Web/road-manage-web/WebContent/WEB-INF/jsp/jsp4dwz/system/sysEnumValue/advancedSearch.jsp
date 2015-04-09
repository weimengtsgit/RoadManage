<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/system/sysEnumValue/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
	
	   		<div class="unit">
	   			<label>枚举键：</label>
	   			<input type="text" name="filter_LIKES_enumKey" value="${pageData.filtraMap.LIKES_enumKey}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>枚举值：</label>
	   			<input type="text" name="filter_LIKES_enumVal" value="${pageData.filtraMap.LIKES_enumVal}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>枚举序列：</label>
				<input type="text" name="filter_EQI_enumSeq" value="${pageData.filtraMap.EQI_enumSeq}"/>
			</div>
			<div class="divider">divider</div>
	   		
			<div class="unit">
				<label>枚举对象：</label>
				<input id="system_enumId_enumDesc_list" type="hidden" name="enumId.id" value='' />
				<input type="text" name="filter_LIKES_enumId.enumDesc" value='${pageData.filtraMap["LIKES_enumId.enumDesc"]}' suggestFields="enumDesc" suggestUrl="${ctx}/system/sysEnum/lookupJson" lookupGroup="enumId" />
				<a class="btnLook" href="${ctx}/system/sysEnum/lookupList" lookupGroup="enumId">查找带回</a>
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
