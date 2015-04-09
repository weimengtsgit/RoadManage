<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="配置名称"  value="${sysConfType.confName}" ></form:field>
		
			<form:field type="p" label="配置标识"  value="${sysConfType.confKey}" ></form:field>
		
			<form:field  name="confDes"  label="配置描述"  value="${sysConfType.confDes}" type="textarea" attrs="rows='5'"  ></form:field>
		
			<form:field type="p" label="list"  value="${sysConfType.list}" ></form:field>
			
		</div>
	</form>
