<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
		<input type="hidden" name="id" value="${customerRalation.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>客户：</dt>
				<dd>
					<c:if test="${not empty customerRalation.terminal.customer.mobile}">
						<a class="ghbutton search right" href="${ctx}/customer/customer/view?id=${customerRalation.terminal.customer.id}" target="dialog" mask="true" title="查看客户详情">${customerRalation.terminal.customer.mobile}</a>
					</c:if>
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>终端：</dt>
				<dd>
					<c:if test="${not empty customerRalation.terminal.mac}">
						<a class="ghbutton search right" href="${ctx}/customer/terminal/view?id=${customerRalation.terminal.id}" target="dialog" mask="true" title="查看终端详情">${customerRalation.terminal.mac}</a>
					</c:if>
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>商铺：</dt>
				<dd>
					<c:if test="${not empty customerRalation.shop.name}">
						<a class="ghbutton search right" href="${ctx}/mall/shop/view?id=${customerRalation.shop.id}" target="dialog" mask="true" title="查看商铺详情">${customerRalation.shop.name}</a>
					</c:if>
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>商场：</dt>
				<dd>
					<c:if test="${not empty customerRalation.shop.mall.name}">
						<a class="ghbutton search right" href="${ctx}/mall/mall/view?id=${customerRalation.shop.mall.id}" target="dialog" mask="true" title="查看商场详情">${customerRalation.shop.mall.name}</a>
					</c:if>
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>创建时间：</dt>
				
				<dd>
					<input id="createTime" readonly="readonly" name="createTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${customerRalation.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>是否收藏：</dt>
				<dd>
					<tag:enum tagType="view"   enumName="com_customerRalationType" enumKey="${customerRalation.keep}" />
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
