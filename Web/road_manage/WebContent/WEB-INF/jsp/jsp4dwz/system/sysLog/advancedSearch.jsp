<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/system/sysLog/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
			
			<div class="unit">
				<label>用户：</label>
				<input id="system_logUser_username_list" type="hidden" name="logUser.id" value='' />
				<input type="text" name="filter_LIKES_logUser.name" value='${pageData.filtraMap["LIKES_logUser.name"]}' suggestFields="name" suggestUrl="${ctx}/system/sysUser/lookupJson" lookupGroup="logUser" />
				<a class="btnLook" href="${ctx}/system/sysUser/lookupList" lookupGroup="logUser">查找带回</a>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>用户所在IP：</label>
	   			<input type="text" name="filter_LIKES_logIp" value="${pageData.filtraMap.LIKES_logIp}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
				<label>登录类型：</label>
				<tag:enum id="logType" defaultValue="" name="filter_EQS_logType" enumName="logType" enumKey="${pageData.filtraMap.EQS_logType}" />
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
				<label>登录结果：</label>
				<tag:enum id="logResultType" defaultValue="" name="filter_EQS_logResultType" enumName="logResultType" enumKey="${pageData.filtraMap.EQS_logResultType}" />
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>登录时间：</label>
				<input id="logTime" name="filter_GED_logTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_logTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
			</div>
	   		<div class="unit">
	   			<label>至：</label>
				<input id="logTime" name="filter_LED_logTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_logTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
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
