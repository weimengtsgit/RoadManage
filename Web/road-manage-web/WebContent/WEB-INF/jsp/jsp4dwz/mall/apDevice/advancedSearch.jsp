<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/mall/apDevice/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
			
			<div class="unit">
				<label>商场：</label>
				<input id="mall_mall_name_list" type="hidden" name="mall.id" value='' />
				<input type="text" name="filter_LIKES_mall.name" value='${pageData.filtraMap["LIKES_mall.name"]}' suggestFields="name" suggestUrl="${ctx}/mall/mall/lookupJson" lookupGroup="mall" />
				<a class="btnLook" href="${ctx}/mall/mall/lookupList" lookupGroup="mall" rel="/mall/mall/adsearchlookupList">查找带回</a>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>AP MAC：</label>
	   			<input type="text" name="filter_LIKES_mac" value="${pageData.filtraMap.LIKES_mac}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>设备位置：</label>
	   			<input type="text" name="filter_LIKES_location" value="${pageData.filtraMap.LIKES_location}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>设备IP：</label>
	   			<input type="text" name="filter_LIKES_ip" value="${pageData.filtraMap.LIKES_ip}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>设备详细描述：</label>
	   			<input type="text" name="filter_LIKES_description" value="${pageData.filtraMap.LIKES_description}"/>
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
	   			<label>设备出厂SN：</label>
	   			<input type="text" name="filter_LIKES_sn" value="${pageData.filtraMap.LIKES_sn}"/>
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
