<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return dwzSearch(this, 'dialog');" method="post" action="${ctx}/report/reportFresh/viewRefList">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>统计项：</label>
					<tag:enum id="type" inputType="SELECT" defaultValue="" name="filter_EQS_type" enumName="com_reportFresh_type" enumKey="${pageData.filtraMap.EQS_type}" />
				</li>
					
				<li>
					<label>数量：</label>
					<input type="text" name="filter_EQI_count" value="${pageData.filtraMap.EQI_count}"/>
				</li>
			
				
					<input class="hiddenItem"  type="hidden" name="filter_EQI_shopId.id" value='${pageData.filtraMap["EQI_shopId.id"]}' />
				
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<table class="table" width="100%" layoutH="150"  targetType="dialog">
		<thead>
			<tr>
				<th width="32">序号</th>
			
				<th orderField="type" class=${pageData.compositor.fieldName eq 'type' ? pageData.compositor.compositorType : ''}>统计项</th>
					
				<th  orderField="count" class=${pageData.compositor.fieldName eq 'count' ? pageData.compositor.compositorType : ''}>数量</th>
			
				<th orderField="shopId.name" class="${pageData.compositor.fieldName eq 'shopId.name' ? pageData.compositor.compositorType : ''}">商铺</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" >
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
				
					<td><tag:enum isTag="false" tagType="view" id="type" name="type" enumName="com_reportFresh_type" enumKey="${entity.type}" /></td>
						
					<td>${entity.count}</td>
				
					<td>
					<c:if test="${not empty entity.shopId.name}">
					<a class="ghbutton search right" href="${ctx}/mall/shop/view?id=${entity.shopId.id}" target="dialog" mask="true" rel="report_reportFresh_lookupdialog" title="查看商铺详情">${entity.shopId.name}</a>
					</c:if>
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
