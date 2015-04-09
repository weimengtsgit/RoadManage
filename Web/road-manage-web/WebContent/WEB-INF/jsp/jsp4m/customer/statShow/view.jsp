<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form class="form-horizontal" role="form">
<div class="form-body">
		
		<form:field  type="p" label="终端mac" value="${statShow.termMac}" ></form:field>
		<form:field  type="p" label="AP设备MAC" value="${statShow.apMac}" ></form:field>
		<form:field  type="p" label="终端IP" value="${statShow.termIp}" ></form:field>
		<form:field  type="p" label="USER-AGENT" value="${statShow.userAgent}" ></form:field>
		<form:field  label="资源ID" useBody="true"  >
			<p class="form-control-static"><tag:enum tagType="view"  enumName="com_statShow_resourceId" enumKey="${statShow.resourceId}" /></p>
		</form:field>
			
		<form:field label="访问来源"  useBody="true"  >
			<p class="form-control-static"><tag:enum tagType="view"  enumName="com_statShow_accessType" enumKey="${statShow.accessType}" /></p>
		</form:field>	
		
		<form:field   label="访问时间" useBody="true"  >
			<p class="form-control-static">
			<fmt:formatDate value="${statShow.statTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>
			</p>
		</form:field>
		
</div>
