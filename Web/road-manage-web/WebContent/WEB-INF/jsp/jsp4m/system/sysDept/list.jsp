<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/system/sysDept/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>部门名称：</label>
					<input type="text" name="filter_LIKES_deptName" value="${pageData.filtraMap.LIKES_deptName}" maxlength="32"/>
				</li>
			
				<li>
					<label>部门编号：</label>
					<input type="text" name="filter_LIKES_deptNum" value="${pageData.filtraMap.LIKES_deptNum}"/>
				</li>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_deptAddr" value="${pageData.filtraMap.LIKES_deptAddr}"/>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_deptDesc" value="${pageData.filtraMap.LIKES_deptDesc}"/>
			
				<li>
					<label>上级部门：</label>
					<input id="system_parentId_deptName_list" type="hidden" name="parentId.id" value='' />
					<input type="text" name="filter_LIKES_parentId.deptName" value='${pageData.filtraMap["LIKES_parentId.deptName"]}' suggestFields="deptName" suggestUrl="${ctx}/system/sysDept/lookupJson" lookupGroup="parentId" />
					<a class="btnLook" href="${ctx}/system/sysDept/lookupList" lookupGroup="parentId">查找带回</a>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<li><a class="button" href="${ctx}/system/sysDept/advancedSearch" rel="system_sysDept_advancedSearch" target="dialog" mask="true" width="795" height="460" title="查询框"><span>高级查询</span></a></li>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${ctx}/system/sysDept/new" target="navTab" rel="system_sysDept_edit"><span>添加部门</span></a></li>
			<li class="line">line</li>
			<li><a class="delete" href="${ctx}/system/sysDept/delAll" target="selectedTodo" rel="ids" postType="string" title="删除的同时，会将关联该部门的所有部门全部删除。确实要删除这些记录吗?" ><span>批量删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
					
				<th orderField="deptName" class=${pageData.compositor.fieldName eq 'deptName' ? pageData.compositor.compositorType : ''}>部门名称</th>
					
				<th orderField="deptNum" class=${pageData.compositor.fieldName eq 'deptNum' ? pageData.compositor.compositorType : ''}>部门编号</th>
					
				<th orderField="deptAddr" class=${pageData.compositor.fieldName eq 'deptAddr' ? pageData.compositor.compositorType : ''}>部门地址</th>
			
				<th orderField="parentId.deptName" class="${pageData.compositor.fieldName eq 'parentId.deptName' ? pageData.compositor.compositorType : ''}">上级部门</th>
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody><!-- scroller="no" mintr="19" -->
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" title="查看部门-${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}">
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
						
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
					
					<td>${entity.deptName}</td><!-- limit -->
						
					<td>${entity.deptNum}</td>
						
					<td>${entity.deptAddr}</td>
				
					<td><a href="${ctx}/system/sysDept/view?id=${entity.parentId.id}" target="dialog" rel="system_sysDept_dialog" title="${entity.parentId.deptName}">${entity.parentId.deptName}</a></td>
				
					<td>
						<a title="删除的同时，会将关联该部门的所有部门全部删除。确实要删除吗？" target="ajaxTodo" href="${ctx}/system/sysDept/delete?id=${entity.id}" class="btnDel">删除</a>
						<a title="编辑部门" target="navTab" rel="system_sysDept_edit" href="${ctx}/system/sysDept/edit?id=${entity.id}" class="btnEdit">编辑</a>
						<a title="查看部门" target="navTab" rel="system_sysDept_view" href="${ctx}/system/sysDept/view?id=${entity.id}" class="btnView">查看</a>
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
