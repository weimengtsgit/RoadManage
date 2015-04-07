<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/customer/memberPromotion/save?navTabId=customer_memberPromotion_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${memberPromotion.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>会员：</dt>
				<dd>
					<input id="customer_customer_mobile_input" type="hidden" class="" name="customer.id" value="${memberPromotion.customer.id}"/>
					<input type="text" class="" size="24" name="customer.mobile" value="${memberPromotion.customer.mobile}" suggestFields="mobile" suggestUrl="${ctx}/lookupJson" lookupGroup="customer"  onchange="if(!this.value) document.getElementById('customer_customer_mobile_input').value=''" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="customer">查找带回</a>
					<span class="info"></span>		
				</dd>
			</dl>
		
			<dl>
				<dt>商场：</dt>
				<dd>
					<input id="customer_mall_name_input" type="hidden" class="" name="mall.id" value="${memberPromotion.mall.id}"/>
					<input type="text" class="" size="24" name="mall.name" value="${memberPromotion.mall.name}" suggestFields="name" suggestUrl="${ctx}/mall/mall/lookupJson" lookupGroup="mall"  onchange="if(!this.value) document.getElementById('customer_mall_name_input').value=''" />
					<a class="btnLook" href="${ctx}/mall/mall/lookupList" lookupGroup="mall">查找带回</a>
					<span class="info"></span>		
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>商铺：</dt>
				<dd>
					<input id="customer_shop_name_input" type="hidden" class="" name="shop.id" value="${memberPromotion.shop.id}"/>
					<input type="text" class="" size="24" name="shop.name" value="${memberPromotion.shop.name}" suggestFields="name" suggestUrl="${ctx}/lookupJson" lookupGroup="shop"  onchange="if(!this.value) document.getElementById('customer_shop_name_input').value=''" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="shop">查找带回</a>
					<span class="info"></span>		
				</dd>
			</dl>
		
			<dl>
				<dt>商铺优惠：</dt>
				<dd>
					<input id="customer_shopPromotion_intro_input" type="hidden" class="" name="shopPromotion.id" value="${memberPromotion.shopPromotion.id}"/>
					<input type="text" class="" size="24" name="shopPromotion.intro" value="${memberPromotion.shopPromotion.intro}" suggestFields="intro" suggestUrl="${ctx}/lookupJson" lookupGroup="shopPromotion"  onchange="if(!this.value) document.getElementById('customer_shopPromotion_intro_input').value=''" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="shopPromotion">查找带回</a>
					<span class="info"></span>		
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>验证码：</dt>
				<dd>
					<input class="" id="validation" name="validation" type="text" value="${memberPromotion.validation}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>状态：</dt>
				<dd>
					<input class="" id="status" name="status" type="text" value="${memberPromotion.status}" size="30"  maxlength=30 />
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
