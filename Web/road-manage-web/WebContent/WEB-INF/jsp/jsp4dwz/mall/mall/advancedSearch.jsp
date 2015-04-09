<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/mall/mall/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
	
	   		<div class="unit">
	   			<label>商场名称：</label>
	   			<input type="text" name="filter_LIKES_name" value="${pageData.filtraMap.LIKES_name}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>商场地址：</label>
	   			<input type="text" name="filter_LIKES_address" value="${pageData.filtraMap.LIKES_address}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>联系人：</label>
	   			<input type="text" name="filter_LIKES_contact" value="${pageData.filtraMap.LIKES_contact}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>电话：</label>
	   			<input type="text" name="filter_LIKES_phone" value="${pageData.filtraMap.LIKES_phone}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>商场介绍：</label>
	   			<input type="text" name="filter_LIKES_intro" value="${pageData.filtraMap.LIKES_intro}"/>
			</div>
			<div class="divider">divider</div>
	   		
			<div class="unit">
				<label>商场LOGO：</label>
				<input id="mall_logoAttachment_attachName_list" type="hidden" name="logoAttachment.id" value='' />
				<input type="text" name="filter_LIKES_logoAttachment.attachName" value='${pageData.filtraMap["LIKES_logoAttachment.attachName"]}' suggestFields="attachName" suggestUrl="${ctx}/attachment/attachment/lookupJson" lookupGroup="logoAttachment" />
				<a class="btnLook" href="${ctx}/attachment/attachment/lookupList" lookupGroup="logoAttachment" rel="/attachment/attachment/adsearchlookupList">查找带回</a>
			</div>
			<div class="divider">divider</div>
	   		
			<div class="unit">
				<label>商场展示背景：</label>
				<input id="mall_backgroudAttachment_attachName_list" type="hidden" name="backgroudAttachment.id" value='' />
				<input type="text" name="filter_LIKES_backgroudAttachment.attachName" value='${pageData.filtraMap["LIKES_backgroudAttachment.attachName"]}' suggestFields="attachName" suggestUrl="${ctx}/attachment/attachment/lookupJson" lookupGroup="backgroudAttachment" />
				<a class="btnLook" href="${ctx}/attachment/attachment/lookupList" lookupGroup="backgroudAttachment" rel="/attachment/attachment/adsearchlookupList">查找带回</a>
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
