<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form id="mall_mallPromotion_form_1" method="post" action="${ctx}/mall/mallPromotion/save" class="form-horizontal" enctype="multipart/form-data">
		<!-- BEGIN FORM BODY-->
		<div class="form-body">
			<input type="hidden" name="id" value="${mallPromotion.id}" />
			<input type="hidden" name="uuid" value="${mallPromotion.uuid}" />
			<c:if test="${curUser.userType == 2 }">
				<input id="mall_mall_name_input" type="hidden" class="" name="mall.id" value="1"/>
			</c:if>
			<c:if test="${curUser.userType != 2 }">
				<div class="form-group">
					<label  class="col-md-3 control-label">所属商场:<span class="required">*</span></label>
					<div class="col-md-9">
						<input required class="form-control select2 " name="mall.id" type="hidden" value="${mallPromotion.mall.id}" display-value="${mallPromotion.mall.name}" result-field="name" result-formatter="mall_mall"  lookup-url="${ctx }/mall/mall/listJSON" filter="filter_LIKES_name" />
					</div>
				</div>
			</c:if>
			
			
			<div class="form-group">
				<label  class="col-md-3 control-label">优惠活动简介:<span class="required">*</span></label>
				<div class="col-md-9">
					<input class="form-control"  name="intro" type="text" value="${mallPromotion.intro}" required  maxlength=30 />
				</div>
			</div>
					<div class="form-group">
						<label  class="col-md-3 control-label">活动时间:<span class="required">*</span></label>
						<div class="col-md-9">
							<div class="input-group input-large date-picker input-daterange"  data-date-format="yyyy-mm-dd">
								<input  required type="text" class="form-control" name="beginTime" value="<fmt:formatDate value="${ mallPromotion.beginTime}" pattern="yyyy-MM-dd"/>">
								<span class="input-group-addon"> <i class="glyphicon glyphicon-resize-horizontal"></i> </span>
								<input required type="text" class="form-control" name="endTime" value="<fmt:formatDate value="${ mallPromotion.endTime}" pattern="yyyy-MM-dd"/>">
							</div>
						</div>
					</div>
				
					<div class="form-group">
						<label  class="col-md-3 control-label">活动状态:</label>
						<div class="col-md-9">
							<tag:enum name="status" enumName="promotionStatus" inputType="radio" defaultValue="${mallPromotion.status }"/>
										
						</div>
					</div>
			<form:field name="" label="活动图片" value="" required="true" useBody="true" >
				<form:img  width="200" height="100" name="image" value="${mallPromotion.image}" required="true"></form:img>
				<div class="help-block">
					 请上传像素尺寸为 300 * 105 的JPG、PNG图片。
				</div>	
			</form:field>
			<form:field name="" label="活动图片（大）" value="" required="true" useBody="true" >
				<form:img  width="200" height="200" name="imageBig" value="${mallPromotion.imageBig}" required="true"></form:img>
				<div class="help-block">
					 请上传像素尺寸为 300 * 1000 的JPG、PNG图片。
				</div>	
			</form:field>
			
			<input  type="hidden"  value="${mallPromotion.sort}"  name="sort"  />
		
			<div class="form-group">
					<label  class="col-md-3 control-label">活动具体内容:<span class="required">*</span></label>
					<div class="col-md-9">
						<textarea required maxlength=1000 class="form-control"  name="details" rows="5" >${mallPromotion.details}</textarea>
					</div>
			</div>
		
		</div>
		
	<div class="form-actions right">
<%-- 		<a class="btn blue" href="${ctx}/mall/mallPromotion/preView"  data-handler="MODAL" modal-simple="true" modal-size="345px" data-title="预览" ><span>预览</span></a> --%>
		<button type="button" class="btn default remove">取消</button>
		<button type="submit" class="btn blue"><i class="fa fa-check"></i> 确认</button>
	</div>
	</form>
<script type="text/javascript">
jQuery(document).ready(function() {
	FormSamples.init({
		formId:'mall_mallPromotion_form_1'
	});
});
</script>