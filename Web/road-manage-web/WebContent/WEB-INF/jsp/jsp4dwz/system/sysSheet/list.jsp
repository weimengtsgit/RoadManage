<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/system/sysSheet/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>基础表名：</label>
					<input type="text" name="filter_LIKES_tableName" value="${pageData.filtraMap.LIKES_tableName}"/>
				</li>
			
				<li>
					<label>分表周期：</label>
					<tag:enum id="cycle" inputType="select" defaultValue="" name="filter_EQS_cycle" enumName="sheetCycle" enumKey="${pageData.filtraMap.EQS_cycle}" />
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
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<li><a class="button" href="${ctx}/system/sysSheet/advancedSearch" target="dialog" mask="true" title="查询框"><span>高级查询</span></a></li>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
		<sec:authorize ifAllGranted="ROLE_SYSTEM_SYSSHEET_NEW">
			<li><a class="add" href="${ctx}/system/sysSheet/new" target="navTab" rel="system_sysSheet_edit"><span>添加分表配置</span></a></li>
		</sec:authorize>
			<li class="line">line</li>
		<sec:authorize ifAllGranted="ROLE_SYSTEM_SYSSHEET_DELALL">
			<li><a class="delete" href="${ctx}/system/sysSheet/delAll" target="selectedTodo" rel="ids" postType="string" title="确实要删除这些记录吗?"><span>批量删除</span></a></li>
		</sec:authorize>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
					
				<th orderField="tableName" class=${pageData.compositor.fieldName eq 'tableName' ? pageData.compositor.compositorType : ''}>基础表名</th>
			
				<th orderField="cycle" class=${pageData.compositor.fieldName eq 'cycle' ? pageData.compositor.compositorType : ''}>分表周期</th>
					
				<th orderField="startTime" class=${pageData.compositor.fieldName eq 'startTime' ? pageData.compositor.compositorType : ''}>起始时间</th>
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" rel="system_viewdialog" >
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
						
					<td>${entity.tableName}</td>
				
					<td><tag:enum tagType="view" enumName="sheetCycle" enumKey="${entity.cycle}" /></td>
				
					<td><fmt:formatDate value="${entity.startTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
				
					<td>
					<sec:authorize ifAllGranted="ROLE_SYSTEM_SYSSHEET_DELETE">
						<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/system/sysSheet/delete?id=${entity.id}" class="btnDel">删除</a>
					</sec:authorize>
					<sec:authorize ifAllGranted="ROLE_SYSTEM_SYSSHEET_EDIT">
						<a title="编辑分表配置" target="navTab" rel="system_sysSheet_edit" href="${ctx}/system/sysSheet/edit?id=${entity.id}" class="btnEdit">编辑</a>
					</sec:authorize>
						<a title="查看分表配置" target="navTab" rel="system_sysSheet_view" href="${ctx}/system/sysSheet/view?id=${entity.id}" class="btnView">查看</a>
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
		
		<div class="pagination" targetType="navTab" totalCount="${pageData.pagination.totalCount}" numPerPage="${pageData.pagination.pageSize}" pageNumShown="5" currentPage="${pageData.pagination.pageNo}"></div>

	</div>
</div>
