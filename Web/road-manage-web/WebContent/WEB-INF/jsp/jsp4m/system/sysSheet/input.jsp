<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_system_sysSheet_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/system/sysSheet/save" class="form-horizontal" >
		<div class="form-body">
			<input type="hidden" name="id" value="${sysSheet.id}" />
			<form:field name="tableName" attrs="required" label="基础表名"  value="${sysSheet.tableName}" ></form:field>
		
			<form:field  label="分表周期"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="cycle" attrs="required"  enumName="sheetCycle" inputType="radio"   enumKey="${sysSheet.cycle}"/>
			</form:field>
			
		
			<form:field  label="起始时间"  useBody="true"  >
			<div class="input-group date form_datetime">                                       
				<input type="text" class="form-control" name=startTime required value="<fmt:formatDate value="${sysSheet.startTime}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-btn">
				<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
				</span>
				</div>
			</form:field>
			
			
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