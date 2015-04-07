<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/iacadevice/deviceState/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
			
			<div class="unit">
				<label>设备：</label>
				<input id="iacadevice_device_deviceName_list" type="hidden" name="device.id" value='' />
				<input type="text" name="filter_LIKES_device.deviceName" value='${pageData.filtraMap["LIKES_device.deviceName"]}' suggestFields="deviceName" suggestUrl="${ctx}/iacadevice/device/lookupJson" lookupGroup="device" />
				<a class="btnLook" href="${ctx}/iacadevice/device/lookupList" lookupGroup="device">查找带回</a>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>CPU(%)：</label>
				<input type="text" name="filter_EQN_cpu" value="${pageData.filtraMap.EQN_cpu}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>内存(total)：</label>
				<input type="text" name="filter_EQI_total" value="${pageData.filtraMap.EQI_total}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>内存(used)：</label>
				<input type="text" name="filter_EQI_used" value="${pageData.filtraMap.EQI_used}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>内存(buffer)：</label>
				<input type="text" name="filter_EQI_buffer" value="${pageData.filtraMap.EQI_buffer}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>内存(free)：</label>
				<input type="text" name="filter_EQI_free" value="${pageData.filtraMap.EQI_free}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>流量(Kbps)：</label>
				<input type="text" name="filter_EQI_flow" value="${pageData.filtraMap.EQI_flow}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
				<label>设备状态：</label>
				<tag:enum id="deviceState" defaultValue="" name="filter_EQI_deviceState" enumName="device_state" enumKey="${pageData.filtraMap.EQI_deviceState}" />
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
				<label>应用状态：</label>
				<tag:enum id="appState" defaultValue="" name="filter_EQI_appState" enumName="device_state" enumKey="${pageData.filtraMap.EQI_appState}" />
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>异常应用：</label>
	   			<input type="text" name="filter_LIKES_errApps" value="${pageData.filtraMap.LIKES_errApps}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>异常信息：</label>
	   			<input type="text" name="filter_LIKES_msg" value="${pageData.filtraMap.LIKES_msg}"/>
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
