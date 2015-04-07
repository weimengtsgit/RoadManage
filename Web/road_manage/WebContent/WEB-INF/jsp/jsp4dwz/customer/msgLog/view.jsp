<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
		<input type="hidden" name="id" value="${msgLog.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>商铺：</dt>
				<dd>
					<c:if test="${not empty msgLog.shop.name}">
						<a class="ghbutton search right" href="${ctx}/view?id=${msgLog.shop.id}" target="dialog" mask="true" title="查看商铺详情">${msgLog.shop.name}</a>
					</c:if>
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>商场：</dt>
				<dd>
					<c:if test="${not empty msgLog.mall.name}">
						<a class="ghbutton search right" href="${ctx}/mall/mall/view?id=${msgLog.mall.id}" target="dialog" mask="true" title="查看商场详情">${msgLog.mall.name}</a>
					</c:if>
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>手机号：</dt>
				<dd>
					<input id="mobile" readonly="readonly" name="mobile" type="text" value="${msgLog.mobile}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>发送时间：</dt>
				
				<dd>
					<input id="msgTime" readonly="readonly" name="msgTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${msgLog.msgTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>发送状态：</dt>
				<dd>
					<tag:enum tagType="view"   enumName="com_msglog_status" enumKey="${msgLog.status}" />
				</dd>
				<span class="info"></span>
			</dl>
		
			<dl class="nowrap">
				<dt>短信内容：</dt>
				<dd>
					<textarea readonly="readonly" id="msgContent" cols="91" rows="5" width="480">${msgLog.msgContent}</textarea>
				</dd>
				<span class="info"></span>
			</dl>
			<div class="divider"></div>
		
			<dl class="nowrap">
				<dt>发送结果代码：</dt>
				<dd>
					<textarea readonly="readonly" id="result" cols="91" rows="5" width="480">${msgLog.result}</textarea>
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
