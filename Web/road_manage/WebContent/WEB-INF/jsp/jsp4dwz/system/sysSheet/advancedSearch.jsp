<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/system/sysSheet/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
	
	   		<div class="unit">
	   			<label>基础表名：</label>
	   			<input type="text" name="filter_LIKES_tableName" value="${pageData.filtraMap.LIKES_tableName}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
				<label>分表周期：</label>
				<tag:enum id="cycle" inputType="select" defaultValue="" name="filter_EQS_cycle" enumName="sheetCycle" enumKey="${pageData.filtraMap.EQS_cycle}" />
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>起始时间：</label>
				<input id="startTime" name="filter_GED_startTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_startTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
			</div>
	   		<div class="unit">
	   			<label>至：</label>
				<input id="startTime" name="filter_LED_startTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_startTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
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
