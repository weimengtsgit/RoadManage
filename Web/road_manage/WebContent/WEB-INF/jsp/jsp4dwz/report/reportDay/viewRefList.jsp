<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return dwzSearch(this, 'dialog');" method="post" action="${ctx}/report/reportDay/viewRefList">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>日期：</label>
					<input id="date" name="filter_GED_date" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_date}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input id="date" name="filter_LED_date" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_date}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
					
				<li>
					<label>宣传页展示数(PV)：</label>
					<input type="text" name="filter_EQI_pv" value="${pageData.filtraMap.EQI_pv}"/>
				</li>
					
				<li>
					<label>无线网络客流量（UV）：</label>
					<input type="text" name="filter_EQI_uv" value="${pageData.filtraMap.EQI_uv}"/>
				</li>
					
				<li>
					<label>手机注册用户数：</label>
					<input type="text" name="filter_EQI_newUserCount" value="${pageData.filtraMap.EQI_newUserCount}"/>
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
					
				<th  orderField="date" class=${pageData.compositor.fieldName eq 'date' ? pageData.compositor.compositorType : ''}>日期</th>
					
				<th  orderField="pv" class=${pageData.compositor.fieldName eq 'pv' ? pageData.compositor.compositorType : ''}>宣传页展示数(PV)</th>
					
				<th  orderField="uv" class=${pageData.compositor.fieldName eq 'uv' ? pageData.compositor.compositorType : ''}>无线网络客流量（UV）</th>
					
				<th  orderField="newUserCount" class=${pageData.compositor.fieldName eq 'newUserCount' ? pageData.compositor.compositorType : ''}>手机注册用户数</th>
			
				<th orderField="shopId.name" class="${pageData.compositor.fieldName eq 'shopId.name' ? pageData.compositor.compositorType : ''}">商铺</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" >
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
				
					<td><fmt:formatDate value="${entity.date}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
						
					<td>${entity.pv}</td>
						
					<td>${entity.uv}</td>
						
					<td>${entity.newUserCount}</td>
				
					<td>
					<c:if test="${not empty entity.shopId.name}">
					<a class="ghbutton search right" href="${ctx}/mall/shop/view?id=${entity.shopId.id}" target="dialog" mask="true" rel="report_reportDay_lookupdialog" title="查看商铺详情">${entity.shopId.name}</a>
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
