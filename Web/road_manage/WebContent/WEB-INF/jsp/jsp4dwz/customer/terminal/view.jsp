<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
		<input type="hidden" name="id" value="${terminal.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>终端MAC：</dt>
				<dd>
					<input id="mac" readonly="readonly" name="mac" type="text" value="${terminal.mac}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>终端类型：</dt>
				<dd>
					<tag:enum tagType="view"   enumName="com_terminal_type" enumKey="${terminal.type}" />
				</dd>
				<span class="info"></span>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>终端描述：</dt>
				<dd>
					<input id="memo" readonly="readonly" name="memo" type="text" value="${terminal.memo}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>关联顾客：</dt>
				<dd>
					<c:if test="${not empty terminal.customer.mobile}">
						<a class="ghbutton search right" href="${ctx}/customer/customer/view?id=${terminal.customer.id}" target="dialog" mask="true" title="查看关联顾客详情">${terminal.customer.mobile}</a>
					</c:if>
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>最近使用时间：</dt>
				
				<dd>
					<input id="lastAccessTime" readonly="readonly" name="lastAccessTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${terminal.lastAccessTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>最近断开时间：</dt>
				
				<dd>
					<input id="lastExitTime" readonly="readonly" name="lastExitTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${terminal.lastExitTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>访问次数：</dt>
				<dd>
					<input id="accessPortalTimes" readonly="readonly" name="accessPortalTimes" type="text" value="${terminal.accessPortalTimes}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>注册AP设备MAC：</dt>
				<dd>
					<input id="apMac" readonly="readonly" name="apMac" type="text" value="${terminal.apMac}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>创建时间：</dt>
				
				<dd>
					<input id="createTime" readonly="readonly" name="createTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${terminal.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>注册状态：</dt>
				<dd>
					<tag:enum tagType="view"   enumName="com_terminal_status" enumKey="${terminal.status}" />
				</dd>
				<span class="info"></span>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>注册类型：</dt>
				<dd>
					<tag:enum tagType="view"   enumName="com_terminal_regType" enumKey="${terminal.regType}" />
				</dd>
				<span class="info"></span>
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
