<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/system/sysDept/save?navTabId=system_sysDept_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${sysDept.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>部门名称：</dt>
				<dd><input class="required regcheck" id="deptName" name="deptName" type="text" value="${sysDept.deptName}" size="30"  maxlength=32 /></dd>
			</dl>
		
			<dl>
				<dt>部门编号：</dt>
				<dd><input class="required regcheck" id="deptNum" name="deptNum" type="text" value="${sysDept.deptNum}" size="30"  maxlength=8 /></dd>
			</dl>
			<div class="divider"></div>
		
			<dl>
				<dt>部门地址：</dt>
				<dd><input class="" id="deptAddr regcheck" name="deptAddr" type="text" value="${sysDept.deptAddr}" size="30"  maxlength=64 /></dd>
			</dl>
		
			<dl>
				<dt>上级部门：</dt>
				<input id="system_parentId_deptName_input" type="hidden" class="" name="parentId.id" value="${sysDept.parentId.id}"/>
				<input type="text" class="" size="24" name="parentId.deptName" value="${sysDept.parentId.deptName}" suggestFields="deptName" suggestUrl="${ctx}/system/sysDept/lookupJson" lookupGroup="parentId"  onchange="if(!this.value) document.getElementById('system_parentId_deptName_input').value=''" />
				<a class="btnLook" href="${ctx}/system/sysDept/lookupList" lookupGroup="parentId">查找带回</a>		
			</dl>
			<div class="divider"></div>
		
			<dl class="nowrap">
				<dt>部门描述：</dt>
				<dd>
				<textarea class="" id="deptDesc" name="deptDesc" cols="91" rows="5" width="480" maxlength="256">${sysDept.deptDesc}</textarea>
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
