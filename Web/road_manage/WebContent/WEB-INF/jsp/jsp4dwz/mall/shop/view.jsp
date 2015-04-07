<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
		<input type="hidden" name="id" value="${shop.id}" />
		<div class="pageFormContent" layoutH="56">
		
		
			<dl>
				<dt>商铺名称：</dt>
				<dd>
					<input id="name" readonly="readonly" name="name" type="text" value="${shop.name}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>商场：</dt>
				<dd>
					<c:if test="${not empty shop.mall.name}">
						<a class="ghbutton search right" href="${ctx}/view?id=${shop.mall.id}" target="dialog" mask="true" title="查看商场详情">${shop.mall.name}</a>
					</c:if>
					<span class="info"></span>
				</dd>
			</dl>
			<div class="divider"></div>
		
			<dl>
				<dt>创建时间：</dt>
				
				<dd>
					<input id="createTime" readonly="readonly" name="createTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${shop.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>商铺编号：</dt>
				<dd>
					<input id="sn" readonly="readonly" name="sn" type="text" value="${shop.sn}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>联系人：</dt>
				<dd>
					<input id="contact" readonly="readonly" name="contact" type="text" value="${shop.contact}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>联系人电话：</dt>
				<dd>
					<input id="phone" readonly="readonly" name="phone" type="text" value="${shop.phone}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>商铺电话1：</dt>
				<dd>
					<input id="hotline1" readonly="readonly" name="hotline1" type="text" value="${shop.hotline1}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>商铺电话2：</dt>
				<dd>
					<input id="hotline2" readonly="readonly" name="hotline2" type="text" value="${shop.hotline2}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>商铺电话3：</dt>
				<dd>
					<input id="hotline3" readonly="readonly" name="hotline3" type="text" value="${shop.hotline3}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>商铺介绍：</dt>
				<dd>
					<input id="intro" readonly="readonly" name="intro" type="text" value="${shop.intro}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
				<dl class="nowrap">
				<dt>商铺LOGO：</dt>
				
				<dd>
					<img width="100px" height="100px" class="_flush"  name="logoAttachment.attachUri" flush="src" uri="${ctx}/mall/shop/attachmentDownload?attachmentName=${shop.logoAttachment.attachName}&attachmentUri=" src="${ctx}/mall/shop/attachmentDownload?attachmentName=${shop.logoAttachment.attachName}&attachmentUri=${shop.logoAttachment.attachUri}" />
				</dd>
		
				<dt>展示图片：</dt>
				
				<dd>
					<img width="100px" height="100px" class="_flush" name="imageAttachment.attachUri" flush="src" uri="${ctx}/mall/shop/attachmentDownload?attachmentName=${shop.imageAttachment.attachName}&attachmentUri=" src="${ctx}/mall/shop/attachmentDownload?attachmentName=${shop.imageAttachment.attachName}&attachmentUri=${shop.imageAttachment.attachUri}" />
				</dd>
			</dl>
			<div class="divider"></div>
		
			<dl>
				<dt>无线AP设备：</dt>
				<dd>
					<c:if test="${not empty shop.device.mac}">
						<a class="ghbutton search right" href="${ctx}/mall/apDevice/view?id=${shop.device.id}" target="dialog" mask="true" title="查看无线AP设备详情">${shop.device.mac}</a>
					</c:if>
					<span class="info"></span>
				</dd>
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
