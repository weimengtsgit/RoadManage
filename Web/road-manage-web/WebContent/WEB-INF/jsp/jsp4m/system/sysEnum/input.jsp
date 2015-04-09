<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_system_sysEnum_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/system/sysEnum/save" class="form-horizontal" >
		<div class="form-body">
			<input type="hidden" name="id" value="${sysEnum.id}" />
			<form:field name="enumName" attrs="required" label="枚举标识"  value="${sysEnum.enumName}" ></form:field>
		
			<form:field name="enumDesc" attrs=" rows='5'" label="枚举名称"  value="${sysEnum.enumDesc}" type="textarea"  ></form:field>
			
			
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