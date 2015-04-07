<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/device/device/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
	
	   		<div class="unit">
	   			<label>设备名称：</label>
	   			<input type="text" name="filter_LIKES_deviceName" value="${pageData.filtraMap.LIKES_deviceName}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>设备编号：</label>
	   			<input type="text" name="filter_LIKES_deviceNum" value="${pageData.filtraMap.LIKES_deviceNum}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
				<label>设备类型：</label>
				<tag:enum id="deviceType" defaultValue="" name="filter_EQS_deviceType" enumName="deviceType" enumKey="${pageData.filtraMap.EQS_deviceType}" />
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
				<label>是否受控：</label>
				<tag:enum id="controlledState" defaultValue="" name="filter_EQS_controlledState" enumName="isOrNot" enumKey="${pageData.filtraMap.EQS_controlledState}" />
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>设备应用：</label>
	   			<input type="text" name="filter_LIKES_apps" value="${pageData.filtraMap.LIKES_apps}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>设备IP：</label>
	   			<input type="text" name="filter_LIKES_deviceIp" value="${pageData.filtraMap.LIKES_deviceIp}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>登陆名：</label>
	   			<input type="text" name="filter_LIKES_loginName" value="${pageData.filtraMap.LIKES_loginName}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>登陆密码：</label>
	   			<input type="text" name="filter_LIKES_loginPwd" value="${pageData.filtraMap.LIKES_loginPwd}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
				<label>设备组别：</label>
				<tag:enum id="deviceGroup" defaultValue="" name="filter_EQS_deviceGroup" enumName="deviceGroup" enumKey="${pageData.filtraMap.EQS_deviceGroup}" />
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>设备描述：</label>
	   			<input type="text" name="filter_LIKES_des" value="${pageData.filtraMap.LIKES_des}"/>
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
