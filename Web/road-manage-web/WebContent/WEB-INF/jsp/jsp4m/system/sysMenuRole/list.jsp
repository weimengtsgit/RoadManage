<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/system/sysMenuRole/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
					
				<li>
					<label>角色ID：</label>
					<input type="text" name="filter_EQI_roleId" value="${pageData.filtraMap.EQI_roleId}"/>
				</li>
					
				<li>
					<label>菜单ID：</label>
					<input type="text" name="filter_EQI_menuId" value="${pageData.filtraMap.EQI_menuId}"/>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<li><a class="button" href="${ctx}/system/sysMenuRole/advancedSearch" target="dialog" mask="true" title="查询框"><span>高级查询</span></a></li>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${ctx}/system/sysMenuRole/new" target="navTab" rel="system_sysMenuRole_add"><span>添加角色权限</span></a></li>
			<li class="line">line</li>
			<li><a class="delete" href="${ctx}/system/sysMenuRole/delAll" target="selectedTodo" rel="ids" postType="string" title="确实要删除这些记录吗?"><span>批量删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
					
				<th orderField="roleId" class=${pageData.compositor.fieldName eq 'roleId' ? pageData.compositor.compositorType : ''}>角色ID</th>
					
				<th orderField="menuId" class=${pageData.compositor.fieldName eq 'menuId' ? pageData.compositor.compositorType : ''}>菜单ID</th>
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}">
				<tr target="dialog" mask="true">
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
						
					<td>${entity.roleId}</td>
						
					<td>${entity.menuId}</td>
				
					<td>
						<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/system/sysMenuRole/delete?id=${entity.id}" class="btnDel">删除</a>
						<a title="编辑角色权限" target="navTab" href="${ctx}/system/sysMenuRole/edit?id=${entity.id}" class="btnEdit">编辑</a>
						<a title="查看角色权限" target="dialog" mask="true" href="${ctx}/system/sysMenuRole/view?id=${entity.id}" class="btnView">查看</a>
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
