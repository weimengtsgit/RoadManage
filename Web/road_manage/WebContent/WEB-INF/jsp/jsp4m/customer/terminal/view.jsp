<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form class="form-horizontal" role="form">
<div class="form-body">
	<h5 class="form-section">基本信息</h5>
	<div class="row">
		<form:field name="" type="p" label="终端mac" value="${terminal.mac}"  totalWidth="6"></form:field>
		<form:field name="" type="p" label="关联顾客" value="" useBody="true"  totalWidth="6">
			<p class="form-control-static">
			<a class="btn blue-stripe btn-xs" href="${ctx }/customer/customer/view?id=${terminal.customer.id}"  data-handler="MODAL" data-title="顾客信息">${terminal.customer.mobile}</a>
			</p>
		</form:field>
	</div>
	<div class="row">
		<form:field name="" label="终端类型" value=""  useBody="true"  totalWidth="6">
			<p class="form-control-static"><tag:enum tagType="view"   enumName="com_terminal_type" enumKey="${terminal.type}" /></p>
		</form:field>
		<form:field name="" type="p" label="终端描述" value="${terminal.memo}"  totalWidth="6"></form:field>
	</div>
	
	<h5 class="form-section">访问信息</h5>
	<div class="row">
		<form:field name="" type="p" label="最近使用时间" value="" useBody="true"   totalWidth="6">
			<p class="form-control-static"><fmt:formatDate value="${terminal.lastAccessTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></p>
		</form:field>
		<form:field name="" label="最近断开时间" useBody="true"  value=""  totalWidth="6">
			<p class="form-control-static"><fmt:formatDate value="${terminal.lastExitTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></p>
		</form:field>
	</div>
	<div class="row">
		<form:field name="" type="p" label="访问次数" useBody="true"  value=""  totalWidth="6">
			<p class="form-control-static"><span class="badge badge-info">${terminal.accessPortalTimes}</span></p>
		</form:field>
	</div>
	
	<h5 class="form-section">注册信息</h5>
	<div class="row">
		<form:field name="" type="p" label="注册设备mac" value="${terminal.apMac}"  totalWidth="6"></form:field>
		<form:field name="" label="注册类型" value=""  useBody="true"  totalWidth="6">
			<p class="form-control-static"><tag:enum tagType="view"   enumName="com_terminal_regType" enumKey="${terminal.regType}" /></p>
		</form:field>
	</div>
	
	<div class="row">
		<form:field name="" type="p" label="注册状态" value=""  useBody="true"  totalWidth="6">
			<p class="form-control-static"><span class="label label-info"><tag:enum tagType="view"   enumName="com_terminal_status" enumKey="${terminal.status}" /></span></p>
		</form:field>
		<form:field name="" label="注册时间" value=""  useBody="true"  totalWidth="6">
			<p class="form-control-static"><fmt:formatDate value="${terminal.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></p>
		</form:field>
	</div>

</div>
</form>