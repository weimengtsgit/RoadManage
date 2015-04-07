<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_customer_mscoreLog_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/customer/mscoreLog/save" class="form-horizontal" >
		<div class="form-body">
			<input type="hidden" name="id" value="${mscoreLog.id}" />
			<form:field  label="会员"  useBody="true"  >
				<input class="form-control select2" name="mcard.id" type="hidden"   value="${mscoreLog.mcard.id}" display-value="${mscoreLog.mcard.cardId}" result-field="cardId"   lookup-url="${ctx}/customer/mcard/listJSON" filter="filter_LIKES_cardId" />
			</form:field>
		
			<form:field  label="交易类型"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="type" attrs=""  enumName="com_MscoreLog_type" inputType="select" defaultValue="${mscoreLog.type}"  enumKey="${mscoreLog.type}"/>
			</form:field>
			
		
			<form:field name="score" attrs="" label="交易积分"  value="${mscoreLog.score}" ></form:field>
		
			<form:field name="totalScore" attrs="" label="剩余积分"  value="${mscoreLog.totalScore}" ></form:field>
		
			<form:field  label="交易时间"  useBody="true"  >
			<div class="input-group date form_datetime">                                       
				<input type="text" class="form-control" name=time  value="<fmt:formatDate value="${mscoreLog.time}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-btn">
				<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
				</span>
				</div>
			</form:field>
		
			<form:field name="action" attrs=" rows='5'" label="交易说明"  value="${mscoreLog.action}" type="textarea"  ></form:field>
			
			
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