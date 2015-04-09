<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/system/sysMenu/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>菜单名称：</label>
					<input type="text" name="filter_LIKES_menuDesc" value="${pageData.filtraMap.LIKES_menuDesc}"/>
				</li>
			
				<li>
					<label>菜单类型：</label>
					<tag:enum id="menuType" inputType="select" defaultValue="" name="filter_EQS_menuType" enumName="menuType" enumKey="${pageData.filtraMap.EQS_menuType}" />
				</li>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_menuName" value="${pageData.filtraMap.LIKES_menuName}"/>
					
					<input class="hiddenItem" type="hidden" name="filter_EQI_menuSeq" value="${pageData.filtraMap.EQI_menuSeq}"/>
			
				<li>
					<label>是否IFRAME：</label>
					<tag:enum id="external" inputType="select" defaultValue="" name="filter_EQI_external" enumName="isOrNot" enumKey="${pageData.filtraMap.EQI_external}" />
				</li>
			
				<li>
					<label>打开目标：</label>
					<tag:enum id="target" inputType="select" defaultValue="" name="filter_EQS_target" enumName="target" enumKey="${pageData.filtraMap.EQS_target}" />
				</li>
			
				<li>
					<label>上级菜单：</label>
					<input id="system_parentId_menuDesc_list" type="hidden" name="parentId.id" value='' />
					<input type="text" name="filter_LIKES_parentId.menuDesc" value='${pageData.filtraMap["LIKES_parentId.menuDesc"]}' suggestFields="menuDesc" suggestUrl="${ctx}/system/sysMenu/lookupJson" lookupGroup="parentId" />
					<a class="btnLook" href="${ctx}/system/sysMenu/lookupList" lookupGroup="parentId">查找带回</a>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<li><a class="button" href="${ctx}/system/sysMenu/advancedSearch" target="dialog" mask="true" title="查询框"><span>高级查询</span></a></li>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
		<sec:authorize ifAllGranted="ROLE_SYSTEM_SYSMENU_NEW">
			<li><a class="add" href="${ctx}/system/sysMenu/new" target="navTab" rel="system_sysMenu_edit"><span>添加菜单</span></a></li>
		</sec:authorize>
			<li class="line">line</li>
		<sec:authorize ifAllGranted="ROLE_SYSTEM_SYSMENU_DELALL">
			<li><a class="delete" href="${ctx}/system/sysMenu/delAll" target="selectedTodo" rel="ids" postType="string" title="确实要删除这些记录吗?"><span>批量删除</span></a></li>
		</sec:authorize>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
					
				<th orderField="menuDesc" class=${pageData.compositor.fieldName eq 'menuDesc' ? pageData.compositor.compositorType : ''}>菜单名称</th>
			
				<th orderField="menuType" class=${pageData.compositor.fieldName eq 'menuType' ? pageData.compositor.compositorType : ''}>菜单类型</th>
					
				<th orderField="menuName" style="width:220px;" class=${pageData.compositor.fieldName eq 'menuName' ? pageData.compositor.compositorType : ''}>菜单URL</th>
					
				<th orderField="menuSeq" class=${pageData.compositor.fieldName eq 'menuSeq' ? pageData.compositor.compositorType : ''}>菜单序列</th>
					
				<th orderField="authorityName" class=${pageData.compositor.fieldName eq 'authorityName' ? pageData.compositor.compositorType : ''}>权限名称</th>
			
				<th orderField="external" class=${pageData.compositor.fieldName eq 'external' ? pageData.compositor.compositorType : ''}>是否IFRAME</th>
			
				<th orderField="enabled" class=${pageData.compositor.fieldName eq 'enabled' ? pageData.compositor.compositorType : ''}>是否可用</th>
			
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" rel="system_viewdialog" >
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
						
					<td>${entity.menuDesc}</td>
				
					<td><tag:enum tagType="view" enumName="menuType" enumKey="${entity.menuType}" /></td>
						
					<td>${entity.menuName}</td>
						
					<td>${entity.menuSeq}</td>
						
					<td>${entity.authorityName}</td>
				
					<td><tag:enum tagType="view" enumName="isOrNot" enumKey="${entity.external}" /></td>
				
					<td><tag:enum tagType="view" enumName="isOrNot" enumKey="${entity.enabled}" /></td>
				
					
					<td>
					<sec:authorize ifAllGranted="ROLE_SYSTEM_SYSMENU_DELETE">
						<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/system/sysMenu/delete?id=${entity.id}" class="btnDel">删除</a>
					</sec:authorize>
					<sec:authorize ifAllGranted="ROLE_SYSTEM_SYSMENU_EDIT">
						<a title="编辑菜单" target="navTab" rel="system_sysMenu_edit" href="${ctx}/system/sysMenu/edit?id=${entity.id}" class="btnEdit">编辑</a>
					</sec:authorize>
						<a title="查看菜单" target="navTab" rel="system_sysMenu_view" href="${ctx}/system/sysMenu/view?id=${entity.id}" class="btnView">查看</a>
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
