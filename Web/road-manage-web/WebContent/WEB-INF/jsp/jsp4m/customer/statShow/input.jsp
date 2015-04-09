<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/customer/statShow/save?navTabId=customer_statShow_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${statShow.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>终端MAC：</dt>
				<dd>
					<input class="" id="termMac" name="termMac" type="text" value="${statShow.termMac}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>AP设备MAC：</dt>
				<dd>
					<input class="" id="apMac" name="apMac" type="text" value="${statShow.apMac}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>终端IP：</dt>
				<dd>
					<input class="" id="termIp" name="termIp" type="text" value="${statShow.termIp}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>USER-AGENT：</dt>
				<dd>
					<input class="" id="userAgent" name="userAgent" type="text" value="${statShow.userAgent}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>访问来源：</dt>
				<dd>
					<tag:enum id="accessType" inputType="select" defaultValue="" cssClass="" name="accessType" enumName="com_statShow_accessType" enumKey="${statShow.accessType}" />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>时间：</dt>
				
				<dd>
					<input id="statTime" name="statTime" type="text" class="date " dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${statShow.statTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" d>
					<a class="inputDateButton" href="javascript:;">选择</a>
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>资源ID：</dt>
				<dd>
					<input class="" id="resourceId" name="resourceId" type="text" value="${statShow.resourceId}" size="30"  max=2147483647 maxlength=30 />
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
