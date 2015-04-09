<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/customer/statShow/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
	
	   		<div class="unit">
	   			<label>终端MAC：</label>
	   			<input type="text" name="filter_LIKES_termMac" value="${pageData.filtraMap.LIKES_termMac}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>AP设备MAC：</label>
	   			<input type="text" name="filter_LIKES_apMac" value="${pageData.filtraMap.LIKES_apMac}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>终端IP：</label>
	   			<input type="text" name="filter_LIKES_termIp" value="${pageData.filtraMap.LIKES_termIp}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>USER-AGENT：</label>
	   			<input type="text" name="filter_LIKES_userAgent" value="${pageData.filtraMap.LIKES_userAgent}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
				<label>访问来源：</label>
				<tag:enum id="accessType" inputType="select" defaultValue="" name="filter_EQS_accessType" enumName="com_statShow_accessType" enumKey="${pageData.filtraMap.EQS_accessType}" />
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>时间：</label>
				<input id="statTime" name="filter_GED_statTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_statTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
			</div>
	   		<div class="unit">
	   			<label>至：</label>
				<input id="statTime" name="filter_LED_statTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_statTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>资源ID：</label>
				<input type="text" name="filter_EQI_resourceId" value="${pageData.filtraMap.EQI_resourceId}"/>
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
