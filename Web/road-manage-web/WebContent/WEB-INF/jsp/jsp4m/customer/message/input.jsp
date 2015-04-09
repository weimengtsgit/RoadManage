<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_customer_message_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/customer/message/save" class="form-horizontal" >
		<div class="form-body">
			<input type="hidden" name="id" value="${message.id}" />
			<form:field  label="发送者"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="sender" attrs=""  enumName="customer_Message_sender" inputType="radio"   enumKey="${message.sender}"/>
			</form:field>
			
		
			<form:field  label="消息业务类型"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="type" attrs=""  enumName="customer_Message_type" inputType="radio"   enumKey="${message.type}"/>
			</form:field>
			
		
			<form:field  label="操作用户"  useBody="true"  attrs="">
				<input class="form-control select2" name="user.id" type="hidden"   value="${message.user.id}" display-value="${message.user.username}" result-field="username"   lookup-url="${ctx}/system/sysUser/listJSON" filter="filter_LIKES_username" />
			</form:field>
		
			<form:field name="shopId" attrs="" label="shopId"  value="${message.shopId}" ></form:field>
		
			<form:field name="mallId" attrs="" label="mallId"  value="${message.mallId}" ></form:field>
		
			<form:field  label="客户"  useBody="true"  attrs="">
				<input class="form-control select2" name="customer.id" type="hidden"   value="${message.customer.id}" display-value="${message.customer.mobile}" result-field="mobile"   lookup-url="${ctx}/listJSON" filter="filter_LIKES_mobile" />
			</form:field>
		
			<form:field name="title" attrs=" " rows="3" label="标题"  value="${message.title}" type="textarea"  ></form:field>
		
			<form:field name="msgContent" attrs=" " rows="3" label="内容"  value="${message.msgContent}" type="textarea"  ></form:field>
		
			<form:field  label="发送时间"  useBody="true"  >
			<div class="input-group date form_datetime">                                       
				<input type="text" class="form-control" name=sendTime  value="<fmt:formatDate value="${message.sendTime}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-btn">
				<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
				</span>
				</div>
			</form:field>
		
			<form:field  label="阅读时间"  useBody="true"  >
			<div class="input-group date form_datetime">                                       
				<input type="text" class="form-control" name=readTime  value="<fmt:formatDate value="${message.readTime}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-btn">
				<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
				</span>
				</div>
			</form:field>
		
			<form:field  label="是否已读"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="isRead" attrs=""  enumName="customer_Message_isRead" inputType="radio"   enumKey="${message.isRead}"/>
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