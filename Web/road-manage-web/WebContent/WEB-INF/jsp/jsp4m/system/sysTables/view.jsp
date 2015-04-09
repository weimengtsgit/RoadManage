<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="名称"  value="${sysTables.tableName}" ></form:field>
		
			<form:field type="p" label="描述"  value="${sysTables.tableDesc}" ></form:field>
			
		</div>
	</form>
