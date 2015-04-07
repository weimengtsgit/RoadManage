<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="枚举标识"  value="${sysEnum.enumName}" ></form:field>
		
			<form:field  name="enumDesc"  label="枚举名称"  value="${sysEnum.enumDesc}" type="textarea" attrs="rows='5'"  ></form:field>
			
		</div>
	</form>
