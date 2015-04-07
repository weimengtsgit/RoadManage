<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
		<input type="hidden" name="id" value="${mall.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>商场名称：</dt>
				<dd>
					<input id="name" readonly="readonly" name="name" type="text" value="${mall.name}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>联系人：</dt>
				<dd>
					<input id="contact" readonly="readonly" name="contact" type="text" value="${mall.contact}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>电话：</dt>
				<dd>
					<input id="phone" readonly="readonly" name="phone" type="text" value="${mall.phone}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			
		
			<div class="divider"></div>
		
			<dl class="nowrap">
				<dt>商场LOGO：</dt>
				
				<dd>
					<input id="mall_logoAttachment_attachName_input" type="hidden" class="" name="logoAttachment.id" value="${mall.logoAttachment.id}"/>
					
					<img width="100px" height="100px" alt="" src="${ctx}/mall/mall/attachmentDownload?attachmentUri=${mall.logoAttachment.attachUri}&attachmentName=${mall.logoAttachment.attachName}">
					<span class="info"></span>	
				</dd>
			
				<dt>商场展示背景：</dt>
				
				<dd>
					<input id="mall_backgroudAttachment_attachName_input" type="hidden" class="" name="backgroudAttachment.id" value="${mall.backgroudAttachment.id}"/>
					<img width="100px" height="100px" alt="" src="${ctx}/mall/mall/attachmentDownload?attachmentUri=${mall.backgroudAttachment.attachUri}&attachmentName=${mall.backgroudAttachment.attachName}">
					<span class="info"></span>	
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl class="nowrap">
				<dt>商场地址：</dt>
				<dd>
					<textarea readonly="readonly" id="address" cols="91" rows="5" width="480">${mall.address}</textarea>
				</dd>
				<span class="info"></span>
			</dl>
			<div class="divider"></div>
		
			<dl class="nowrap">
				<dt>商场介绍：</dt>
				<dd>
					<textarea readonly="readonly" id="intro" cols="91" rows="5" width="480">${mall.intro}</textarea>
				</dd>
				<span class="info"></span>
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
