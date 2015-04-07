<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/system/sysEnum/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>枚举标识：</label>
					<input type="text" name="filter_LIKES_enumName" value="${pageData.filtraMap.LIKES_enumName}"/>
				</li>
				
				<li>
					<label>枚举名称：</label>
					<input type="text" name="filter_LIKES_enumDesc" value="${pageData.filtraMap.LIKES_enumDesc}"/>
				</li>
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<li><a class="button" href="${ctx}/system/sysEnum/advancedSearch" target="dialog" mask="true" title="查询框"><span>高级查询</span></a></li>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${ctx}/system/sysEnum/new" target="navTab" rel="system_sysEnum_edit"><span>添加枚举实体</span></a></li>
			<li class="line">line</li>
			<li><a class="delete" href="${ctx}/system/sysEnum/delAll" target="selectedTodo" rel="ids" postType="string" title="确实要删除这些记录吗?"><span>批量删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
					
				<th orderField="enumName" class=${pageData.compositor.fieldName eq 'enumName' ? pageData.compositor.compositorType : ''}>枚举标识</th>
					
				<th orderField="enumDesc" class=${pageData.compositor.fieldName eq 'enumDesc' ? pageData.compositor.compositorType : ''}>枚举名称</th>
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" title="查看枚举实体-${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}">
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
					
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
						
					<td>${entity.enumName}</td>
						
					<td>${entity.enumDesc}</td>
				
					<td>
						<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/system/sysEnum/delete?id=${entity.id}" class="btnDel">删除</a>
						<a title="编辑枚举实体" target="navTab" rel="system_sysEnum_edit" href="${ctx}/system/sysEnum/edit?id=${entity.id}" class="btnEdit">编辑</a>
						<a title="查看枚举实体" target="navTab" rel="system_sysEnum_view" href="${ctx}/system/sysEnum/view?id=${entity.id}" class="btnView">查看</a>
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
