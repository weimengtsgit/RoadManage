<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/report/reportHour/save?navTabId=report_reportHour_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${reportHour.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>日期：</dt>
				
				<dd>
					<input id="date" name="date" type="text" class="date " dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${reportHour.date}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" d>
					<a class="inputDateButton" href="javascript:;">选择</a>
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>时段：</dt>
				<dd>
					<input class="" id="time" name="time" type="text" value="${reportHour.time}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>在线用户数：</dt>
				<dd>
					<input class="" id="onlineUserCount" name="onlineUserCount" type="text" value="${reportHour.onlineUserCount}" size="30"  max=2147483647 maxlength=30 />
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
