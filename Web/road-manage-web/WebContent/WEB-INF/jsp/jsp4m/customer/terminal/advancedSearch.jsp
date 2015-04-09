<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/customer/terminal/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
	
	   		<div class="unit">
	   			<label>终端MAC：</label>
	   			<input type="text" name="filter_LIKES_mac" value="${pageData.filtraMap.LIKES_mac}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
				<label>终端类型：</label>
				<tag:enum id="type" inputType="select" defaultValue="" name="filter_EQS_type" enumName="com_terminal_type" enumKey="${pageData.filtraMap.EQS_type}" />
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>终端描述：</label>
	   			<input type="text" name="filter_LIKES_memo" value="${pageData.filtraMap.LIKES_memo}"/>
			</div>
			<div class="divider">divider</div>
	   		
			<div class="unit">
				<label>关联顾客：</label>
				<input id="customer_customer_mobile_list" type="hidden" name="customer.id" value='' />
				<input type="text" name="filter_LIKES_customer.mobile" value='${pageData.filtraMap["LIKES_customer.mobile"]}' suggestFields="mobile" suggestUrl="${ctx}/customer/customer/lookupJson" lookupGroup="customer" />
				<a class="btnLook" href="${ctx}/customer/customer/lookupList" lookupGroup="customer" rel="/customer/customer/adsearchlookupList">查找带回</a>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>最近使用时间：</label>
				<input id="lastAccessTime" name="filter_GED_lastAccessTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_lastAccessTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
			</div>
	   		<div class="unit">
	   			<label>至：</label>
				<input id="lastAccessTime" name="filter_LED_lastAccessTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_lastAccessTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>最近断开时间：</label>
				<input id="lastExitTime" name="filter_GED_lastExitTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_lastExitTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
			</div>
	   		<div class="unit">
	   			<label>至：</label>
				<input id="lastExitTime" name="filter_LED_lastExitTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_lastExitTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>访问次数：</label>
				<input type="text" name="filter_EQI_accessPortalTimes" value="${pageData.filtraMap.EQI_accessPortalTimes}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>注册AP设备MAC：</label>
	   			<input type="text" name="filter_LIKES_apMac" value="${pageData.filtraMap.LIKES_apMac}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>创建时间：</label>
				<input id="createTime" name="filter_GED_createTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_createTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
			</div>
	   		<div class="unit">
	   			<label>至：</label>
				<input id="createTime" name="filter_LED_createTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_createTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
				<label>注册状态：</label>
				<tag:enum id="status" inputType="select" defaultValue="" name="filter_EQS_status" enumName="com_terminal_status" enumKey="${pageData.filtraMap.EQS_status}" />
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
				<label>注册类型：</label>
				<tag:enum id="regType" inputType="select" defaultValue="" name="filter_EQS_regType" enumName="com_terminal_regType" enumKey="${pageData.filtraMap.EQS_regType}" />
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
