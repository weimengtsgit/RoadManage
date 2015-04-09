<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_customer_msgLog_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/customer/msgLog/save" class="form-horizontal" >
		<div class="form-body">
			<input type="hidden" name="id" value="${msgLog.id}" />
			<form:field  label="发送者"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="sender" attrs=""  enumName="customer_Message_sender" inputType="radio"   enumKey="${msgLog.sender}"/>
			</form:field>
			
		
			<form:field  label="消息业务类型"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="type" attrs=""  enumName="customer_Message_type" inputType="radio"   enumKey="${msgLog.type}"/>
			</form:field>
			
		
			<form:field name="shopId" attrs="" label="shopId"  value="${msgLog.shopId}" ></form:field>
		
			<form:field name="mallId" attrs="" label="mallId"  value="${msgLog.mallId}" ></form:field>
		
			<form:field  label="客户"  useBody="true"  attrs="">
				<input class="form-control select2" name="customer.id" type="hidden"   value="${msgLog.customer.id}" display-value="${msgLog.customer.mobile}" result-field="mobile"   lookup-url="${ctx}/listJSON" filter="filter_LIKES_mobile" />
			</form:field>
		
			<form:field  label="操作用户"  useBody="true"  attrs="">
				<input class="form-control select2" name="user.id" type="hidden"   value="${msgLog.user.id}" display-value="${msgLog.user.username}" result-field="username"   lookup-url="${ctx}/system/sysUser/listJSON" filter="filter_LIKES_username" />
			</form:field>
		
			<form:field name="mobile" attrs="" label="手机号"  value="${msgLog.mobile}" ></form:field>
		
			<form:field name="msgContent" attrs=" " rows="3" label="短信内容"  value="${msgLog.msgContent}" type="textarea"  ></form:field>
		
			<form:field  label="发送时间"  useBody="true"  >
			<div class="input-group date form_datetime">                                       
				<input type="text" class="form-control" name=sendTime  value="<fmt:formatDate value="${msgLog.sendTime}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-btn">
				<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
				</span>
				</div>
			</form:field>
		
			<form:field  label="发送状态"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="status" attrs=""  enumName="successful" inputType="radio"   enumKey="${msgLog.status}"/>
			</form:field>
			
		
			<form:field name="result" attrs=" " rows="3" label="发送结果代码"  value="${msgLog.result}" type="textarea"  ></form:field>
			
			
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