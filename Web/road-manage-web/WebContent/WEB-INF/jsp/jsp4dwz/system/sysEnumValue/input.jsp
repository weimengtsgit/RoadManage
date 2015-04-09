<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/system/sysEnumValue/save?navTabId=system_sysEnumValue_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${sysEnumValue.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>枚举键(数据库值)：</dt>
				<dd><input class="required" id="enumKey" name="enumKey" type="text" value="${sysEnumValue.enumKey}" size="30"  maxlength=16 /></dd>
			</dl>
			<dl>
				<dt>枚举序列：</dt>
				<dd><input class="" id="enumSeq" name="enumSeq" type="text" value="${sysEnumValue.enumSeq}" size="30"  max=2147483647 maxlength=3 /></dd>
			</dl>
		
		<div class="divider"></div>
			<dl class="nowrap">
				<dt>枚举值(显示内容)：</dt>
				<dd><textarea class="required" id="enumVal" name="enumVal" rows="5" cols="80">${sysEnumValue.enumVal}</textarea></dd>
			</dl>
		
				<input id="system_enumId_enumDesc_input" type="hidden" class="required" name="enumId.id" value="${empty pid?sysEnumValue.enumId.id:pid}"/>
			
		
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
