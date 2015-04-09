<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_queue_queueCard_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/queue/queueCard/save" class="form-horizontal" >
		<div class="form-body">
			<input type="hidden" name="id" value="${queueCard.id}" />
			<form:field  label="所属商铺"  useBody="true"  attrs="">
				<input class="form-control select2" name="shop.id" type="hidden"   value="${queueCard.shop.id}" display-value="${queueCard.shop.name}" result-field="name"   lookup-url="${ctx}/listJSON" filter="filter_LIKES_name" />
			</form:field>
		
			<form:field name="cardNo" attrs="" label="卡号"  value="${queueCard.cardNo}" ></form:field>
		
			<form:field  label="卡类型"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="cardType" attrs=""  enumName="queue_card_type" inputType="radio"   enumKey="${queueCard.cardType}"/>
			</form:field>
			
		
			<form:field  label="顾客"  useBody="true"  attrs="">
				<input class="form-control select2" name="customer.id" type="hidden"   value="${queueCard.customer.id}" display-value="${queueCard.customer.mobile}" result-field="mobile"   lookup-url="${ctx}/customer/customer/listJSON" filter="filter_LIKES_mobile" />
			</form:field>
		
			<form:field name="name" attrs="" label="姓名"  value="${queueCard.name}" ></form:field>
		
			<form:field name="phone" attrs="" label="电话"  value="${queueCard.phone}" ></form:field>
		
			<form:field  label="开始排号时间"  useBody="true"  >
			<div class="input-group date form_datetime">                                       
				<input type="text" class="form-control" name=startTime  value="<fmt:formatDate value="${queueCard.startTime}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-btn">
				<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
				</span>
				</div>
			</form:field>
		
			<form:field  label="结束排号时间"  useBody="true"  >
			<div class="input-group date form_datetime">                                       
				<input type="text" class="form-control" name=endTime  value="<fmt:formatDate value="${queueCard.endTime}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-btn">
				<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
				</span>
				</div>
			</form:field>
		
			<form:field  label="状态"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="status" attrs=""  enumName="QueueCard_status" inputType="radio"   enumKey="${queueCard.status}"/>
			</form:field>
			
		
			<form:field name="callTimes" attrs="" label="提醒次数"  value="${queueCard.callTimes}" ></form:field>
			
			
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