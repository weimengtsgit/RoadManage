<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/attachment/attachment/save?navTabId=attachment_attachment_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${attachment.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>附件名称：</dt>
				<dd><input class="" id="attachName" name="attachName" type="text" value="${attachment.attachName}" size="30"  maxlength=30 /></dd>
			</dl>
		
			<dl>
				<dt>附件ID：</dt>
				<dd><input class="" id="attachId" name="attachId" type="text" value="${attachment.attachId}" size="30"  maxlength=30 /></dd>
			</dl>
		
			<dl>
				<dt>附件资源：</dt>
				<dd><input class="" id="attachUri" name="attachUri" type="text" value="${attachment.attachUri}" size="30"  maxlength=30 /></dd>
			</dl>
		
			<dl class="nowrap">
				<dt>附件描述：</dt>
				<dd>
					<textarea class="" id="attachDes" name="attachDes" cols="91" rows="5" width="480">${attachment.attachDes}</textarea>
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
