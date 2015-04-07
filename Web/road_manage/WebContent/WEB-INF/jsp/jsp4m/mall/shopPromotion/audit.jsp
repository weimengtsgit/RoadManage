<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form id="mall_shopPromotion_form_1" method="post" action="${ctx}/mall/shopPromotion/save" class="form-horizontal" enctype="multipart/form-data">
		<!-- BEGIN FORM BODY-->
		<div class="form-body">
			<input type="hidden" name="id" value="${shopPromotion.id}" />
			<input type="hidden" name="uuid" value="${shopPromotion.uuid}" />
			<input   name="shop.id" type="hidden" value="${shopPromotion.shop.id}"  />
			
			
			<div class="form-group">
				<label  class="col-md-3 control-label">优惠活动简介:<span class="required">*</span></label>
				<div class="col-md-9">
					<input class="form-control" name="intro" type="text" value="${shopPromotion.intro}" required  maxlength=32 />
				</div>
			</div>
					<div class="form-group">
						<label  class="col-md-3 control-label">活动时间:</label>
						<div class="col-md-9">
							<div class="input-group date-picker input-daterange"  data-date-format="yyyy-mm-dd">
								<input required="true" type="text" class="form-control" name="beginTime" value="<fmt:formatDate value="${ shopPromotion.beginTime}" pattern="yyyy-MM-dd"/>">
								<span class="input-group-btn">
								<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
								</span>
								<span class="input-group-addon">至</span>
								<input required="true" type="text" class="form-control" name="endTime" value="<fmt:formatDate value="${ shopPromotion.endTime}" pattern="yyyy-MM-dd"/>">
								<span class="input-group-btn">
								<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
								</span>
							</div>
						</div>
					</div>
				
					<div class="form-group">
						<label  class="col-md-3 control-label">活动状态:</label>
						<div class="col-md-9">
							<tag:enum name="status" enumName="promotionStatus" inputType="radio" defaultValue="${shopPromotion.status }"/>
							
						</div>
					</div>
			<form:field name="" label="活动图片" value="" required="true" useBody="true" >
				<form:img  width="200" height="100" name="image" value="${shopPromotion.image}" required="true"></form:img>
				<div class="help-block">
					 请上传像素尺寸为 300 * 105 的JPG、PNG图片。
				</div>	
			</form:field>
			
			
			<input  type="hidden"  value="${shopPromotion.sort}"  name="sort"  />
		
			<div class="form-group">
					<label  class="col-md-3 control-label">活动具体内容:</label>
					<div class="col-md-9">
						<textarea required="true" class="form-control" maxlength=1000 name="details" rows="5" >${shopPromotion.details}</textarea>
					</div>
			</div>
			
					<div class="form-group">
						<label  class="col-md-3 control-label">审核状态:</label>
						<div class="col-md-9">
							<tag:enum name="auditStatus" enumName="shopAuditStatus" inputType="radio" />
						</div>
					</div>
		
			<div class="form-group">
					<label  class="col-md-3 control-label">审核拒绝原因:</label>
					<div class="col-md-9">
						<textarea  class="form-control" maxlength=1000 name="auditRejectReason" rows="5" ></textarea>
					</div>
			</div>
		
		</div>
		
	<div class="form-actions right">
<%-- 		<a class="btn blue" href="${ctx}/mall/shopPromotion/preView"  data-handler="MODAL" modal-simple="true" modal-size="345px" data-title="预览" ><span>预览</span></a> --%>
		<button type="button" class="btn default remove">取消</button>
		<button type="submit" class="btn blue"><i class="fa fa-check"></i> 确认</button>
	</div>
	</form>
<script type="text/javascript">
jQuery(document).ready(function() {
	FormSamples.init({
		formId:'mall_shopPromotion_form_1'
	});
});
</script>