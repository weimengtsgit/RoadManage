<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form rel="pagerForm" id="pagerForm" method="post" action="${ctx}/report/reportFresh/lookupList" onsubmit="return dwzSearch(this, 'dialog');">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>统计项：</label>
					<tag:enum id="type" defaultValue="" name="filter_EQS_type" enumName="com_reportFresh_type" enumKey="${pageData.filtraMap.EQS_type}" />
				</li>
					
				<li>
					<label>数量：</label>
					<input type="text" name="filter_EQI_count" value="${pageData.filtraMap.EQI_count}"/>
				</li>
			
				<li>
					<label>商铺：</label>
					<input id="report_shopId_name" type="hidden" name="shopId.id" value="${reportFresh.shopId.id}"/>
					<input type="text" name="shopId.name" value="${pageData.filtraMap.EQS_shopId}" suggestFields="name" suggestUrl="${ctx}/mall/shop/lookupJson" lookupGroup="shopId"  onchange="if(!this.value) document.getElementById('report_shopId_name').value=''" />
					<a class="btnLook" href="${ctx}/mall/shop/lookupList" lookupGroup="shopId">查找带回</a>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive" style="float:right;"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<%-- <li><a class="button" href="${ctx}/report/reportFresh/advancedSearch" target="dialog" title="查询框"><span>高级查询</span></a></li> --%>
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
					
				<th orderField="type" class="${pageData.compositor.fieldName eq 'type.' ? pageData.compositor.compositorType : ''}">统计项</th>
					
				<th orderField="count" class="${pageData.compositor.fieldName eq 'count.' ? pageData.compositor.compositorType : ''}">数量</th>
			
				<th orderField="shopId.name" class="${pageData.compositor.fieldName eq 'shopId.name' ? pageData.compositor.compositorType : ''}">商铺</th>
				
				<th width="90">查找带回</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}">
				<tr>
				
					<td><tag:enum isTag="false" id="type" name="type" enumName="com_reportFresh_type" enumKey="${entity.type}" /></td>		
						
					<td>${entity.count}</td>
				
					<td>
					<c:if test="${not empty entity.shopId.name}">
					<a class="ghbutton search right" href="${ctx}/mall/shop/view?id=${entity.shopId.id}" target="dialog" mask="true" rel="report_reportFresh_dialog" title="查看商铺详情">${entity.shopId.name}</a>
					</c:if>
					</td>
				
					<td>
						<a class="btnSelect" href="javascript:SLAVEJS.getLoopupJson('${ctx}/report/reportFresh/viewJson?id=${entity.id}')" title="查找带回">选择</a>
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
