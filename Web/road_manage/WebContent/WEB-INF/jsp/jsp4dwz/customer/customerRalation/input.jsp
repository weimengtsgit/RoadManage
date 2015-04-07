<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/customer/customerRalation/save?navTabId=customer_customerRalation_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${customerRalation.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>客户：</dt>
				<dd>
					<input id="customer_customer_mobile_input" type="hidden" class="" name="customer.id" value="${customerRalation.customer.id}"/>
					<input type="text" class="" size="24" name="customer.mobile" value="${customerRalation.customer.mobile}" suggestFields="mobile" suggestUrl="${ctx}/lookupJson" lookupGroup="customer"  onchange="if(!this.value) document.getElementById('customer_customer_mobile_input').value=''" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="customer">查找带回</a>
					<span class="info"></span>		
				</dd>
			</dl>
		
			<dl>
				<dt>终端：</dt>
				<dd>
					<input id="customer_terminal_mac_input" type="hidden" class="" name="terminal.id" value="${customerRalation.terminal.id}"/>
					<input type="text" class="" size="24" name="terminal.mac" value="${customerRalation.terminal.mac}" suggestFields="mac" suggestUrl="${ctx}/lookupJson" lookupGroup="terminal"  onchange="if(!this.value) document.getElementById('customer_terminal_mac_input').value=''" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="terminal">查找带回</a>
					<span class="info"></span>		
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>商铺：</dt>
				<dd>
					<input id="customer_shop_name_input" type="hidden" class="" name="shop.id" value="${customerRalation.shop.id}"/>
					<input type="text" class="" size="24" name="shop.name" value="${customerRalation.shop.name}" suggestFields="name" suggestUrl="${ctx}/lookupJson" lookupGroup="shop"  onchange="if(!this.value) document.getElementById('customer_shop_name_input').value=''" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="shop">查找带回</a>
					<span class="info"></span>		
				</dd>
			</dl>
		
			<dl>
				<dt>商场：</dt>
				<dd>
					<input id="customer_mall_name_input" type="hidden" class="" name="mall.id" value="${customerRalation.mall.id}"/>
					<input type="text" class="" size="24" name="mall.name" value="${customerRalation.mall.name}" suggestFields="name" suggestUrl="${ctx}/mall/mall/lookupJson" lookupGroup="mall"  onchange="if(!this.value) document.getElementById('customer_mall_name_input').value=''" />
					<a class="btnLook" href="${ctx}/mall/mall/lookupList" lookupGroup="mall">查找带回</a>
					<span class="info"></span>		
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>创建时间：</dt>
				
				<dd>
					<input id="createTime" name="createTime" type="text" class="date " dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${customerRalation.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" d>
					<a class="inputDateButton" href="javascript:;">选择</a>
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>是否收藏：</dt>
				<dd>
					<tag:enum id="keep" inputType="select" defaultValue="" cssClass="" name="keep" enumName="com_customerRalationType" enumKey="${customerRalation.keep}" />
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
