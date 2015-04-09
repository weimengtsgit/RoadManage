<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<!-- BEGIN FORM-->
	<form id="mall_shop_form_1"  class="form-horizontal " method="post" action="${ctx}/mall/shop/save" class="form-horizontal" enctype="multipart/form-data" >
	<!-- BEGIN FORM BODY-->
	<div class="form-body">
				<input type="hidden" name="id" value="${shop.id}" />
				<h5 class="form-section">基本信息</h5>
				<div class="row">
					<form:field name="name" label="商铺名称" value="${shop.name}" totalWidth="6" required="true" attrs="minlength=2 maxlength=32"> </form:field>
					<form:field name="shortName" label="商铺简称" value="${shop.shortName}" totalWidth="6" required="true" attrs="minlength=2 maxlength=5"> </form:field>
					<form:field  label="一级分类"  useBody="true"  attrs="" totalWidth="6"   >
						<input class="form-control select2" required="true" name="class1.id" type="hidden" value="${shop.class1.id}" display-value="${shop.class1.name}" result-field="name"   lookup-url="${ctx}/mall/shopClass/listJSON?filter_EQI_level=1" filter="filter_LIKES_name" />
					</form:field>
					<form:field  label="二级分类"   useBody="true"  attrs="" totalWidth="6"   >
						<input class="form-control select2" required  name="class2.id" type="hidden" value="${shop.class2.id}" display-value="${shop.class2.name}" result-field="name"   lookup-url="${ctx}/mall/shopClass/listJSON?filter_EQI_level=2" filter="filter_LIKES_name" />
					</form:field>
				</div>
				<div class="row">
					<form:field name="hotline" label="客服内部编码" value="${shop.hotline}"  totalWidth="6" attrs="maxlength=8"></form:field>
<%-- 				 	<form:field name="recomment" label="推荐指数" value="${shop.recomment}"  totalWidth="6" attrs="maxlength=11"></form:field> --%>
				 
					<input type="hidden" value="${shop.recomment}" name="recomment" > 
					<input type="hidden" value="${shop.sn}" name="sn" > 
				 	<input type="hidden" value="${shop.priority}" name="priority" > 
				</div>
				<form:field name="intro" label="商铺介绍"  fwidth="10"  lwidth="2"  value="${shop.intro}" type="textarea" required="true" attrs='rows="3" maxlength=1000'></form:field>
				<h5 class="form-section">联系方式</h5>
				<div class="row">
					
					<form:field name="contact" label="联系人" value="${shop.contact}"  totalWidth="6" attrs="maxlength=12"></form:field>
					<form:field name="phone" label="电话" value="${shop.phone}"  totalWidth="6" attrs="maxlength=15"></form:field>
				</div>
				<div class="row">
					
					<form:field name="weixin" label="微信公众号码" value="${shop.weixin}"  totalWidth="6" attrs="maxlength=40"></form:field>
				</div>
				
				<h5 class="form-section">位置信息</h5>
				<div class="row">
					
					<form:field  label="所属商场" type="hidden" value="${shop.mall.id}" required="true" useBody="true"  totalWidth="6">
						<input class="form-control select2" name="mall.id" type="hidden" required  value="${shop.mall.id}" display-value="${shop.mall.name}" result-field="name" result-formatter="mall_mall"  lookup-url="${ctx }/mall/mall/listJSON" filter="filter_LIKES_name" />
					</form:field>
					<form:field label="所在楼层" value="${shop.name}" required="true" useBody="true" totalWidth="6">
						<tag:enum name="floor"  cssClass="form-control select2me required"  enumKey="${shop.floor}" enumName="com_shop.floor" tagType="edit" />
					</form:field>
				</div>
				<div class="row">
					
					<form:field name="location" label="室内坐标" value="${shop.location}"   totalWidth="6" attrs="maxlength=4"></form:field>
					<form:field label="无线AP设备" value="${shop.device.id}" type="hidden" required="true" useBody="true"  totalWidth="6">
						<input  class="form-control select2" name="device.id" type="hidden" required="true"  value="${shop.device.id}" display-value="${shop.device.mac}" result-field="mac" result-formatter="mall_apDevice" lookup-url="${ctx }/mall/apDevice/listJSON" filter="filter_LIKES_mac" />	
					</form:field>
				</div>
				
				<h5 class="form-section">图片</h5>
					<div class="row">
						<form:field  label="商铺LOGO" value="" required="true" useBody="true" totalWidth="6">
							<form:img  width="100" height="100" name="logo" value="${shop.logo}" required="true"></form:img>
							<div class="help-block">
								 请上传像素尺寸为 200 * 200 的JPG、PNG图片。
							</div>	
						</form:field>
						<form:field label="商铺展示背景" value="" required="true" useBody="true" totalWidth="6">
							<form:img  width="200" height="100" name="image" value="${shop.image}" required="true"></form:img>
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
<!-- END FORM BODY-->
		
<!-- END FORM -->

<script type="text/javascript">

jQuery(document).ready(function() {
	FormSamples.init({
		formId:'mall_shop_form_1'
	});
	
});
</script>
