<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/customer/userLog/save?navTabId=customer_userLog_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${userLog.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>终端MAC：</dt>
				<dd>
					<input class="" id="termMac" name="termMac" type="text" value="${userLog.termMac}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>认证名：</dt>
				<dd>
					<input class="" id="authName" name="authName" type="text" value="${userLog.authName}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>终端IP：</dt>
				<dd>
					<input class="" id="termIp" name="termIp" type="text" value="${userLog.termIp}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>AP设备MAC：</dt>
				<dd>
					<input class="" id="apMac" name="apMac" type="text" value="${userLog.apMac}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>上线时间：</dt>
				
				<dd>
					<input id="onlineTime" name="onlineTime" type="text" class="date " dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${userLog.onlineTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" d>
					<a class="inputDateButton" href="javascript:;">选择</a>
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>下线时间：</dt>
				
				<dd>
					<input id="offlineTime" name="offlineTime" type="text" class="date " dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${userLog.offlineTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" d>
					<a class="inputDateButton" href="javascript:;">选择</a>
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>上网总时长(秒)：</dt>
				<dd>
					<input class="" id="totalTime" name="totalTime" type="text" value="${userLog.totalTime}" size="30"  max=2147483647 maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>上网总流量(MB)：</dt>
				<dd>
					<input class="" id="totalFlow" name="totalFlow" type="text" value="${userLog.totalFlow}" size="30"  max=2147483647 maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>费用：</dt>
				<dd>
					<input class="" id="totalFee" name="totalFee" type="text" value="${userLog.totalFee}" size="30"  max=2147483647 maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>唯一标识：</dt>
				<dd>
					<input class="" id="sessionId" name="sessionId" type="text" value="${userLog.sessionId}" size="30"  maxlength=30 />
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
