<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/report/reportDay/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
	
	   		<div class="unit">
	   			<label>日期：</label>
				<input id="date" name="filter_GED_date" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_date}" /><a class="inputDateButton" href="javascript:;">选择</a>
			</div>
	   		<div class="unit">
	   			<label>至：</label>
				<input id="date" name="filter_LED_date" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_date}" /><a class="inputDateButton" href="javascript:;">选择</a>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>宣传页展示数(PV)：</label>
				<input type="text" name="filter_EQI_pv" value="${pageData.filtraMap.EQI_pv}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>无线网络客流量（UV）：</label>
				<input type="text" name="filter_EQI_uv" value="${pageData.filtraMap.EQI_uv}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>手机注册用户数：</label>
				<input type="text" name="filter_EQI_newUserCount" value="${pageData.filtraMap.EQI_newUserCount}"/>
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
