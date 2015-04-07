<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form class="form-horizontal" role="form">
	<div class="form-body">
			<form:field name="" type="p" label="顾客" value="" useBody="true"  fwidth="6">
				<p class="form-control-static">
				<a class="btn blue-stripe btn-xs" href="${ctx }/customer/customer/view?id=${customerRalation.customer.id}"  data-handler="MODAL" data-title="顾客信息">${customerRalation.customer.mobile}</a>
				</p>
			</form:field>
			<form:field name="" type="p" label="终端" value="" useBody="true"  fwidth="6">
				<p class="form-control-static">
				<a class="btn blue-stripe btn-xs" href="${ctx }/customer/terminal/view?id=${customerRalation.terminal.id}"  data-handler="MODAL" data-title="终端信息">${customerRalation.terminal.mac}</a>
				</p>
			</form:field>
			<form:field name="" type="p" label="商场" value="" useBody="true"  fwidth="6">
				<p class="form-control-static">
				<a class="btn blue-stripe btn-xs" href="${ctx}/mall/mall/view?id=${customerRalation.shop.mall.id}"  data-handler="MODAL" data-title="商场信息">${customerRalation.shop.mall.name}</a>
				</p>
			</form:field>
			<form:field name="" type="p" label="商铺" value="" useBody="true"  fwidth="6">
				<p class="form-control-static">
				<a class="btn blue-stripe btn-xs" href="${ctx}/mall/shop/view?id=${customerRalation.shop.id}"  data-handler="MODAL" data-title="商铺信息">${customerRalation.shop.name}</a>
				</p>
			</form:field>
			<form:field  label="创建时间" fwidth="6" useBody="true">
			<p class="form-control-static">
			<fmt:formatDate value="${customerRalation.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>
			</p>
			</form:field>
	</div>
</form>
