<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/customer/userLog/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
	
	   		<div class="unit">
	   			<label>终端MAC：</label>
	   			<input type="text" name="filter_LIKES_termMac" value="${pageData.filtraMap.LIKES_termMac}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>认证名：</label>
	   			<input type="text" name="filter_LIKES_authName" value="${pageData.filtraMap.LIKES_authName}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>终端IP：</label>
	   			<input type="text" name="filter_LIKES_termIp" value="${pageData.filtraMap.LIKES_termIp}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>AP设备MAC：</label>
	   			<input type="text" name="filter_LIKES_apMac" value="${pageData.filtraMap.LIKES_apMac}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>上线时间：</label>
				<input id="onlineTime" name="filter_GED_onlineTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_onlineTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
			</div>
	   		<div class="unit">
	   			<label>至：</label>
				<input id="onlineTime" name="filter_LED_onlineTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_onlineTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>下线时间：</label>
				<input id="offlineTime" name="filter_GED_offlineTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_offlineTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
			</div>
	   		<div class="unit">
	   			<label>至：</label>
				<input id="offlineTime" name="filter_LED_offlineTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_offlineTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>上网总时长(秒)：</label>
				<input type="text" name="filter_EQI_totalTime" value="${pageData.filtraMap.EQI_totalTime}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>上网总流量(MB)：</label>
				<input type="text" name="filter_EQI_totalFlow" value="${pageData.filtraMap.EQI_totalFlow}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>费用：</label>
				<input type="text" name="filter_EQI_totalFee" value="${pageData.filtraMap.EQI_totalFee}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>唯一标识：</label>
	   			<input type="text" name="filter_LIKES_sessionId" value="${pageData.filtraMap.LIKES_sessionId}"/>
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
