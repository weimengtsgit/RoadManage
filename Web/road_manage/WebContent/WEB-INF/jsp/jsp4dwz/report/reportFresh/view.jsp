<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
		<input type="hidden" name="id" value="${reportFresh.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>统计项：</dt>
				<dd>
					<tag:enum tagType="view"   enumName="com_reportFresh_type" enumKey="${reportFresh.type}" />
				</dd>
				<span class="info"></span>
			</dl>
		
			<dl>
				<dt>数量：</dt>
				<dd>
					<input id="count" readonly="readonly" name="count" type="text" value="${reportFresh.count}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>商铺：</dt>
				<dd>
					<c:if test="${not empty reportFresh.shopId.name}">
						<a class="ghbutton search right" href="${ctx}/mall/shop/view?id=${reportFresh.shopId.id}" target="dialog" mask="true" title="查看商铺详情">${reportFresh.shopId.name}</a>
					</c:if>
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
