<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/sysconf/sysConfType/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
	
	   		<div class="unit">
	   			<label>配置名称：</label>
	   			<input type="text" name="filter_LIKES_confName" value="${pageData.filtraMap.LIKES_confName}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>配置描述：</label>
	   			<input type="text" name="filter_LIKES_confDes" value="${pageData.filtraMap.LIKES_confDes}"/>
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
