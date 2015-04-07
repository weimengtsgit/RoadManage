<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_queue_queueConfigShop_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/queue/queueConfigShop/save" class="form-horizontal" >
		<div class="form-body">
			<input type="hidden" name="id" value="${queueConfigShop.id}" />
			<form:field  label="商场"  useBody="true"  attrs="">
				<input class="form-control select2" name="mall.id" type="hidden"   value="${queueConfigShop.mall.id}" display-value="${queueConfigShop.mall.name}" result-field="name"   lookup-url="${ctx}/mall/mall/listJSON" filter="filter_LIKES_name" />
			</form:field>
		
			<form:field  label="商铺"  useBody="true"  attrs="">
				<input class="form-control select2" name="shop.id" type="hidden"   value="${queueConfigShop.shop.id}" display-value="${queueConfigShop.shop.name}" result-field="name"   lookup-url="${ctx}/mall/shop/listJSON" filter="filter_LIKES_name" />
			</form:field>
		
			<form:field  label="排队卡类型"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="type" attrs=""  enumName="queue_card_type" inputType="radio" disabled="true"   enumKey="${queueConfigShop.type}"/>
			</form:field>
		
			<form:field name="interval" attrs="" label="排位间隔（分钟）" defaultValue="5"  value="${queueConfigShop.interval}"  ></form:field>
		
			<form:field  label="排位提醒开关 "  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="isCall" attrs=""  enumName="isOrNot" inputType="radio"   enumKey="${queueConfigShop.isCall}"/>
			</form:field>
			
		
			<form:field  label="提醒方式"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="callType" attrs=""  enumName="call_type" inputType="radio"   enumKey="${queueConfigShop.callType}"/>
			</form:field>
			
		
			<form:field  label="状态"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="status" attrs=""  enumName="QueueConfigShop_status" inputType="radio"   enumKey="${queueConfigShop.status}"/>
			</form:field>
			
			
			
		</div>
		<div class="form-actions right">
			<button type="button" class="btn default remove">取消</button>
			<button type="submit" class="btn blue"><i class="fa fa-check"></i> 确认</button>
		</div>
	</form>
		
<script type="text/javascript">

jQuery(document).ready(function() {
	FormSamples.init({
		formId:'${formId }'
	});
	
});
</script>