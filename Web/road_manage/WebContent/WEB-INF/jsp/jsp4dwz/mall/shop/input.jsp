<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/mall/shop/save?navTabId=mall_shop_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${shop.id}" />
		<input type="hidden" name="shopUuid" value="${shop.shopUuid}" />
		<div class="pageFormContent" layoutH="56">
			<dl>
				<dt>商铺名称：</dt>
				<dd>
					<input class="" id="name" name="name" type="text" value="${shop.name}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			<c:if test="${curUser.userType == 2 }">
				<input id="mall_mall_name_input" type="hidden" class="" name="mall.id" value="1"/>
			</c:if>
			<c:if test="${curUser.userType != 2 }">
				<dl>
					<dt>所属商场：</dt>
					<dd>
						<input id="mall_mall_name_input" type="hidden" class="" name="mall.id" value="${shop.mall.id}"/>
						<input type="text" class="" size="24" name="mall.name" value="${shop.mall.name}" suggestFields="name" suggestUrl="${ctx}/lookupJson" lookupGroup="mall"  onchange="if(!this.value) document.getElementById('mall_mall_name_input').value=''" />
						<a class="btnLook" href="${ctx}/mall/mall/lookupList" lookupGroup="mall">查找带回</a>
						<span class="info"></span>		
					</dd>
				</dl>
			</c:if>
		
			
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>创建时间：</dt>
				
				<dd>
					<input id="createTime" name="createTime" type="text" class="date " dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${shop.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" d>
					<a class="inputDateButton" href="javascript:;">选择</a>
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>商铺编号：</dt>
				<dd>
					<input class="" id="sn" name="sn" type="text" value="${shop.sn}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>联系人：</dt>
				<dd>
					<input class="" id="contact" name="contact" type="text" value="${shop.contact}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>联系人电话：</dt>
				<dd>
					<input class="" id="phone" name="phone" type="text" value="${shop.phone}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>商铺电话1：</dt>
				<dd>
					<input class="" id="hotline1" name="hotline1" type="text" value="${shop.hotline1}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>商铺电话2：</dt>
				<dd>
					<input class="" id="hotline2" name="hotline2" type="text" value="${shop.hotline2}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>商铺电话3：</dt>
				<dd>
					<input class="" id="hotline3" name="hotline3" type="text" value="${shop.hotline3}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
			<div class="divider"></div>
		
		
			<dl class="nowrap">
				<dt>商铺LOGO：</dt>
				
				<dd>
					<input class="" id="logo" name="logo" type="hidden" backname="logoAttachment.attachUri" value="${shop.logo}"  />
					<input id="mall_logoAttachment_attachName_input" type="hidden" class="" name="logoAttachment.id" value="${shop.logoAttachment.id}"/>
					<img width="100px" height="100px" class="_flush"  name="logoAttachment.attachUri" flush="src" uri="${ctx}/mall/shop/attachmentDownload?attachmentName=${shop.logoAttachment.attachName}&attachmentUri=" src="${ctx}/mall/shop/attachmentDownload?attachmentName=${shop.logoAttachment.attachName}&attachmentUri=${shop.logoAttachment.attachUri}" />
					<a class="btnLook" alt="选择附件" href="${ctx}/mall/shop/attachmentView" lookupGroup="logoAttachment"></a>
					<span class="info"></span>	
				</dd>
		
				<dt>展示图片：</dt>
				
				<dd>
					<input class="" id="image" name="image" type="hidden" backname="imageAttachment.attachUri" value="${shop.image}"  />
					<input id="mall_imageAttachment_attachName_input" type="hidden" class="" name="imageAttachment.id" value="${shop.imageAttachment.id}"/>
					<img width="100px" height="100px" class="_flush" name="imageAttachment.attachUri" flush="src" uri="${ctx}/mall/shop/attachmentDownload?attachmentName=${shop.imageAttachment.attachName}&attachmentUri=" src="${ctx}/mall/shop/attachmentDownload?attachmentName=${shop.imageAttachment.attachName}&attachmentUri=${shop.imageAttachment.attachUri}" />
					<a class="btnLook" alt="选择附件" href="${ctx}/mall/shop/attachmentView" lookupGroup="imageAttachment"></a>
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>无线AP设备：</dt>
				<dd>
					<input id="mall_device_sn_input" type="hidden" class="" name="device.id" value="${shop.device.id}"/>
					<input type="text" class="required" size="24" name="device.mac" value="${shop.device.mac}" suggestFields="mac" suggestUrl="${ctx}/lookupJson" lookupGroup="device"  onchange="if(!this.value) document.getElementById('mall_device_sn_input').value=''" />
					<a class="btnLook" href="${ctx}/mall/apDevice/lookupList" lookupGroup="device">查找带回</a>
					<span class="info"></span>		
				</dd>
				
			</dl>
			<dl class="nowrap">
					<dt>优先级：</dt>
				<dd>
					<input class="required" id="priority" name="priority" type="text" value="${shop.priority}" size="30"  maxlength=30 />
					<span class="info">同一设备关联店铺的展示优先级</span>	
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl class="nowrap">
				<dt>商铺介绍：</dt>
				<dd>
					<textarea class="" id="intro" name="intro" cols="91" rows="5" width="480">${shop.intro}</textarea>
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
