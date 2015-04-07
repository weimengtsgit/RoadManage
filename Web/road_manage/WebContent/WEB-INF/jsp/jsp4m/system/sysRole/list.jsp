<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/system/sysRole/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>角色名称：</label>
					<input type="text" name="filter_LIKES_roleName" value="${pageData.filtraMap.LIKES_roleName}"/>
				</li>
			
				<li>
					<label>角色描述：</label>
					<input type="text" name="filter_LIKES_roleDesc" value="${pageData.filtraMap.LIKES_roleDesc}"/>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
<%-- 				<li><a class="button" href="${ctx}/system/sysRole/advancedSearch" target="dialog" mask="true" title="查询框"><span>高级查询</span></a></li> --%>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${ctx}/system/sysRole/new" target="navTab" rel="system_sysRole_edit"><span>添加角色</span></a></li>
			<li class="line">line</li>
<%-- 			<li><a class="delete" href="${ctx}/system/sysRole/delAll" target="selectedTodo" rel="ids" postType="string" title="确实要删除这些记录吗?"><span>批量删除</span></a></li> --%>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
					
				<th orderField="roleName" class=${pageData.compositor.fieldName eq 'roleName' ? pageData.compositor.compositorType : ''}>角色名称</th>
					
				<th orderField="roleDesc" class=${pageData.compositor.fieldName eq 'roleDesc' ? pageData.compositor.compositorType : ''}>角色描述</th>
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" title="查看角色-${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}">
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
					
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
						
					<td>${entity.roleName}</td>
						
					<td>${entity.roleDesc}</td>
				
					<td>
						<c:if test="${!(curUser.userType==3 and entity.common==1  )}">
						<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/system/sysRole/delete?id=${entity.id}" class="btnDel">删除</a>
						<a title="编辑角色" target="navTab" rel="system_sysRole_edit" href="${ctx}/system/sysRole/edit?id=${entity.id}" class="btnEdit">编辑</a>
						</c:if>
						<a title="查看角色" target="navTab" rel="system_sysRole_view" href="${ctx}/system/sysRole/view?id=${entity.id}" class="btnView">查看</a>
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
