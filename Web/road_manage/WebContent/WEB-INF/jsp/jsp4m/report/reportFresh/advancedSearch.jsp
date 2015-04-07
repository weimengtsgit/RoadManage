<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/report/reportFresh/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
	
	   		<div class="unit">
				<label>统计项：</label>
				<tag:enum id="type" inputType="select" defaultValue="" name="filter_EQS_type" enumName="com_reportFresh_type" enumKey="${pageData.filtraMap.EQS_type}" />
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>数量：</label>
				<input type="text" name="filter_EQI_count" value="${pageData.filtraMap.EQI_count}"/>
			</div>
			<div class="divider">divider</div>
	   		
			<div class="unit">
				<label>商铺：</label>
				<input id="report_shopId_name_list" type="hidden" name="shopId.id" value='' />
				<input type="text" name="filter_LIKES_shopId.name" value='${pageData.filtraMap["LIKES_shopId.name"]}' suggestFields="name" suggestUrl="${ctx}/mall/shop/lookupJson" lookupGroup="shopId" />
				<a class="btnLook" href="${ctx}/mall/shop/lookupList" lookupGroup="shopId" rel="/mall/shop/adsearchlookupList">查找带回</a>
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
