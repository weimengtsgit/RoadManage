<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_customer_mcard_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/customer/mcard/save" class="form-horizontal" >
		<div class="form-body">
			<input type="hidden" name="id" value="${mcard.id}" />
			<form:field name="cardId" attrs="required" label="会员卡号"  value="${mcard.cardId}" ></form:field>
		
			<form:field  label="会员卡类型"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="type" attrs="required"  enumName="Mcard_type" inputType="select" defaultValue="${mcard.type}"  enumKey="${mcard.type}"/>
			</form:field>
			
		
			<form:field  label="创建时间"  useBody="true"  >
			<div class="input-group date form_datetime">                                       
				<input type="text" class="form-control" name=createTime  value="<fmt:formatDate value="${mcard.createTime}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-btn">
				<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
				</span>
				</div>
			</form:field>
		
			<form:field name="score" attrs="required " label="积分"  value="${mcard.score}" ></form:field>
		
			<form:field  label="顾客"  useBody="true"  attrs="required">
				<input class="form-control select2" name="customer.id" type="hidden" required  value="${mcard.customer.id}" display-value="${mcard.customer.mobile}" result-field="mobile"   lookup-url="${ctx}/customer/customer/listJSON" filter="filter_LIKES_mobile" />
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