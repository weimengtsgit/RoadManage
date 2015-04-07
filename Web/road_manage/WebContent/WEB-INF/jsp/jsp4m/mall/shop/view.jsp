<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>

	<!-- BEGIN FORM-->
	<form  class="form-horizontal">
	
	<div class="form-body">
			<input type="hidden" name="id" value="${shop.id}" />
				<h5 class="form-section">基本信息</h5>
				<div class="row">
					<form:field name="name" label="商铺名称" value="${shop.name}" type="p"   totalWidth="6"></form:field>
					<form:field name="name" label="商铺简称" value="${shop.shortName}" type="p"   totalWidth="6"></form:field>
				</div>
				<div class="row">
					<form:field  label="一级分类" value="${shop.class1.name}" type="p"     totalWidth="6"></form:field>
					<form:field  label="二级分类" value="${shop.class2.name}" type="p"     totalWidth="6"></form:field>
				</div>
				<div class="row">
					<form:field name="name" label="客服内部编码" value="${shop.name}" type="p"     totalWidth="6"></form:field>
					<form:field name="sn" label="商铺编号" value="${shop.sn}"  type="p"    totalWidth="6"></form:field>
				</div>
				
				<div class="row">
				 	<form:field name="recomment" label="推荐指数" value="${shop.recomment}"  type="p"     totalWidth="6" useBody="true">
				 	<form:star value="${shop.recomment}"></form:star>
				 	</form:field>
<%-- 				 	<form:field name="priority" label="优先级" value="${shop.priority}"  type="p"    totalWidth="6"></form:field> --%>
				</div>
				
				<div class="row">
					<form:field name="intro" label="商铺介绍" lwidth="2" fwidth="10" totalWidth="12"  value="${shop.intro}" type="textarea"   attrs=' class="form-control" rows="3" '></form:field>
				</div>
				
				<h5 class="form-section">联系方式</h5>
				<div class="row">
					
					<form:field name="contact" label="联系人" value="${shop.contact}"  type="p"    totalWidth="6"></form:field>
					<form:field name="phone" label="电话" value="${shop.phone}"  type="p"    totalWidth="6"></form:field>
				</div>
				<div class="row">
					
					<form:field name="weixin" label="微信公众号码" value="${shop.weixin}" type="p"     totalWidth="6"></form:field>
				</div>
				
				<h5 class="form-section">位置信息</h5>
				<div class="row">
					<form:field name="mall.id" label="所属商场"  value="${shop.mall.name}" type="p"    totalWidth="6"></form:field>
					<form:field name="floor" label="所在楼层"   useBody="true" totalWidth="6">
						<p class="form-control-static">
						<tag:enum name="floor"    enumKey="${shop.floor}" enumName="com_shop.floor" tagType="view" />
						</p>
					</form:field>
				</div>
				<div class="row">
					<form:field name="location" label="室内坐标" value="${shop.location}" type="p"      totalWidth="6"></form:field>
					<form:field name="device.id" label="无线AP设备" value="${shop.device.mac}" type="p"     totalWidth="6">
					</form:field>
				</div>
				
				<h5 class="form-section">图片</h5>
					
					<div class="row">
						<form:field name="" label="商铺LOGO" value="${shop.device.id}" type="hidden"  useBody="true"  totalWidth="6">
							<p class="form-control-static"><img src="${sysbaseConfig_image_url_prefix }/${shop.logo }" alt="" width="100" height="100" /></p>
						</form:field>
						<form:field name="" label="商铺展示背景" value="" type="hidden"  useBody="true"  totalWidth="6">
							<p class="form-control-static"><img src="${sysbaseConfig_image_url_prefix }/${shop.image }" alt="" width="200" height="100" /></p>							
						</form:field>
						
					</div>
			

	</div>
	</form>
<!-- END FORM BODY-->
		
<!-- END FORM -->