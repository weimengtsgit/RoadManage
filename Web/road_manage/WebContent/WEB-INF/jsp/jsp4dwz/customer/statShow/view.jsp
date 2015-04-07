<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
		<input type="hidden" name="id" value="${statShow.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>终端MAC：</dt>
				<dd>
					<input id="termMac" readonly="readonly" name="termMac" type="text" value="${statShow.termMac}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>AP设备MAC：</dt>
				<dd>
					<input id="apMac" readonly="readonly" name="apMac" type="text" value="${statShow.apMac}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>终端IP：</dt>
				<dd>
					<input id="termIp" readonly="readonly" name="termIp" type="text" value="${statShow.termIp}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>USER-AGENT：</dt>
				<dd>
					<input id="userAgent" readonly="readonly" name="userAgent" type="text" value="${statShow.userAgent}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>访问来源：</dt>
				<dd>
					<tag:enum tagType="view"   enumName="com_statShow_accessType" enumKey="${statShow.accessType}" />
				</dd>
				<span class="info"></span>
			</dl>
		
			<dl>
				<dt>时间：</dt>
				
				<dd>
					<input id="statTime" readonly="readonly" name="statTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${statShow.statTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>资源ID：</dt>
				<dd>
					<input id="resourceId" readonly="readonly" name="resourceId" type="text" value="${statShow.resourceId}" size="30"  />
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
