<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form class="form-horizontal" role="form">
	<div class="form-body">
		<form:field name="" label="用户" value="${sysLog.logUser.name}" type="p"   fwidth="6" ></form:field>
		<form:field name="" label="登录IP" value="${sysLog.logIp}" type="p"  fwidth="6" ></form:field>
		<form:field name="" label="登录类型" value="" useBody="true" fwidth="6" >
			<p class="form-control-static"><tag:enum isTag="false" id="logType" defaultValue="" name="logType" enumName="logType" enumKey="${sysLog.logType}" /></p>
		</form:field>
		<form:field name="" label="登录结果" value="" useBody="true" fwidth="6" >
			<p class="form-control-static"><tag:enum isTag="false" id="logResultType" defaultValue="" name="logResultType" enumName="logResultType" enumKey="${sysLog.logResultType}" /></p>
		</form:field>
		<form:field name="" label="登录时间" value="" useBody="true" fwidth="6" >
			<p class="form-control-static"><fmt:formatDate value="${sysLog.logTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></p>
		</form:field>
	</div>
</form>
