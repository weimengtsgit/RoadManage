<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
		<input type="hidden" name="id" value="${messageTemplate.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>模版名称：</dt>
				<dd>
					<input id="name" readonly="readonly" name="name" type="text" value="${messageTemplate.name}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>所属商铺：</dt>
				<dd>
					<c:if test="${not empty messageTemplate.shop.name}">
						<a class="ghbutton search right" href="${ctx}/mall/shop/view?id=${messageTemplate.shop.id}" target="dialog" mask="true" title="查看所属商铺详情">${messageTemplate.shop.name}</a>
					</c:if>
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>所属商场：</dt>
				<dd>
					<c:if test="${not empty messageTemplate.mall.name}">
						<a class="ghbutton search right" href="${ctx}/mall/mall/view?id=${messageTemplate.mall.id}" target="dialog" mask="true" title="查看所属商场详情">${messageTemplate.mall.name}</a>
					</c:if>
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl class="nowrap">
				<dt>模版内容：</dt>
				<dd>
					<textarea readonly="readonly" id="content" cols="91" rows="5" width="480">${messageTemplate.content}</textarea>
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
