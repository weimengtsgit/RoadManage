<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
		<input type="hidden" name="id" value="${reportHour.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>日期：</dt>
				
				<dd>
					<input id="date" readonly="readonly" name="date" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${reportHour.date}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>时段：</dt>
				<dd>
					<input id="time" readonly="readonly" name="time" type="text" value="${reportHour.time}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>在线用户数：</dt>
				<dd>
					<input id="onlineUserCount" readonly="readonly" name="onlineUserCount" type="text" value="${reportHour.onlineUserCount}" size="30"  />
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
