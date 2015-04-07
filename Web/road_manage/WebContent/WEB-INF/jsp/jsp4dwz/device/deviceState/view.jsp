<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/iacadevice/deviceState/save?navTabId=iacadevice_deviceState_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${deviceState.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>设备：</dt>
				<dd><a href="${ctx}/iacadevice/device/view?id=${deviceState.device.id}" target="dialog" rel="iacadevice_deviceState_dialog" title="${deviceState.device.deviceName}">${deviceState.device.deviceName}</a></dd>
			</dl>
		
			<dl>
				<dt>CPU(%)：</dt>
				<dd><input id="cpu" readonly="readonly" name="cpu" type="text" value="${deviceState.cpu}" size="30" maxlength="80" /></dd>
			</dl>
		
			<dl>
				<dt>内存(total)：</dt>
				<dd><input id="total" readonly="readonly" name="total" type="text" value="${deviceState.total}" size="30" maxlength="80" /></dd>
			</dl>
		
			<dl>
				<dt>内存(used)：</dt>
				<dd><input id="used" readonly="readonly" name="used" type="text" value="${deviceState.used}" size="30" maxlength="80" /></dd>
			</dl>
		
			<dl>
				<dt>内存(buffer)：</dt>
				<dd><input id="buffer" readonly="readonly" name="buffer" type="text" value="${deviceState.buffer}" size="30" maxlength="80" /></dd>
			</dl>
		
			<dl>
				<dt>内存(free)：</dt>
				<dd><input id="free" readonly="readonly" name="free" type="text" value="${deviceState.free}" size="30" maxlength="80" /></dd>
			</dl>
		
			<dl>
				<dt>流量(Kbps)：</dt>
				<dd><input id="flow" readonly="readonly" name="flow" type="text" value="${deviceState.flow}" size="30" maxlength="80" /></dd>
			</dl>
		
			<dl>
				<dt>设备状态：</dt>
				<dd><tag:enum isTag="false" id="deviceState" defaultValue="" name="deviceState" enumName="device_state" enumKey="${deviceState.deviceState}" /></dd>
			</dl>
		
			<dl>
				<dt>应用状态：</dt>
				<dd><tag:enum isTag="false" id="appState" defaultValue="" name="appState" enumName="device_state" enumKey="${deviceState.appState}" /></dd>
			</dl>
		
			<dl>
				<dt>异常应用：</dt>
				<dd><input id="errApps" readonly="readonly" name="errApps" type="text" value="${deviceState.errApps}" size="30" maxlength="80" /></dd>
			</dl>
		
			<dl>
				<dt>异常信息：</dt>
				<dd><input id="msg" readonly="readonly" name="msg" type="text" value="${deviceState.msg}" size="30" maxlength="80" /></dd>
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
