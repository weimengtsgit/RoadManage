<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form class="form-horizontal" role="form">
	<div class="form-body">
			<form:field name="sn" label="设备出厂SN"  type="p" value="${apDevice.sn}"  fwidth="6"></form:field>
			<form:field name="mac" label="设备mac" type="p" value="${apDevice.mac}"  fwidth="6"></form:field>
			<form:field name="ip" label="设备IP" type="p" value="${apDevice.ip}"  fwidth="6"></form:field>
			<form:field name="mall.id" label="所属商场" type="p" value="${apDevice.mall.name}"  fwidth="6"></form:field>
			<form:field name="location" label="设备位置" type="p" value="${apDevice.location}"  fwidth="6"></form:field>
			<form:field name="" label="创建时间" type="p" value="${apDevice.createTime}"  fwidth="6"></form:field>
			<form:field name="" label="运行状态"  value=""  useBody="true" fwidth="6">
				<p class="form-control-static" ><tag:enum tagType="view" enumName="deviceStatus" enumKey="${apDevice.status}" /><p>
			</form:field>
	</div>
</form>

