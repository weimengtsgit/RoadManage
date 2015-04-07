<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form class="form-horizontal" role="form">
<div class="form-body">
	<form:field name="name" label="商场名称" value="${mall.name}" type="p" lwidth="2" fwidth="10"></form:field>	
	<div class="row">
	<form:field name="contact" label="联系人" value="${mall.contact}" type="p" totalWidth="6"></form:field>
	<form:field name="phone" label="电话" value="${mall.phone}" type="p" totalWidth="6"></form:field>
	</div>
	<form:field name="address" label="商场地址" value="${mall.address}" type="textarea" attrs="rows='2'"  fwidth="10" lwidth="2"></form:field>
	<form:field name="intro" label="商场介绍" value="${mall.intro}" type="textarea" attrs="rows='5'" fwidth="10" lwidth="2"></form:field>
	
	<div class="row">
	<form:field name="" label="商场LOGO" value=""  useBody="true" totalWidth="6">
		<p class="form-control-static"><img src="${sysbaseConfig_image_url_prefix }/${mall.logo }" alt="" width="100" height="100" /></p>
	</form:field>
	<form:field name="" label="商场展示背景" value="" useBody="true" totalWidth="6">
		<p class="form-control-static"><img src="${sysbaseConfig_image_url_prefix }/${mall.background }" alt=""  width="200" height="100" /></p>
	</form:field>
	<div class="row">
</div>
</form>
	
	

