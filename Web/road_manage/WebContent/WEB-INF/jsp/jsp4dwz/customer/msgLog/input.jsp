<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/customer/msgLog/save?navTabId=customer_msgLog_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${msgLog.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>商铺：</dt>
				<dd>
					<input id="customer_shop_name_input" type="hidden" class="" name="shop.id" value="${msgLog.shop.id}"/>
					<input type="text" class="" size="24" name="shop.name" value="${msgLog.shop.name}" suggestFields="name" suggestUrl="${ctx}/lookupJson" lookupGroup="shop"  onchange="if(!this.value) document.getElementById('customer_shop_name_input').value=''" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="shop">查找带回</a>
					<span class="info"></span>		
				</dd>
			</dl>
		
			<dl>
				<dt>商场：</dt>
				<dd>
					<input id="customer_mall_name_input" type="hidden" class="" name="mall.id" value="${msgLog.mall.id}"/>
					<input type="text" class="" size="24" name="mall.name" value="${msgLog.mall.name}" suggestFields="name" suggestUrl="${ctx}/mall/mall/lookupJson" lookupGroup="mall"  onchange="if(!this.value) document.getElementById('customer_mall_name_input').value=''" />
					<a class="btnLook" href="${ctx}/mall/mall/lookupList" lookupGroup="mall">查找带回</a>
					<span class="info"></span>		
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>手机号：</dt>
				<dd>
					<input class="" id="mobile" name="mobile" type="text" value="${msgLog.mobile}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>发送时间：</dt>
				
				<dd>
					<input id="msgTime" name="msgTime" type="text" class="date " dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${msgLog.msgTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" d>
					<a class="inputDateButton" href="javascript:;">选择</a>
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl class="nowrap">
				<dt>短信内容：</dt>
				<dd>
					<textarea class="" id="msgContent" name="msgContent" cols="91" rows="5" width="480">${msgLog.msgContent}</textarea>
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
