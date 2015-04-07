<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_sysconf_sysConfIitem_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/sysconf/sysConfIitem/save" class="form-horizontal" >
		<div class="form-body">
			<input type="hidden" name="id" value="${sysConfIitem.id}" />
			<input type="hidden" name="confType.id" value="${empty pid ? sysConfIitem.confType.id:pid}"/>
			<input type="hidden" name="itemValue" value="${sysConfIitem.itemValue}"/>
			
			<form:field name="itemName" attrs="" label="配置项名称"  value="${sysConfIitem.itemName}" ></form:field>
		
			<form:field name="itemKey" attrs="" label="配置项key"  value="${sysConfIitem.itemKey}" ></form:field>
		
		
			<form:field  label="值类型"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="valueType" attrs=""  enumName="sys_conf_value_type" inputType="radio"   enumKey="${sysConfIitem.valueType}"/>
			</form:field>
			
		
			<form:field  label="值枚举类型"  useBody="true"  attrs="">
				<input class="form-control select2" name="enumType.id" type="hidden"   value="${sysConfIitem.enumType.id}" display-value="${sysConfIitem.enumType.enumDesc}" result-field="enumDesc"   lookup-url="${ctx}/system/sysEnum/listJSON" filter="filter_LIKES_enumDesc" />
			</form:field>
		
			<form:field name="des" attrs=" rows='5'" label="配置项描述"  value="${sysConfIitem.des}" type="textarea"  ></form:field>
			
			
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