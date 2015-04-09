<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/mall/shopPromotion/save?navTabId=mall_shopPromotion_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${shopPromotion.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>商铺：</dt>
				<dd>
					<input id="mall_shop_name_input" type="hidden" class="" name="shop.id" value="${shopPromotion.shop.id}"/>
					<input type="text" class="" size="24" name="shop.name" value="${shopPromotion.shop.name}" suggestFields="name" suggestUrl="${ctx}/lookupJson" lookupGroup="shop"  onchange="if(!this.value) document.getElementById('mall_shop_name_input').value=''" />
					<a class="btnLook" href="${ctx}/mall/shop/lookupList" lookupGroup="shop">查找带回</a>
					<span class="info"></span>		
				</dd>
			</dl>
		
			<dl>
				<dt>优惠活动简介：</dt>
				<dd>
					<input class="" id="intro" name="intro" type="text" value="${shopPromotion.intro}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			
				
			<dl class="nowrap">
				<dt>活动图片：</dt>
				
				<dd>
					<input class="" id="image" name="image" type="hidden" value="${shopPromotion.image}"  />
					<input id="mall_imageAttachment_attachName_input" type="hidden" class="" name="imageAttachment.id" value="${shopPromotion.imageAttachment.id}"/>
					<img width="100px" height="100px" class="_flush" name="imageAttachment.attachUri" flush="src" uri="${ctx}/mall/shopPromotion/attachmentDownload?attachmentName=${shopPromotion.imageAttachment.attachName}&attachmentUri=" src="${ctx}/mall/shopPromotion/attachmentDownload?attachmentName=${shopPromotion.imageAttachment.attachName}&attachmentUri=${shopPromotion.imageAttachment.attachUri}" >
					<a class="btnLook" alt="选择附件" href="${ctx}/mall/shopPromotion/attachmentView" lookupGroup="imageAttachment"></a>
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>开始展示时间：</dt>
				
				<dd>
					<input id="beginTime" name="beginTime" type="text" class="date " dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${shopPromotion.beginTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" d>
					<a class="inputDateButton" href="javascript:;">选择</a>
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>结束展示时间：</dt>
				
				<dd>
					<input id="endTime" name="endTime" type="text" class="date " dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${shopPromotion.endTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" d>
					<a class="inputDateButton" href="javascript:;">选择</a>
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>审核状态：</dt>
				<dd>
					<tag:enum id="auditStatus" inputType="select" defaultValue="" cssClass="" name="auditStatus" enumName="shopAuditStatus" enumKey="${shopPromotion.auditStatus}" />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl class="nowrap">
				<dt>活动具体内容：</dt>
				<dd>
					<textarea class="" id="details" name="details" cols="91" rows="5" width="480">${shopPromotion.details}</textarea>
					<span class="info"></span>	
				</dd>
			</dl>
			<div class="divider"></div>
		
			<dl class="nowrap">
				<dt>审核失败原因：</dt>
				<dd>
					<textarea class="" id="auditRejectReason" name="auditRejectReason" cols="91" rows="5" width="480">${shopPromotion.auditRejectReason}</textarea>
					<span class="info"></span>	
				</dd>
			</dl>
			<div class="divider"></div>
		
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
