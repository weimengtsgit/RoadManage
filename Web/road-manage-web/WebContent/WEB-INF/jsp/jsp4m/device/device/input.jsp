<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/device/device/save?navTabId=iacadevice_device_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${device.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>设备名称：</dt>
				<dd><input class="required" id="deviceName" name="deviceName" type="text" value="${device.deviceName}" size="30"  maxlength=200 /></dd>
			</dl>
		
			<dl>
				<dt>设备编号：</dt>
				<dd><input class="required" id="deviceNum" name="deviceNum" type="text" value="${device.deviceNum}" size="30"  maxlength=200 /></dd>
			</dl>
		<div class="divider"></div>
			<dl>
				<dt>设备类型：</dt>
				<dd><tag:enum id="deviceType" defaultValue="" cssClass="required" name="deviceType" enumName="deviceType" enumKey="${device.deviceType}" /></dd>
			</dl>
		
			<dl>
				<dt>是否受控：</dt>
				<dd><tag:enum id="controlledState" defaultValue="" cssClass="required" name="controlledState" enumName="isOrNot" enumKey="${device.controlledState}" /></dd>
			</dl>
		<div class="divider"></div>
			<dl>
				<dt>设备IP：</dt>
				<dd><input class="required" id="deviceIp" name="deviceIp" type="text" value="${device.deviceIp}" size="30"  maxlength=200 /></dd>
			</dl>
			<dl>
				<dt>设备组别：</dt>
				<dd><tag:enum id="deviceGroup" defaultValue="" cssClass="required" name="deviceGroup" enumName="deviceGroup" enumKey="${device.deviceGroup}" /></dd>
			</dl>
		<div class="divider"></div>
		
			<dl>
				<dt>登陆名：</dt>
				<dd><input class="" id="loginName" name="loginName" type="text" value="${device.loginName}" size="30"  maxlength=200 /></dd>
			</dl>
			<dl>
				<dt>登陆密码：</dt>
				<dd><input class="" id="loginPwd" name="loginPwd" type="text" value="${device.loginPwd}" size="30"  maxlength=200 /></dd>
			</dl>
		
		<div class="divider"></div>
			<dl class="nowrap">
				<dt>设备应用：</dt>
				<dd>
					<textarea class="" id="apps" name="apps" cols="95" rows="5" width="480">${device.apps}</textarea>
				</dd>
			</dl>
		
			<dl class="nowrap">
				<dt>设备描述：</dt>
				<dd>
					<textarea class="" id="des" name="des" cols="95" rows="5" width="480">${device.des}</textarea>
				</dd>
			</dl>
		
			<div class="divider"></div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
