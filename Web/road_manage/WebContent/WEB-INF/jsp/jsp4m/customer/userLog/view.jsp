<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form class="form-horizontal" role="form">
<div class="form-body">
	<h5 class="form-section">认证信息</h5>
	<div class="row">
		<form:field name="" type="p" label="终端mac" value="${userLog.termMac}"  totalWidth="6"></form:field>
		<form:field name="" type="p" label="终端IP" value="${userLog.termIp}"  totalWidth="6"></form:field>
	</div>
	<div class="row">
		<form:field name="" type="p" label="认证名" value="${userLog.authName}"  totalWidth="6"></form:field>
		<form:field name="" type="p" label="接入设备mac" value="${userLog.apMac}"  totalWidth="6"></form:field>
	</div>
	
	<h5 class="form-section">上网信息</h5>
	<div class="row">
		<form:field name="" type="p" label="上线时间" value="" useBody="true"  totalWidth="6">
			<p class="form-control-static"><fmt:formatDate value="${userLog.onlineTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></p>
		</form:field>
		<form:field name="" type="p" label="下线时间" value="" useBody="true" totalWidth="6">
			<p class="form-control-static"><fmt:formatDate value="${userLog.offlineTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></p>
		</form:field>
	</div>
	<div class="row">
		<form:field name="" type="p" label="上网总时长(秒)" value="${userLog.totalTime}"  totalWidth="6"></form:field>
		<form:field name="" type="p" label="上网总流量(MB)" value="${userLog.totalFlow}"  totalWidth="6"></form:field>
	</div>
	
	<div class="row">
		<form:field name="" type="p" label="费用" value="${userLog.totalFee}"  totalWidth="6"></form:field>
		<form:field name="" type="p" label="唯一标识" value="${userLog.sessionId}"  totalWidth="6"></form:field>
	</div>
	
	
</div>
</form>
