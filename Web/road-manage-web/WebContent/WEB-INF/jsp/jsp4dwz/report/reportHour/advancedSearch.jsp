<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/report/reportHour/list" class="pageForm" onsubmit="return navTabSearch(this);">
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
	   			<label>时段：</label>
	   			<input type="text" name="filter_LIKES_time" value="${pageData.filtraMap.LIKES_time}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>在线用户数：</label>
				<input type="text" name="filter_EQI_onlineUserCount" value="${pageData.filtraMap.EQI_onlineUserCount}"/>
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
