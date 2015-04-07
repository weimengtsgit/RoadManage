<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form class="form-horizontal" role="form">
	<div class="form-body">
			<form:field name="" type="p" label="顾客" value="" useBody="true"  >
				<p class="form-control-static">
				<a class="btn blue-stripe btn-xs" href="${ctx }/customer/customer/view?id=${memberPromotion.customer.id}"  data-handler="MODAL" data-title="顾客信息">${memberPromotion.customer.mobile}</a>
				</p>
			</form:field>
			<form:field name="" type="p" label="商场" value="" useBody="true"  >
				<p class="form-control-static">
				<a class="btn blue-stripe btn-xs" href="${ctx}/mall/mall/view?id=${memberPromotion.shop.mall.id}"  data-handler="MODAL" data-title="商场信息">${memberPromotion.shop.mall.name}</a>
				</p>
			</form:field>
			<form:field name="" type="p" label="商铺" value="" useBody="true"  >
				<p class="form-control-static">
				<a class="btn blue-stripe btn-xs" href="${ctx}/mall/shop/view?id=${memberPromotion.shop.id}"  data-handler="MODAL" data-title="商铺信息">${memberPromotion.shop.name}</a>
				</p>
			</form:field>
			
			<form:field label="验证码"  value="${memberPromotion.validation}"  type="p"></form:field>
			<form:field label="状态"   type="p" useBody="true">
				<p class="form-control-static">
				<tag:enum enumName="MemberPromotion_status" enumKey="${memberPromotion.status}"  tagType="view"/>
				</p>
			</form:field>
	</div>
</form>
