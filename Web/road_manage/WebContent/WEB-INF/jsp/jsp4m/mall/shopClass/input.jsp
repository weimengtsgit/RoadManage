<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_mall_shopClass_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/mall/shopClass/save" class="form-horizontal" >
		<div class="form-body">
			<input type="hidden" name="id" value="${shopClass.id}" />
			<form:field  label="分类级别"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="level" attrs=""  enumName="shopClass_level" inputType="radio"   enumKey="${shopClass.level}"/>
			</form:field>
			
		
			<form:field  label="父类别"  useBody="true"  attrs="">
				<input class="form-control select2" name="parentType.id" type="hidden"   value="${shopClass.parentType.id}" display-value="${shopClass.parentType.name}" result-field="name"   lookup-url="${ctx}/mall/shopClass/listJSON?filter_EQI_level=1" filter="filter_LIKES_name" />
			</form:field>
		
			<form:field name="name" attrs="" label="类别名称"  value="${shopClass.name}" ></form:field>
		
			<form:field name="des" attrs="" label="类别描述"  value="${shopClass.des}" ></form:field>
			
			
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