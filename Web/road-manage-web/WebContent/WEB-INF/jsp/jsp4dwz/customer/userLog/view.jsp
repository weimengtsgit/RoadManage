<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
		<input type="hidden" name="id" value="${userLog.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>终端MAC：</dt>
				<dd>
					<input id="termMac" readonly="readonly" name="termMac" type="text" value="${userLog.termMac}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>认证名：</dt>
				<dd>
					<input id="authName" readonly="readonly" name="authName" type="text" value="${userLog.authName}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>终端IP：</dt>
				<dd>
					<input id="termIp" readonly="readonly" name="termIp" type="text" value="${userLog.termIp}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>AP设备MAC：</dt>
				<dd>
					<input id="apMac" readonly="readonly" name="apMac" type="text" value="${userLog.apMac}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>上线时间：</dt>
				
				<dd>
					<input id="onlineTime" readonly="readonly" name="onlineTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${userLog.onlineTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>下线时间：</dt>
				
				<dd>
					<input id="offlineTime" readonly="readonly" name="offlineTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${userLog.offlineTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>上网总时长(秒)：</dt>
				<dd>
					<input id="totalTime" readonly="readonly" name="totalTime" type="text" value="${userLog.totalTime}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>上网总流量(MB)：</dt>
				<dd>
					<input id="totalFlow" readonly="readonly" name="totalFlow" type="text" value="${userLog.totalFlow}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>费用：</dt>
				<dd>
					<input id="totalFee" readonly="readonly" name="totalFee" type="text" value="${userLog.totalFee}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>唯一标识：</dt>
				<dd>
					<input id="sessionId" readonly="readonly" name="sessionId" type="text" value="${userLog.sessionId}" size="30"  />
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
