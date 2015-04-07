<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="商场"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/mall/mall/view?id=${queueConfigShop.mall.id}"  data-handler="MODAL" data-title="商场信息">${queueConfigShop.mall.name}</a>
			</form:field>
		
			<form:field  label="商铺"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/mall/shop/view?id=${queueConfigShop.shop.id}"  data-handler="MODAL" data-title="商铺信息">${queueConfigShop.shop.name}</a>
			</form:field>
		
			<form:field  label="排队卡类型"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="queue_card_type" enumKey="${queueConfigShop.type}" />
			</form:field>
		
			<form:field type="p" label="排位间隔（分钟）"  value="${queueConfigShop.interval}" ></form:field>
		
			<form:field  label="排位提醒开关 "  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="isOrNot" enumKey="${queueConfigShop.isCall}" />
			</form:field>
			
		
			<form:field  label="提醒方式"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="call_type" enumKey="${queueConfigShop.callType}" />
			</form:field>
			
		
			<form:field  label="状态"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="QueueConfigShop_status" enumKey="${queueConfigShop.status}" />
			</form:field>
			
			
		</div>
	</form>
