<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/report/reportDay/save?navTabId=report_reportDay_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${reportDay.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>日期：</dt>
				
				<dd>
					<input id="date" name="date" type="text" class="date " dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${reportDay.date}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" d>
					<a class="inputDateButton" href="javascript:;">选择</a>
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>宣传页展示数(PV)：</dt>
				<dd>
					<input class="" id="pv" name="pv" type="text" value="${reportDay.pv}" size="30"  max=2147483647 maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>无线网络客流量（UV）：</dt>
				<dd>
					<input class="" id="uv" name="uv" type="text" value="${reportDay.uv}" size="30"  max=2147483647 maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>手机注册用户数：</dt>
				<dd>
					<input class="" id="newUserCount" name="newUserCount" type="text" value="${reportDay.newUserCount}" size="30"  max=2147483647 maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>商铺：</dt>
				<dd>
					<input id="report_shopId_name_input" type="hidden" class="" name="shopId.id" value="${reportDay.shopId.id}"/>
					<input type="text" class="" size="24" name="shopId.name" value="${reportDay.shopId.name}" suggestFields="name" suggestUrl="${ctx}/mall/shop/lookupJson" lookupGroup="shopId"  onchange="if(!this.value) document.getElementById('report_shopId_name_input').value=''" />
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
