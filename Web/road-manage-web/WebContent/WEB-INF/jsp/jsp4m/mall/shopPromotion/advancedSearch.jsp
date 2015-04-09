<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/mall/shopPromotion/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
			
			<div class="unit">
				<label>商铺：</label>
				<input id="mall_shop_name_list" type="hidden" name="shop.id" value='' />
				<input type="text" name="filter_LIKES_shop.name" value='${pageData.filtraMap["LIKES_shop.name"]}' suggestFields="name" suggestUrl="${ctx}/lookupJson" lookupGroup="shop" />
				<a class="btnLook" href="${ctx}/lookupList" lookupGroup="shop" rel="/adsearchlookupList">查找带回</a>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>优惠活动简介：</label>
	   			<input type="text" name="filter_LIKES_intro" value="${pageData.filtraMap.LIKES_intro}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>活动具体内容：</label>
	   			<input type="text" name="filter_LIKES_details" value="${pageData.filtraMap.LIKES_details}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>活动图片url：</label>
	   			<input type="text" name="filter_LIKES_image" value="${pageData.filtraMap.LIKES_image}"/>
			</div>
			<div class="divider">divider</div>
	   		
			<div class="unit">
				<label>活动图片：</label>
				<input id="mall_imageAttachment_attachName_list" type="hidden" name="imageAttachment.id" value='' />
				<input type="text" name="filter_LIKES_imageAttachment.attachName" value='${pageData.filtraMap["LIKES_imageAttachment.attachName"]}' suggestFields="attachName" suggestUrl="${ctx}/attachment/attachment/lookupJson" lookupGroup="imageAttachment" />
				<a class="btnLook" href="${ctx}/attachment/attachment/lookupList" lookupGroup="imageAttachment" rel="/attachment/attachment/adsearchlookupList">查找带回</a>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>开始展示时间：</label>
				<input id="beginTime" name="filter_GED_beginTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_beginTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
			</div>
	   		<div class="unit">
	   			<label>至：</label>
				<input id="beginTime" name="filter_LED_beginTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_beginTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>结束展示时间：</label>
				<input id="endTime" name="filter_GED_endTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_endTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
			</div>
	   		<div class="unit">
	   			<label>至：</label>
				<input id="endTime" name="filter_LED_endTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_endTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
				<label>审核状态：</label>
				<tag:enum id="auditStatus" inputType="select" defaultValue="" name="filter_EQS_auditStatus" enumName="shopAuditStatus" enumKey="${pageData.filtraMap.EQS_auditStatus}" />
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
				<label>状态：</label>
				<tag:enum id="status" inputType="select" defaultValue="" name="filter_EQS_status" enumName="promotionStatus" enumKey="${pageData.filtraMap.EQS_status}" />
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>审核失败原因：</label>
	   			<input type="text" name="filter_LIKES_auditRejectReason" value="${pageData.filtraMap.LIKES_auditRejectReason}"/>
			</div>
			<div class="divider">divider</div>
	   
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">开始查询</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="reset">清空重输</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
