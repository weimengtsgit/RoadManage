<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
		<input type="hidden" name="id" value="${reportDay.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>日期：</dt>
				
				<dd>
					<input id="date" readonly="readonly" name="date" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${reportDay.date}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>宣传页展示数(PV)：</dt>
				<dd>
					<input id="pv" readonly="readonly" name="pv" type="text" value="${reportDay.pv}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>无线网络客流量（UV）：</dt>
				<dd>
					<input id="uv" readonly="readonly" name="uv" type="text" value="${reportDay.uv}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>手机注册用户数：</dt>
				<dd>
					<input id="newUserCount" readonly="readonly" name="newUserCount" type="text" value="${reportDay.newUserCount}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>商铺：</dt>
				<dd>
					<c:if test="${not empty reportDay.shopId.name}">
						<a class="ghbutton search right" href="${ctx}/mall/shop/view?id=${reportDay.shopId.id}" target="dialog" mask="true" title="查看商铺详情">${reportDay.shopId.name}</a>
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
