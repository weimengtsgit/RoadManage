<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/device/device/save?navTabId=iacadevice_device_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${device.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>设备名称：</dt>
				<dd><input id="deviceName" readonly="readonly" name="deviceName" type="text" value="${device.deviceName}" size="30" maxlength="80" /></dd>
			</dl>
		
			<dl>
				<dt>设备编号：</dt>
				<dd><input id="deviceNum" readonly="readonly" name="deviceNum" type="text" value="${device.deviceNum}" size="30" maxlength="80" /></dd>
			</dl>
		
			<dl>
				<dt>设备类型：</dt>
				<dd><tag:enum isTag="false" id="deviceType" defaultValue="" name="deviceType" enumName="deviceType" enumKey="${device.deviceType}" /></dd>
			</dl>
		
			<dl>
				<dt>是否受控：</dt>
				<dd><tag:enum isTag="false" id="controlledState" defaultValue="" name="controlledState" enumName="isOrNot" enumKey="${device.controlledState}" /></dd>
			</dl>
		
			<dl>
				<dt>设备IP：</dt>
				<dd><input id="deviceIp" readonly="readonly" name="deviceIp" type="text" value="${device.deviceIp}" size="30" maxlength="80" /></dd>
			</dl>
		
			<dl>
				<dt>登陆名：</dt>
				<dd><input id="loginName" readonly="readonly" name="loginName" type="text" value="${device.loginName}" size="30" maxlength="80" /></dd>
			</dl>
		
			<dl>
				<dt>登陆密码：</dt>
				<dd><input id="loginPwd" readonly="readonly" name="loginPwd" type="text" value="${device.loginPwd}" size="30" maxlength="80" /></dd>
			</dl>
		
			<dl>
				<dt>设备组别：</dt>
				<dd><tag:enum isTag="false" id="deviceGroup" defaultValue="" name="deviceGroup" enumName="deviceGroup" enumKey="${device.deviceGroup}" /></dd>
			</dl>
		
			<dl class="nowrap">
				<dt>设备应用：</dt>
				<dd><textarea readonly="readonly" id="apps" cols="91" rows="5" width="480">${device.apps}</textarea></dd>
			</dl>
		
			<dl class="nowrap">
				<dt>设备描述：</dt>
				<dd><textarea readonly="readonly" id="des" cols="91" rows="5" width="480">${device.des}</textarea></dd>
			</dl>
		
			<div class="divider"></div>
		</div>
		<div class="formBar">
			<ul>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
