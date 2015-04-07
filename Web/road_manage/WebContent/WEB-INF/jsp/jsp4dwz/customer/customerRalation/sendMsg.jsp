<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/customer/msgLog/save?navTabId=customer_customerRalation_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone,'确定要发送吗？');">
		<input type="hidden" name="ids" value="${ids}" />
		<div class="pageFormContent" layoutH="56">
		
			
			<dl class="nowrap">
				
					尊敬的顾客您好!
			</dl>
			<dl class="nowrap">
				
				<dd>
					<textarea class="" id="msgContent.id" name="msgContent.content" cols="91" rows="5" width="480" suggestFields="mobile" suggestUrl="${ctx}/mall/messageTemplate/lookupJson" lookupGroup="msgContent" ></textarea>
					
					<a class="btnLook" href="${ctx}/mall/messageTemplate/lookupList" lookupGroup="msgContent">短信模版</a>
					<span class="info"></span>		
				
			
				</dd>
			</dl>
			<dl class="nowrap">
				
					[世贸天阶 ${curUser.shop.name }]
			</dl>
			
		
			
		
			<div class="divider"></div>
		
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">发送</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
