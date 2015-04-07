<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
		<input type="hidden" name="id" value="${attachment.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>附件名称：</dt>
				<dd><input id="attachName" readonly="readonly" name="attachName" type="text" value="${attachment.attachName}" size="30"  /></dd>
			</dl>
		
			<dl>
				<dt>附件ID：</dt>
				<dd><input id="attachId" readonly="readonly" name="attachId" type="text" value="${attachment.attachId}" size="30"  /></dd>
			</dl>
		
			<dl>
				<dt>附件资源：</dt>
				<dd><input id="attachUri" readonly="readonly" name="attachUri" type="text" value="${attachment.attachUri}" size="30"  /></dd>
			</dl>
		
			<dl class="nowrap">
				<dt>附件描述：</dt>
				<dd><textarea readonly="readonly" id="attachDes" cols="91" rows="5" width="480">${attachment.attachDes}</textarea></dd>
			</dl>
		
			<div class="divider"></div>
		</div>
		<div class="formBar">
			<ul>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div>
				</li>
			</ul>
		</div>
</div>
