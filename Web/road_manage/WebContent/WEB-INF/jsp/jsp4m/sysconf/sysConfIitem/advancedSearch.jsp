<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/sysconf/sysConfIitem/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
			
			<div class="unit">
				<label>配置类型：</label>
				<input id="sysconf_confType_confName_list" type="hidden" name="confType.id" value='' />
				<input type="text" name="filter_LIKES_confType.confName" value='${pageData.filtraMap["LIKES_confType.confName"]}' suggestFields="confName" suggestUrl="${ctx}/lookupJson" lookupGroup="confType" />
				<a class="btnLook" href="${ctx}/lookupList" lookupGroup="confType">查找带回</a>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>配置项名称：</label>
	   			<input type="text" name="filter_LIKES_itemName" value="${pageData.filtraMap.LIKES_itemName}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>配置项key：</label>
	   			<input type="text" name="filter_LIKES_itemKey" value="${pageData.filtraMap.LIKES_itemKey}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>配置项值：</label>
	   			<input type="text" name="filter_LIKES_itemValue" value="${pageData.filtraMap.LIKES_itemValue}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
				<label>值类型：</label>
				<tag:enum id="valueType" inputType="select" defaultValue="" name="filter_EQS_valueType" enumName="sys_conf_value_type" enumKey="${pageData.filtraMap.EQS_valueType}" />
			</div>
			<div class="divider">divider</div>
	   		
			<div class="unit">
				<label>值枚举类型：</label>
				<input id="sysconf_enumType_enumDesc_list" type="hidden" name="enumType.id" value='' />
				<input type="text" name="filter_LIKES_enumType.enumDesc" value='${pageData.filtraMap["LIKES_enumType.enumDesc"]}' suggestFields="enumDesc" suggestUrl="${ctx}/system/sysEnum/lookupJson" lookupGroup="enumType" />
				<a class="btnLook" href="${ctx}/system/sysEnum/lookupList" lookupGroup="enumType">查找带回</a>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>配置项描述：</label>
	   			<input type="text" name="filter_LIKES_des" value="${pageData.filtraMap.LIKES_des}"/>
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
