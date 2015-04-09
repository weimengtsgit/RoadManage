<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_system_sysEnumValue_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/system/sysEnumValue/save" class="form-horizontal" >
		<div class="form-body">
			<input type="hidden" name="id" value="${sysEnumValue.id}" />
			<form:field name="enumKey" attrs="required" label="代号"  value="${sysEnumValue.enumKey}" >
			<div class="help-block">
				请 填写与其他代号不重复的数字。
			</div>	
			</form:field>
		
			<form:field name="enumVal" attrs="required rows='5'" label="名称"  value="${sysEnumValue.enumVal}" type="textarea"  ></form:field>
		
			<form:field name="enumSeq" attrs="" label="序号"  value="${sysEnumValue.enumSeq}" ></form:field>
		
			<input id="system_enumId_enumDesc_input" type="hidden" class="required" name="enumId.id" value="${empty pid?sysEnumValue.enumId.id:pid}"/>
			
			
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