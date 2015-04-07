<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_system_sysTables_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/system/sysTables/save" class="form-horizontal" >
		<div class="form-body">
			<input type="hidden" name="id" value="${sysTables.id}" />
			<form:field name="tableName" attrs="" label="名称"  value="${sysTables.tableName}" ></form:field>
		
			<form:field name="tableDesc" attrs="" label="描述"  value="${sysTables.tableDesc}" ></form:field>
			
			
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