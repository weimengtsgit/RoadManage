<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_sysconf_sysConfType_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/sysconf/sysConfType/save" class="form-horizontal" >
		<div class="form-body">
			<input type="hidden" name="id" value="${sysConfType.id}" />
			<form:field name="confName" attrs="" label="配置名称"  value="${sysConfType.confName}" ></form:field>
		
			<form:field name="confKey" attrs="" label="配置标识"  value="${sysConfType.confKey}" ></form:field>
		
			<form:field name="confDes" attrs=" rows='5'" label="配置描述"  value="${sysConfType.confDes}" type="textarea"  ></form:field>
		
			
			
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