<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form rel="pagerForm" id="pagerForm" method="post" action="${ctx}/customer/msgLog/lookupList" onsubmit="return dwzSearch(this, 'dialog');">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>商铺：</label>
					<input id="customer_shop_name" type="hidden" name="shop.id" value="${msgLog.shop.id}"/>
					<input type="text" name="shop.name" value="${pageData.filtraMap.EQS_shop}" suggestFields="name" suggestUrl="${ctx}/lookupJson" lookupGroup="shop"  onchange="if(!this.value) document.getElementById('customer_shop_name').value=''" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="shop">查找带回</a>
				</li>
			
				<li>
					<label>商场：</label>
					<input id="customer_mall_name" type="hidden" name="mall.id" value="${msgLog.mall.id}"/>
					<input type="text" name="mall.name" value="${pageData.filtraMap.EQS_mall}" suggestFields="name" suggestUrl="${ctx}/mall/mall/lookupJson" lookupGroup="mall"  onchange="if(!this.value) document.getElementById('customer_mall_name').value=''" />
					<a class="btnLook" href="${ctx}/mall/mall/lookupList" lookupGroup="mall">查找带回</a>
				</li>
			
				<li>
					<label>手机号：</label>
					<input type="text" name="filter_LIKES_mobile" value="${pageData.filtraMap.LIKES_mobile}"/>
				</li>
			
				<li>
					<label>短信内容：</label>
					<input type="text" name="filter_LIKES_msgContent" value="${pageData.filtraMap.LIKES_msgContent}"/>
				</li>
			
				<li>
					<label>发送时间：</label>
					<input id="msgTime" name="filter_GED_msgTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_msgTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input id="msgTime" name="filter_LED_msgTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_msgTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive" style="float:right;"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<%-- <li><a class="button" href="${ctx}/customer/msgLog/advancedSearch" target="dialog" title="查询框"><span>高级查询</span></a></li> --%>
			</ul>
		</div>
	</div>
	</div>
</div>
</form>
<div class="pageContent">
	<table class="table" layoutH="160" targetType="dialog" width="100%">
		<thead>
			<tr>
			
				<th orderField="shop.name" class="${pageData.compositor.fieldName eq 'shop.name' ? pageData.compositor.compositorType : ''}">商铺</th>
			
				<th orderField="mall.name" class="${pageData.compositor.fieldName eq 'mall.name' ? pageData.compositor.compositorType : ''}">商场</th>
					
				<th orderField="mobile" class="${pageData.compositor.fieldName eq 'mobile.' ? pageData.compositor.compositorType : ''}">手机号</th>
					
				<th orderField="msgContent" class="${pageData.compositor.fieldName eq 'msgContent.' ? pageData.compositor.compositorType : ''}">短信内容</th>
					
				<th orderField="msgTime" class="${pageData.compositor.fieldName eq 'msgTime.' ? pageData.compositor.compositorType : ''}">发送时间</th>
				
				<th width="90">查找带回</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}">
				<tr>
				
					<td>
					<c:if test="${not empty entity.shop.name}">
					<a class="ghbutton search right" href="${ctx}/view?id=${entity.shop.id}" target="dialog" mask="true" rel="customer_msgLog_dialog" title="查看商铺详情">${entity.shop.name}</a>
					</c:if>
					</td>
				
					<td>
					<c:if test="${not empty entity.mall.name}">
					<a class="ghbutton search right" href="${ctx}/mall/mall/view?id=${entity.mall.id}" target="dialog" mask="true" rel="customer_msgLog_dialog" title="查看商场详情">${entity.mall.name}</a>
					</c:if>
					</td>
						
					<td>${entity.mobile}</td>
						
					<td>${entity.msgContent}</td>
				
					<td><fmt:formatDate value="${entity.msgTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
				
					<td>
						<a class="btnSelect" href="javascript:SLAVEJS.getLoopupJson('${ctx}/customer/msgLog/viewJson?id=${entity.id}')" title="查找带回">选择</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>每页显示${pageData.pagination.pageSize}条，</span>
			<span>共${pageData.pagination.totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="dialog" totalCount="${pageData.pagination.totalCount}" numPerPage="${pageData.pagination.pageSize}" pageNumShown="5" currentPage="${pageData.pagination.pageNo}"></div>

	</div>
	<div class="formBar">
			<ul>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div>
				</li>
			</ul>
		</div>
</div>
