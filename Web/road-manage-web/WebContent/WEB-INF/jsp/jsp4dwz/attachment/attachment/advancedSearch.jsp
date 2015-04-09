<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/attachment/attachment/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
	
	   		<div class="unit">
	   			<label>附件名称：</label>
	   			<input type="text" name="filter_LIKES_attachName" value="${pageData.filtraMap.LIKES_attachName}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>附件描述：</label>
	   			<input type="text" name="filter_LIKES_attachDes" value="${pageData.filtraMap.LIKES_attachDes}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>附件ID：</label>
	   			<input type="text" name="filter_LIKES_attachId" value="${pageData.filtraMap.LIKES_attachId}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>附件资源：</label>
	   			<input type="text" name="filter_LIKES_attachUri" value="${pageData.filtraMap.LIKES_attachUri}"/>
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
