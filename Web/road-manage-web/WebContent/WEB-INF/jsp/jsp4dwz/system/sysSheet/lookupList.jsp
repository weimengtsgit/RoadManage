<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form rel="pagerForm" id="pagerForm" method="post" action="${ctx}/system/sysSheet/lookupList" onsubmit="return dwzSearch(this, 'dialog');">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>基础表名：</label>
					<input type="text" name="filter_LIKES_tableName" value="${pageData.filtraMap.LIKES_tableName}"/>
				</li>
			
				<li>
					<label>分表周期：</label>
					<tag:enum id="cycle" defaultValue="" name="filter_EQS_cycle" enumName="sheetCycle" enumKey="${pageData.filtraMap.EQS_cycle}" />
				</li>
			
				<li>
					<label>起始时间：</label>
					<input id="startTime" name="filter_GED_startTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_startTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input id="startTime" name="filter_LED_startTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_startTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive" style="float:right;"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<%-- <li><a class="button" href="${ctx}/system/sysSheet/advancedSearch" target="dialog" title="查询框"><span>高级查询</span></a></li> --%>
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
					
				<th orderField="tableName" class="${pageData.compositor.fieldName eq 'tableName.' ? pageData.compositor.compositorType : ''}">基础表名</th>
					
				<th orderField="cycle" class="${pageData.compositor.fieldName eq 'cycle.' ? pageData.compositor.compositorType : ''}">分表周期</th>
					
				<th orderField="startTime" class="${pageData.compositor.fieldName eq 'startTime.' ? pageData.compositor.compositorType : ''}">起始时间</th>
				
				<th width="90">查找带回</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}">
				<tr>
						
					<td>${entity.tableName}</td>
				
					<td><tag:enum isTag="false" id="cycle" name="cycle" enumName="sheetCycle" enumKey="${entity.cycle}" /></td>		
				
					<td><fmt:formatDate value="${entity.startTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
				
					<td>
						<a class="btnSelect" href="javascript:SLAVEJS.getLoopupJson('${ctx}/system/sysSheet/viewJson?id=${entity.id}')" title="查找带回">选择</a>
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
