<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_mall_apDevice_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/mall/apDevice/save" class="form-horizontal" >
	
		<div class="form-body">
			<input type="hidden" name="id" value="${apDevice.id}" />
			
			<form:field name="mac" label="设备mac" value="${apDevice.mac}" required="true" fwidth="5" attrs="mac=true"></form:field>
			<form:field name="ip" label="设备IP" value="${apDevice.ip}" required="true" fwidth="5" attrs="ipv4=true"></form:field>
			<form:field name="sn" label="设备出厂SN" value="${apDevice.sn}"  fwidth="5" attrs="maxlength=32"></form:field>
			<form:field name="mall.id" label="所属商场" type="hidden" value="${shop.mall.id}" required="true" useBody="true"  fwidth="5">
				<input class="form-control select2" name="mall.id" type="hidden" required="true"  value="${apDevice.mall.id}" display-value="${apDevice.mall.name}" result-field="name" result-formatter="mall_mall"  lookup-url="${ctx }/mall/mall/listJSON" filter="filter_LIKES_name" />
			</form:field>
			<form:field name="location" label="设备位置" value="${apDevice.location}"  fwidth="5" attrs="maxlength=24"></form:field>
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
