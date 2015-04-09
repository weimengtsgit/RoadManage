<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/system/sysMenu/save?navTabId=system_sysMenu_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${sysMenu.id}" />
		<input type="hidden" name="target" value="${sysMenu.target}" />
		<input type="hidden" name="icon" value="${sysMenu.icon}" />
		<input type="hidden" name="summary" value="${sysMenu.summary}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>菜单类型：</dt>
				<dd><tag:enum id="menuType" inputType="select" defaultValue="" cssClass="required" name="menuType" enumName="menuType" enumKey="${sysMenu.menuType}" /></dd>
			</dl>
		
			<dl>
				<dt>菜单序列：</dt>
				<dd><input class="" id="menuSeq" name="menuSeq" type="text" value="${sysMenu.menuSeq}" size="30"  max=2147483647 maxlength=3 /></dd>
			</dl>
		<div class="divider"></div>
			<dl>
				<dt>是否IFRAME：</dt>
				<dd><tag:enum id="external" inputType="select" defaultValue="" cssClass="" name="external" enumName="isOrNot" enumKey="${sysMenu.external}" /></dd>
			</dl>
		
			<dl>
				<dt>是否可用：</dt>
				<dd><tag:enum id="enabled" inputType="radio"  cssClass="required" name="enabled" enumName="isOrNot" enumKey="${sysMenu.enabled}" /></dd>
			</dl>
		<div class="divider"></div>
			<dl>
				<dt>上级菜单：</dt>
				<input id="system_parentId_menuDesc_input" type="hidden" class="" name="parentId.id" value="${sysMenu.parentId.id}"/>
				<input type="text" class="" size="24" name="parentId.menuDesc" value="${sysMenu.parentId.menuDesc}" suggestFields="menuDesc" suggestUrl="${ctx}/system/sysMenu/lookupJson" lookupGroup="parentId"  onchange="if(!this.value) document.getElementById('system_parentId_menuDesc_input').value=''" />
				<a class="btnLook" href="${ctx}/system/sysMenu/lookupList" lookupGroup="parentId">查找带回</a>		
			</dl>
			
		
			<dl class="nowrap">
				<dt>菜单名称：</dt>
				<dd>
					<textarea class="required" id="menuDesc" name="menuDesc" cols="91" rows="5" width="480">${sysMenu.menuDesc}</textarea>
				</dd>
			</dl>
		<div class="divider"></div>
			<dl class="nowrap">
				<dt>菜单URL：</dt>
				<dd>
					<textarea class="" id="menuName" name="menuName" cols="91" rows="5" width="480">${sysMenu.menuName}</textarea>
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
