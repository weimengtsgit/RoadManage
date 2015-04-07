<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/report/reportFresh/save?navTabId=report_reportFresh_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${reportFresh.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>统计项：</dt>
				<dd>
					<tag:enum id="type" inputType="select" defaultValue="" cssClass="" name="type" enumName="com_reportFresh_type" enumKey="${reportFresh.type}" />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>数量：</dt>
				<dd>
					<input class="" id="count" name="count" type="text" value="${reportFresh.count}" size="30"  max=2147483647 maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>商铺：</dt>
				<dd>
					<input id="report_shopId_name_input" type="hidden" class="" name="shopId.id" value="${reportFresh.shopId.id}"/>
					<input type="text" class="" size="24" name="shopId.name" value="${reportFresh.shopId.name}" suggestFields="name" suggestUrl="${ctx}/mall/shop/lookupJson" lookupGroup="shopId"  onchange="if(!this.value) document.getElementById('report_shopId_name_input').value=''" />
					<a class="btnLook" href="${ctx}/mall/shop/lookupList" lookupGroup="shopId">查找带回</a>
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
