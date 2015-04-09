<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form class="form-horizontal" role="form">
<div class="form-body">
	<div class="row ">
		<form:field name="" label="用户" value="${sysOperLog.operUser.name}" type="p"  lwidth="4"  fwidth="8" totalWidth="6" ></form:field>
		<form:field name="" label="用户IP" value="${sysOperLog.ip}" type="p"  lwidth="4"  fwidth="8" totalWidth="6"></form:field>
	</div>
	<div class="row ">
		<form:field name="" label="操作动作" value="${sysOperLog.operAction}" type="p"  lwidth="4"  fwidth="8" totalWidth="6"></form:field>
		<form:field name="" label="操作模块" value="${sysOperLog.operModule}" type="p"  lwidth="4"  fwidth="8" totalWidth="6"></form:field>
	</div>
	<div class="row ">
		<form:field name="" label="操作内容" value="" useBody="true"  lwidth="2" fwidth="10" totalWidth="12">
			<pre class=”prettyprint linenums Lang-js”>${sysOperLog.operContent}</pre>
		</form:field>
	</div>
</div>
</form>
