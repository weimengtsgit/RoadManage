<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form class="form-horizontal">
		<!-- BEGIN FORM BODY-->
		<div class="form-body">
		<form:field type="p" label="模版名称" name="name" value="${messageTemplate.name}"  attrs="maxlength=30"></form:field>
		
			
		<form:field label="模版内容"  type="textarea" name="content" value="${messageTemplate.content}" attrs="maxlength=200"></form:field>
		</div>
	</form>
