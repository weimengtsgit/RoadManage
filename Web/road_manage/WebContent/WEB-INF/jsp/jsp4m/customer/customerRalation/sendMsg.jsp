<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="customer_message_sendmsg_form_1" method="post" action="${ctx}/customer/msgLog/save" class="form-horizontal" >
		<input type="hidden" name="ids" value="${ids}" />
		<input type="hidden" name="phone" value="${phone}" />
		<div class="form-body">
				
					尊敬的顾客您好!<br/><br/>
					<input placeholder="消息模版" result-callback="$this.next('textarea').val(m.content)" class="form-control select2"  type="hidden"  result-field="name" result-formatter="mall_messageTemplate"  lookup-url="${ctx }/mall/messageTemplate/listJSON" filter="filter_LIKES_name" />
					<textarea class="form-control"  name="msgContent.content"  rows="5" ></textarea>
					<br/>
					【${curUser.shop.name }】
					<hr/>
					<div class="radio-list">
						<label class="radio-inline">
						<input type="radio" name="sendType"  value="1" checked> 手机短信
						</label>
						<label class="radio-inline">
						<input type="radio" name="sendType"  value="2" > 站内信
						</label>
						<label class="radio-inline">
						<input type="radio" name="sendType"  value="3" > 手机短信&站内信
						</label>  
					</div>
			<button type="submit" class="btn blue pull-right"><i class="fa fa-check "></i> 发送</button>
			<br/>
		</div>	
</form>
<script type="text/javascript">

jQuery(document).ready(function() {
	FormSamples.init({
		formId:'customer_message_sendmsg_form_1',
		confirm:true
	});
	
});
</script>