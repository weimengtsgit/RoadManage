<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/customer/customer/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
	
	   		<div class="unit">
	   			<label>手机号：</label>
	   			<input type="text" name="filter_LIKES_mobile" value="${pageData.filtraMap.LIKES_mobile}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>微信号：</label>
	   			<input type="text" name="filter_LIKES_weixin" value="${pageData.filtraMap.LIKES_weixin}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>QQ号：</label>
	   			<input type="text" name="filter_LIKES_qq" value="${pageData.filtraMap.LIKES_qq}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>VIP号：</label>
	   			<input type="text" name="filter_LIKES_vip" value="${pageData.filtraMap.LIKES_vip}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>车牌号：</label>
	   			<input type="text" name="filter_LIKES_carNum" value="${pageData.filtraMap.LIKES_carNum}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>年龄：</label>
				<input type="text" name="filter_EQI_age" value="${pageData.filtraMap.EQI_age}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
				<label>性别：</label>
				<tag:enum id="sex" inputType="select" defaultValue="" name="filter_EQS_sex" enumName="sex" enumKey="${pageData.filtraMap.EQS_sex}" />
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
	   			<label>密码：</label>
	   			<input type="text" name="filter_LIKES_password" value="${pageData.filtraMap.LIKES_password}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>兴趣爱好：</label>
	   			<input type="text" name="filter_LIKES_interest" value="${pageData.filtraMap.LIKES_interest}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>轨迹：</label>
				<input type="text" name="filter_EQI_trackId" value="${pageData.filtraMap.EQI_trackId}"/>
			</div>
			<div class="divider">divider</div>
	   		
			<div class="unit">
				<label>最近一次使用终端：</label>
				<input id="customer_lastUseTerm_mac_list" type="hidden" name="lastUseTerm.id" value='' />
				<input type="text" name="filter_LIKES_lastUseTerm.mac" value='${pageData.filtraMap["LIKES_lastUseTerm.mac"]}' suggestFields="mac" suggestUrl="${ctx}/customer/terminal/lookupJson" lookupGroup="lastUseTerm" />
				<a class="btnLook" href="${ctx}/customer/terminal/lookupList" lookupGroup="lastUseTerm" rel="/customer/terminal/adsearchlookupList">查找带回</a>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>账户余额：</label>
				<input type="text" name="filter_EQI_acctBalance" value="${pageData.filtraMap.EQI_acctBalance}"/>
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
