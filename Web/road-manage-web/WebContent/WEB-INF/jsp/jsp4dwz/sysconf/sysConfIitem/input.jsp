<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/sysconf/sysConfIitem/save?navTabId=sysconf_sysConfIitem_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${sysConfIitem.id}" />
		<div class="pageFormContent" layoutH="56">
		
				<input id="sysconf_confType_confName_input" type="hidden" class="" name="confType.id" value="${empty pid ? sysConfIitem.confType.id:pid}"/>
			
		
			<dl>
				<dt>配置项名称：</dt>
				<dd><input class="required" id="itemName" name="itemName" type="text" value="${sysConfIitem.itemName}" size="30"  maxlength=30 /></dd>
			</dl>
			<dl>
				<dt>值类型：</dt>
				<dd><tag:enum id="valueType" inputType="select" defaultValue="" cssClass="" name="valueType" enumName="sys_conf_value_type" enumKey="${sysConfIitem.valueType}" /></dd>
			</dl>
		<div class="divider"></div>
			<dl>
				<dt>配置项key：</dt>
				<dd><input class="required" id="itemKey" name="itemKey" type="text" <c:if test="${sysConfIitem.itemKey != null}">readonly="readonly"</c:if> value="${sysConfIitem.itemKey}" size="30"  maxlength=30 /></dd>
			</dl>
			<dl>
				<dt>值枚举类型：</dt>
				<input id="sysconf_enumType_enumDesc_input" type="hidden" class="" name="enumType.id" value="${sysConfIitem.enumType.id}"/>
				<input type="text" class="" size="24" name="enumType.enumDesc" value="${sysConfIitem.enumType.enumDesc}" suggestFields="enumDesc" suggestUrl="${ctx}/system/sysEnum/lookupJson" lookupGroup="enumType"  onchange="if(!this.value) document.getElementById('sysconf_enumType_enumDesc_input').value=''" />
				<a class="btnLook" href="${ctx}/system/sysEnum/lookupList" lookupGroup="enumType">查找带回</a>		
			</dl>
		
		<div class="divider"></div>
			
		<div class="divider"></div>		
			<dl class="nowrap">
				<dt>配置项描述：</dt>
				<dd>
					<textarea class="" id="des" name="des" cols="91" rows="5" width="480">${sysConfIitem.des}</textarea>
				</dd>
			</dl>
		
			<div class="divider"></div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
