<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/customer/memberPromotion/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
			
			<div class="unit">
				<label>会员：</label>
				<input id="customer_customer_mobile_list" type="hidden" name="customer.id" value='' />
				<input type="text" name="filter_LIKES_customer.mobile" value='${pageData.filtraMap["LIKES_customer.mobile"]}' suggestFields="mobile" suggestUrl="${ctx}/lookupJson" lookupGroup="customer" />
				<a class="btnLook" href="${ctx}/lookupList" lookupGroup="customer" rel="/adsearchlookupList">查找带回</a>
			</div>
			<div class="divider">divider</div>
	   		
			<div class="unit">
				<label>商场：</label>
				<input id="customer_mall_name_list" type="hidden" name="mall.id" value='' />
				<input type="text" name="filter_LIKES_mall.name" value='${pageData.filtraMap["LIKES_mall.name"]}' suggestFields="name" suggestUrl="${ctx}/mall/mall/lookupJson" lookupGroup="mall" />
				<a class="btnLook" href="${ctx}/mall/mall/lookupList" lookupGroup="mall" rel="/mall/mall/adsearchlookupList">查找带回</a>
			</div>
			<div class="divider">divider</div>
	   		
			<div class="unit">
				<label>商铺：</label>
				<input id="customer_shop_name_list" type="hidden" name="shop.id" value='' />
				<input type="text" name="filter_LIKES_shop.name" value='${pageData.filtraMap["LIKES_shop.name"]}' suggestFields="name" suggestUrl="${ctx}/lookupJson" lookupGroup="shop" />
				<a class="btnLook" href="${ctx}/lookupList" lookupGroup="shop" rel="/adsearchlookupList">查找带回</a>
			</div>
			<div class="divider">divider</div>
	   		
			<div class="unit">
				<label>商铺优惠：</label>
				<input id="customer_shopPromotion_intro_list" type="hidden" name="shopPromotion.id" value='' />
				<input type="text" name="filter_LIKES_shopPromotion.intro" value='${pageData.filtraMap["LIKES_shopPromotion.intro"]}' suggestFields="intro" suggestUrl="${ctx}/lookupJson" lookupGroup="shopPromotion" />
				<a class="btnLook" href="${ctx}/lookupList" lookupGroup="shopPromotion" rel="/adsearchlookupList">查找带回</a>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>验证码：</label>
	   			<input type="text" name="filter_LIKES_validation" value="${pageData.filtraMap.LIKES_validation}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>状态：</label>
				<input type="text" name="filter_EQS_status" value="${pageData.filtraMap.EQS_status}"/>
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
