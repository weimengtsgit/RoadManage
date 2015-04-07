<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="mall_messageTemplate_form_1" method="post" action="${ctx}/mall/messageTemplate/save" class="form-horizontal" enctype="multipart/form-data">
		<!-- BEGIN FORM BODY-->
		<div class="form-body">
		<input type="hidden" name="id" value="${messageTemplate.id}" />
		<form:field label="模版名称" name="name" value="${messageTemplate.name}" required="true" attrs="maxlength=30"></form:field>
		
			<c:if test="${curUser.userType == 2 }">
				<input id="mall_mall_name_input" type="hidden" class="" name="mall.id" value="${curUser.mall.id}"/>
			</c:if>
			<c:if test="${curUser.userType == 3 }">
				<input id="mall_shop_name_input" type="hidden" class="" name="shop.id" value="${curUser.shop.id}"/>
			</c:if>
			
		<form:field label="模版内容"  type="textarea" name="content" value="${messageTemplate.content}" required="true" attrs="maxlength=30"></form:field>
		</div>
		
	<div class="form-actions right">
		<button type="button" class="btn default remove">取消</button>
		<button type="submit" class="btn blue"><i class="fa fa-check"></i> 确认</button>
	</div>
	</form>
	<script type="text/javascript">
jQuery(document).ready(function() {
	FormSamples.init({
		formId:'mall_messageTemplate_form_1'
	});
});
</script>
