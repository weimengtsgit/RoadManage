<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/helpdoc/helpDoc/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>文档标题：</label>
					<input type="text" name="filter_LIKES_docTitle" value="${pageData.filtraMap.LIKES_docTitle}"/>
				</li>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_docContent" value="${pageData.filtraMap.LIKES_docContent}"/>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_docDesc" value="${pageData.filtraMap.LIKES_docDesc}"/>
			
				<li>
					<label>所属菜单：</label>
					<input id="helpdoc_sysMenu_menuDesc_list" type="hidden" name="sysMenu.id" value='' />
					<input type="text" name="filter_LIKES_sysMenu.menuDesc" value='${pageData.filtraMap["LIKES_sysMenu.menuDesc"]}' suggestFields="menuDesc" suggestUrl="${ctx}/system/sysMenu/lookupJson" lookupGroup="sysMenu" />
					<a class="btnLook" href="${ctx}/system/sysMenu/lookupList" lookupGroup="sysMenu">查找带回</a>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<li><a class="button" href="${ctx}/helpdoc/helpDoc/advancedSearch" target="dialog" mask="true" title="查询框"><span>高级查询</span></a></li>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${ctx}/helpdoc/helpDoc/new" target="navTab" rel="helpdoc_helpDoc_edit"><span>添加帮助文档</span></a></li>
			<li class="line">line</li>
			<li><a class="delete" href="${ctx}/helpdoc/helpDoc/delAll" target="selectedTodo" rel="ids" postType="string" title="确实要删除这些记录吗?"><span>批量删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
					
				<th orderField="docTitle" class=${pageData.compositor.fieldName eq 'docTitle' ? pageData.compositor.compositorType : ''}>文档标题</th>
					
				<th orderField="docDesc" class=${pageData.compositor.fieldName eq 'docDesc' ? pageData.compositor.compositorType : ''}>文档描述</th>
			
				<th orderField="sysMenu.menuDesc" class="${pageData.compositor.fieldName eq 'sysMenu.menuDesc' ? pageData.compositor.compositorType : ''}">所属菜单</th>
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" rel="helpdoc_viewdialog" >
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
						
					<td>${entity.docTitle}</td>
						
					<td>${entity.docDesc}</td>
				
					<td>
					<c:if test="${not empty entity.sysMenu.menuDesc}">
					<a class="ghbutton search right"  href="${ctx}/system/sysMenu/view?id=${entity.sysMenu.id}" target="dialog"  mask="true" rel="helpdoc_helpDoc_lookupdialog"  title="查看所属菜单">${entity.sysMenu.menuDesc}</a>
					</c:if>
					</td>
				
					<td>
						<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/helpdoc/helpDoc/delete?id=${entity.id}" class="btnDel">删除</a>
						<a title="编辑帮助文档" target="navTab" rel="helpdoc_helpDoc_edit" href="${ctx}/helpdoc/helpDoc/edit?id=${entity.id}" class="btnEdit">编辑</a>
						<a title="查看帮助文档" target="navTab" rel="helpdoc_helpDoc_view" href="${ctx}/helpdoc/helpDoc/view?id=${entity.id}" class="btnView">查看</a>
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
