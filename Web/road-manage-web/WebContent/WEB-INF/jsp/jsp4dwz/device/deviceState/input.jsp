<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/iacadevice/deviceState/save?navTabId=iacadevice_deviceState_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${deviceState.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>设备：</dt>
				<input id="iacadevice_device_deviceName_input" type="hidden" class="" name="device.id" value="${deviceState.device.id}"/>
				<input type="text" class="" size="24" name="device.deviceName" value="${deviceState.device.deviceName}" suggestFields="deviceName" suggestUrl="${ctx}/iacadevice/device/lookupJson" lookupGroup="device"  onchange="if(!this.value) document.getElementById('iacadevice_device_deviceName_input').value=''" />
				<a class="btnLook" href="${ctx}/iacadevice/device/lookupList" lookupGroup="device">查找带回</a>		
			</dl>
			
		
			<dl>
				<dt>CPU(%)：</dt>
				<dd><input class="" id="cpu" name="cpu" type="text" value="${deviceState.cpu}" size="30"  maxlength=200 /></dd>
			</dl>
		
			<dl>
				<dt>内存(total)：</dt>
				<dd><input class="" id="total" name="total" type="text" value="${deviceState.total}" size="30"  max=2147483647 maxlength=200 /></dd>
			</dl>
		
			<dl>
				<dt>内存(used)：</dt>
				<dd><input class="" id="used" name="used" type="text" value="${deviceState.used}" size="30"  max=2147483647 maxlength=200 /></dd>
			</dl>
		
			<dl>
				<dt>内存(buffer)：</dt>
				<dd><input class="" id="buffer" name="buffer" type="text" value="${deviceState.buffer}" size="30"  max=2147483647 maxlength=200 /></dd>
			</dl>
		
			<dl>
				<dt>内存(free)：</dt>
				<dd><input class="" id="free" name="free" type="text" value="${deviceState.free}" size="30"  max=2147483647 maxlength=200 /></dd>
			</dl>
		
			<dl>
				<dt>流量(Kbps)：</dt>
				<dd><input class="" id="flow" name="flow" type="text" value="${deviceState.flow}" size="30"  max=2147483647 maxlength=200 /></dd>
			</dl>
		
			<dl>
				<dt>设备状态：</dt>
				<dd><tag:enum id="deviceState" defaultValue="" cssClass="" name="deviceState" enumName="device_state" enumKey="${deviceState.deviceState}" /></dd>
			</dl>
		
			<dl>
				<dt>应用状态：</dt>
				<dd><tag:enum id="appState" defaultValue="" cssClass="" name="appState" enumName="device_state" enumKey="${deviceState.appState}" /></dd>
			</dl>
		
			<dl>
				<dt>异常应用：</dt>
				<dd><input class="" id="errApps" name="errApps" type="text" value="${deviceState.errApps}" size="30"  maxlength=200 /></dd>
			</dl>
		
			<dl>
				<dt>异常信息：</dt>
				<dd><input class="" id="msg" name="msg" type="text" value="${deviceState.msg}" size="30"  maxlength=200 /></dd>
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
