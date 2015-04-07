<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>

<form id="mall_mall_form_1" method="post" action="${ctx}/mall/mall/save" class="form-horizontal" enctype="multipart/form-data">
	<div class="form-body">
		<input type="hidden" name="id" value="${mall.id}" />
		<input type="hidden" name="mallId" value="${mall.mallId}" />
		<form:field name="name" label="商场名称" value="${mall.name}" required="true" lwidth="2" fwidth="10"></form:field>
		
		<div class="row">
		<form:field name="shortName" label="商场简称" value="${mall.shortName}" required="true"  attrs=" maxlength=5" totalWidth="6"></form:field>
		<form:field  label="是否微信注册"  useBody="true" totalWidth="6" >
				<tag:enum name="enableWeixinLogin" enumName="switch_type" inputType="radio" defaultValue="${mall.enableWeixinLogin }" />
		</form:field>
		</div>
		<div class="row">
		<form:field name="contact" label="联系人" value="${mall.contact}"  totalWidth="6"></form:field>
		<form:field name="phone" label="电话" value="${mall.phone}"   totalWidth="6"></form:field>
		</div>
		<form:field name="address" label="商场地址" value="${mall.address}" type="textarea" attrs="rows='2' maxlength=500" required="true" fwidth="10" lwidth="2"></form:field>
		<form:field name="intro" label="商场介绍" value="${mall.intro}" type="textarea" attrs="rows='5' maxlength=1000" required="true" fwidth="10" lwidth="2"></form:field>
		<div class="row">
		<form:field name="" label="商场LOGO" value="" required="true" useBody="true" totalWidth="6">
			<form:img  width="100" height="100" name="logo" value="${mall.logo}" required="true"></form:img>
			<div class="help-block">
				 请上传像素尺寸为 200 * 200 的JPG、PNG图片。
			</div>	
		</form:field>
		<form:field name="" label="商场展示背景" value="" required="true" useBody="true" totalWidth="6">
			<form:img  width="200" height="100" name="background" value="${mall.background}" required="true"></form:img>
			<div class="help-block">
				 请上传像素尺寸为 300 * 105 的JPG、PNG图片。
			</div>	
		</form:field>
		</div>

</div>
	<div class="form-actions right">
		<button type="button" class="btn default remove">取消</button>
		<button type="submit" class="btn blue"><i class="fa fa-check"></i> 确认</button>
	</div>
	</form>
		
<script type="text/javascript">
jQuery(document).ready(function() {
	FormSamples.init({
		formId:'mall_mall_form_1'
	});
	
});
</script>
