<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/customer/customerRalation/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
			
			<div class="unit">
				<label>客户：</label>
				<input id="customer_customer_mobile_list" type="hidden" name="customer.id" value='' />
				<input type="text" name="filter_LIKES_customer.mobile" value='${pageData.filtraMap["LIKES_customer.mobile"]}' suggestFields="mobile" suggestUrl="${ctx}/lookupJson" lookupGroup="customer" />
				<a class="btnLook" href="${ctx}/lookupList" lookupGroup="customer" rel="/adsearchlookupList">查找带回</a>
			</div>
			<div class="divider">divider</div>
	   		
			<div class="unit">
				<label>终端：</label>
				<input id="customer_terminal_mac_list" type="hidden" name="terminal.id" value='' />
				<input type="text" name="filter_LIKES_terminal.mac" value='${pageData.filtraMap["LIKES_terminal.mac"]}' suggestFields="mac" suggestUrl="${ctx}/lookupJson" lookupGroup="terminal" />
				<a class="btnLook" href="${ctx}/lookupList" lookupGroup="terminal" rel="/adsearchlookupList">查找带回</a>
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
				<label>商场：</label>
				<input id="customer_mall_name_list" type="hidden" name="mall.id" value='' />
				<input type="text" name="filter_LIKES_mall.name" value='${pageData.filtraMap["LIKES_mall.name"]}' suggestFields="name" suggestUrl="${ctx}/mall/mall/lookupJson" lookupGroup="mall" />
				<a class="btnLook" href="${ctx}/mall/mall/lookupList" lookupGroup="mall" rel="/mall/mall/adsearchlookupList">查找带回</a>
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
				<label>是否收藏：</label>
				<tag:enum id="keep" inputType="select" defaultValue="" name="filter_EQS_keep" enumName="com_customerRalationType" enumKey="${pageData.filtraMap.EQS_keep}" />
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
