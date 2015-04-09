<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/mall/messageTemplate/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
	
	   		<div class="unit">
	   			<label>模版名称：</label>
	   			<input type="text" name="filter_LIKES_name" value="${pageData.filtraMap.LIKES_name}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>模版内容：</label>
	   			<input type="text" name="filter_LIKES_content" value="${pageData.filtraMap.LIKES_content}"/>
			</div>
			<div class="divider">divider</div>
	   		
			<div class="unit">
				<label>所属商铺：</label>
				<input id="mall_shop_name_list" type="hidden" name="shop.id" value='' />
				<input type="text" name="filter_LIKES_shop.name" value='${pageData.filtraMap["LIKES_shop.name"]}' suggestFields="name" suggestUrl="${ctx}/mall/shop/lookupJson" lookupGroup="shop" />
				<a class="btnLook" href="${ctx}/mall/shop/lookupList" lookupGroup="shop" rel="/mall/shop/adsearchlookupList">查找带回</a>
			</div>
			<div class="divider">divider</div>
	   		
			<div class="unit">
				<label>所属商场：</label>
				<input id="mall_mall_name_list" type="hidden" name="mall.id" value='' />
				<input type="text" name="filter_LIKES_mall.name" value='${pageData.filtraMap["LIKES_mall.name"]}' suggestFields="name" suggestUrl="${ctx}/mall/mall/lookupJson" lookupGroup="mall" />
				<a class="btnLook" href="${ctx}/mall/mall/lookupList" lookupGroup="mall" rel="/mall/mall/adsearchlookupList">查找带回</a>
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
