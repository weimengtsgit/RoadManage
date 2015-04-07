<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/mall/messageTemplate/save?navTabId=mall_messageTemplate_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${messageTemplate.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl class="nowrap">
				<dt>模版名称：</dt>
				<dd>
					<input class="" id="name" name="name" type="text" value="${messageTemplate.name}" size="30"  maxlength=20 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<c:if test="${curUser.userType == 2 }">
				<input id="mall_mall_name_input" type="hidden" class="" name="mall.id" value="${curUser.mall.id}"/>
			</c:if>
			<c:if test="${curUser.userType == 3 }">
				<input id="mall_shop_name_input" type="hidden" class="" name="shop.id" value="${curUser.shop.id}"/>
			</c:if>
		
		
			<c:if test="${curUser.userType == 1 }">
				<dl>
					<dt>所属商铺：</dt>
					<dd>
						<input id="mall_shop_name_input" type="hidden" name="shop.id" value="${messageTemplate.shop.id}"/>
						<input type="text" class="required" size="24" name="shop.name" value="${messageTemplate.shop.name}" suggestFields="name" suggestUrl="${ctx}/mall/shop/lookupJson" lookupGroup="shop"  onchange="if(!this.value) document.getElementById('mall_shop_name_input').value=''" />
						<a class="btnLook" href="${ctx}/mall/shop/lookupList" lookupGroup="shop">查找带回</a>
						<span class="info"></span>		
					</dd>
				</dl>
			
			
				<dl>
					<dt>所属商场：</dt>
					<dd>
						<input id="mall_mall_name_input" type="hidden"name="mall.id" value="${messageTemplate.mall.id}"/>
						<input type="text" class="required" size="24" name="mall.name" value="${messageTemplate.mall.name}" suggestFields="name" suggestUrl="${ctx}/mall/mall/lookupJson" lookupGroup="mall"  onchange="if(!this.value) document.getElementById('mall_mall_name_input').value=''" />
						<a class="btnLook" href="${ctx}/mall/mall/lookupList" lookupGroup="mall">查找带回</a>
						<span class="info"></span>		
					</dd>
				</dl>
			</c:if>
		
			<div class="divider"></div>
		
			<dl class="nowrap">
				<dt>模版内容：</dt>
				<dd>
					<textarea class="" id="content" name="content" cols="91" rows="5" width="480">${messageTemplate.content}</textarea>
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
