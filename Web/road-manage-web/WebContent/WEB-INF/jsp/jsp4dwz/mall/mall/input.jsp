<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/mall/mall/save?navTabId=mall_mall_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${mall.id}" />
		<input type="hidden" name="mallId" value="${mall.mallId}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>商场名称：</dt>
				<dd>
					<input class="" id="name" name="name" type="text" value="${mall.name}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>联系人：</dt>
				<dd>
					<input class="" id="contact" name="contact" type="text" value="${mall.contact}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>电话：</dt>
				<dd>
					<input class="" id="phone" name="phone" type="text" value="${mall.phone}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			
			
		
			<div class="divider"></div>
			<dl class="nowrap">
				<dt>商场LOGO：</dt>
				
				<dd>
					<input id="mall_logoAttachment_attachName_input" type="hidden" class="" name="logoAttachment.id" value="${mall.logoAttachment.id}"/>
					<input  type="hidden" class="" backname="logoAttachment.attachUri"  name="logo" value="${mall.logo}"/>
					<img class="_flush" name="logoAttachment.attachUri" flush="src" width="100px" height="100px" alt="" uri="${ctx}/mall/mall/attachmentDownload?attachmentUri=" src="${ctx}/mall/mall/attachmentDownload?attachmentUri=${mall.logoAttachment.attachUri}">
					<a href="${ctx}/mall/mall/attachmentView" lookupGroup="logoAttachment">选择附件</a>
					<span class="info"></span>	
				</dd>
			
				<dt>商场展示背景：</dt>
				
				<dd>
					<input id="mall_backgroudAttachment_attachName_input" type="hidden" class="" name="backgroudAttachment.id" value="${mall.backgroudAttachment.id}"/>
					<input  type="hidden" class="" backname="backgroudAttachment.attachUri" name="background" value="${mall.background}"/>
					<img class="_flush" name="backgroudAttachment.attachUri" flush="src" width="100px" height="100px" alt="" uri="${ctx}/mall/mall/attachmentDownload?attachmentUri=" src="${ctx}/mall/mall/attachmentDownload?attachmentUri=${mall.backgroudAttachment.attachUri}">
					<a href="${ctx}/mall/mall/attachmentView" lookupGroup="backgroudAttachment">选择附件</a>
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl class="nowrap">
				<dt>商场地址：</dt>
				<dd>
					<textarea class="" id="address" name="address" cols="91" rows="5" width="480">${mall.address}</textarea>
					<span class="info"></span>	
				</dd>
			</dl>
			<div class="divider"></div>
		
			<dl class="nowrap">
				<dt>商场介绍：</dt>
				<dd>
					<textarea class="" id="intro" name="intro" cols="91" rows="5" width="480">${mall.intro}</textarea>
					<span class="info"></span>	
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
