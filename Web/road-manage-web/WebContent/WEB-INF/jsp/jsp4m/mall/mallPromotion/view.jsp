<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form class="form-horizontal" >
		<!-- BEGIN FORM BODY-->
		<div class="form-body">
			<c:if test="${curUser.userType != 2 }">
				<div class="form-group">
					<label  class="col-md-3 control-label">所属商场:</label>
					<div class="col-md-9">
					<p class="form-control-static">${mallPromotion.mall.name}</p>
					</div>
				</div>
			</c:if>
			
			
			<div class="form-group">
				<label  class="col-md-3 control-label">优惠活动简介:</label>
				<div class="col-md-9">
					<p class="form-control-static">${mallPromotion.intro}</p>
				</div>
			</div>
			<div class="row ">
				<div class="col-md-9 ">
					<div class="form-group">
						<label  class="col-md-4 control-label">活动时间:</label>
						<div class="col-md-8">
								<p class="form-control-static"><fmt:formatDate value="${ mallPromotion.beginTime}" pattern="yyyy-MM-dd"/>
								至
								<fmt:formatDate value="${ mallPromotion.endTime}" pattern="yyyy-MM-dd"/></p>
						</div>
					</div>
				</div>
				
				<div class="col-md-3 ">
					<div class="form-group">
						<label  class="col-md-5 control-label">活动状态:</label>
						<div class="col-md-7">
						<p class="form-control-static">
							<tag:enum tagType="view" enumName="promotionStatus" enumKey="${mallPromotion.status}" />
						</p>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
					<label  class="col-md-3 control-label">活动图片:</label>
					<div class="col-md-9">
					<p class="form-control-static">
						<img width="200" height="100"  src="${sysbaseConfig_image_url_prefix }/${mallPromotion.image }" alt="" />
					</p>			
					</div>
			</div>
			
			
			<input  type="hidden"  value="${mallPromotion.sort}"  name="sort"  />
		
			<div class="form-group">
					<label  class="col-md-3 control-label">活动具体内容:</label>
					<div class="col-md-9">
					<p class="form-control-static">
						<textarea class="form-control"   rows="13" >${mallPromotion.details}</textarea>
						</p>
					</div>
			</div>
		
		</div>
		
	
	</form>
