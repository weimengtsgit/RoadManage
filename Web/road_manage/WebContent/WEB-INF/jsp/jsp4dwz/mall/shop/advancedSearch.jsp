<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/mall/shop/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
			
			<div class="unit">
				<label>商场：</label>
				<input id="mall_mall_name_list" type="hidden" name="mall.id" value='' />
				<input type="text" name="filter_LIKES_mall.name" value='${pageData.filtraMap["LIKES_mall.name"]}' suggestFields="name" suggestUrl="${ctx}/lookupJson" lookupGroup="mall" />
				<a class="btnLook" href="${ctx}/lookupList" lookupGroup="mall" rel="/adsearchlookupList">查找带回</a>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>商铺名称：</label>
	   			<input type="text" name="filter_LIKES_name" value="${pageData.filtraMap.LIKES_name}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>创建时间：</label>
				<input id="createTime" name="filter_GED_createTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_createTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
			</div>
	   		<div class="unit">
	   			<label>至：</label>
				<input id="createTime" name="filter_LED_createTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_createTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>商铺编号：</label>
	   			<input type="text" name="filter_LIKES_sn" value="${pageData.filtraMap.LIKES_sn}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>联系人：</label>
	   			<input type="text" name="filter_LIKES_contact" value="${pageData.filtraMap.LIKES_contact}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>联系人电话：</label>
	   			<input type="text" name="filter_LIKES_phone" value="${pageData.filtraMap.LIKES_phone}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>商铺电话1：</label>
	   			<input type="text" name="filter_LIKES_hotline1" value="${pageData.filtraMap.LIKES_hotline1}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>商铺电话2：</label>
	   			<input type="text" name="filter_LIKES_hotline2" value="${pageData.filtraMap.LIKES_hotline2}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>商铺电话3：</label>
	   			<input type="text" name="filter_LIKES_hotline3" value="${pageData.filtraMap.LIKES_hotline3}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>商铺介绍：</label>
	   			<input type="text" name="filter_LIKES_intro" value="${pageData.filtraMap.LIKES_intro}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>商铺LOGO：</label>
	   			<input type="text" name="filter_LIKES_logo" value="${pageData.filtraMap.LIKES_logo}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>展示图片：</label>
	   			<input type="text" name="filter_LIKES_image" value="${pageData.filtraMap.LIKES_image}"/>
			</div>
			<div class="divider">divider</div>
	   		
			<div class="unit">
				<label>商铺LOGO：</label>
				<input id="mall_logoAttachment_attachName_list" type="hidden" name="logoAttachment.id" value='' />
				<input type="text" name="filter_LIKES_logoAttachment.attachName" value='${pageData.filtraMap["LIKES_logoAttachment.attachName"]}' suggestFields="attachName" suggestUrl="${ctx}/attachment/attachment/lookupJson" lookupGroup="logoAttachment" />
				<a class="btnLook" href="${ctx}/attachment/attachment/lookupList" lookupGroup="logoAttachment" rel="/attachment/attachment/adsearchlookupList">查找带回</a>
			</div>
			<div class="divider">divider</div>
	   		
			<div class="unit">
				<label>展示图片：</label>
				<input id="mall_imageAttachment_attachName_list" type="hidden" name="imageAttachment.id" value='' />
				<input type="text" name="filter_LIKES_imageAttachment.attachName" value='${pageData.filtraMap["LIKES_imageAttachment.attachName"]}' suggestFields="attachName" suggestUrl="${ctx}/attachment/attachment/lookupJson" lookupGroup="imageAttachment" />
				<a class="btnLook" href="${ctx}/attachment/attachment/lookupList" lookupGroup="imageAttachment" rel="/attachment/attachment/adsearchlookupList">查找带回</a>
			</div>
			<div class="divider">divider</div>
	   		
			<div class="unit">
				<label>无线AP设备：</label>
				<input id="mall_device_attachName_list" type="hidden" name="device.id" value='' />
				<input type="text" name="filter_LIKES_device.attachName" value='${pageData.filtraMap["LIKES_device.attachName"]}' suggestFields="attachName" suggestUrl="${ctx}/lookupJson" lookupGroup="device" />
				<a class="btnLook" href="${ctx}/lookupList" lookupGroup="device" rel="/adsearchlookupList">查找带回</a>
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
