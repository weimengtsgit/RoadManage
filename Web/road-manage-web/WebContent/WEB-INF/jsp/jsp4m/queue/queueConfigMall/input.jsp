<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_queue_queueConfigMall_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/queue/queueConfigMall/save" class="form-horizontal" >
		<div class="form-body">
			<input type="hidden" name="id" value="${queueConfigMall.id}" />
			<form:field  label="所属商场"  useBody="true"  attrs="">
				<input class="form-control select2" name="mall.id" type="hidden"   value="${queueConfigMall.mall.id}" display-value="${queueConfigMall.mall.name}" result-field="name"   lookup-url="${ctx}/mall/mall/listJSON" filter="filter_LIKES_name" />
			</form:field>
		
			<form:field name="maxQueueCard" attrs="" label="最多同时领取排卡的数量"  value="${queueConfigMall.maxQueueCard}" ></form:field>
			
			
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