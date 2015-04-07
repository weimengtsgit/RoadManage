<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/customer/terminal/save?navTabId=customer_terminal_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${terminal.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>终端MAC：</dt>
				<dd>
					<input class="" id="mac" name="mac" type="text" value="${terminal.mac}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>终端类型：</dt>
				<dd>
					<tag:enum id="type" inputType="select" defaultValue="" cssClass="" name="type" enumName="com_terminal_type" enumKey="${terminal.type}" />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>终端描述：</dt>
				<dd>
					<input class="" id="memo" name="memo" type="text" value="${terminal.memo}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>关联顾客：</dt>
				<dd>
					<input id="customer_customer_mobile_input" type="hidden" class="" name="customer.id" value="${terminal.customer.id}"/>
					<input type="text" class="" size="24" name="customer.mobile" value="${terminal.customer.mobile}" suggestFields="mobile" suggestUrl="${ctx}/customer/customer/lookupJson" lookupGroup="customer"  onchange="if(!this.value) document.getElementById('customer_customer_mobile_input').value=''" />
					<a class="btnLook" href="${ctx}/customer/customer/lookupList" lookupGroup="customer">查找带回</a>
					<span class="info"></span>		
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>最近使用时间：</dt>
				
				<dd>
					<input id="lastAccessTime" name="lastAccessTime" type="text" class="date " dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${terminal.lastAccessTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" d>
					<a class="inputDateButton" href="javascript:;">选择</a>
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>最近断开时间：</dt>
				
				<dd>
					<input id="lastExitTime" name="lastExitTime" type="text" class="date " dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${terminal.lastExitTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" d>
					<a class="inputDateButton" href="javascript:;">选择</a>
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>访问次数：</dt>
				<dd>
					<input class="" id="accessPortalTimes" name="accessPortalTimes" type="text" value="${terminal.accessPortalTimes}" size="30"  max=2147483647 maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>注册AP设备MAC：</dt>
				<dd>
					<input class="" id="apMac" name="apMac" type="text" value="${terminal.apMac}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>创建时间：</dt>
				
				<dd>
					<input id="createTime" name="createTime" type="text" class="date " dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${terminal.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" d>
					<a class="inputDateButton" href="javascript:;">选择</a>
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>注册状态：</dt>
				<dd>
					<tag:enum id="status" inputType="select" defaultValue="" cssClass="" name="status" enumName="com_terminal_status" enumKey="${terminal.status}" />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>注册类型：</dt>
				<dd>
					<tag:enum id="regType" inputType="select" defaultValue="" cssClass="" name="regType" enumName="com_terminal_regType" enumKey="${terminal.regType}" />
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
