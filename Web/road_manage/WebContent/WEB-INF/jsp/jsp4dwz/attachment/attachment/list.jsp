<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/attachment/attachment/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>附件名称：</label>
					<input type="text" name="filter_LIKES_attachName" value="${pageData.filtraMap.LIKES_attachName}"/>
				</li>
			
				<li>
					<label>附件描述：</label>
					<input type="text" name="filter_LIKES_attachDes" value="${pageData.filtraMap.LIKES_attachDes}"/>
				</li>
			
				<li>
					<label>附件ID：</label>
					<input type="text" name="filter_LIKES_attachId" value="${pageData.filtraMap.LIKES_attachId}"/>
				</li>
			
				<li>
					<label>附件资源：</label>
					<input type="text" name="filter_LIKES_attachUri" value="${pageData.filtraMap.LIKES_attachUri}"/>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<li><a class="button" href="${ctx}/attachment/attachment/advancedSearch" target="dialog" mask="true" title="查询框"><span>高级查询</span></a></li>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
		<sec:authorize ifAllGranted="ROLE_ATTACHMENT_ATTACHMENT_NEW">
			<li><a class="add" href="${ctx}/attachment/attachment/new" target="navTab" rel="attachment_attachment_edit"><span>添加附件信息</span></a></li>
		</sec:authorize>
			<li class="line">line</li>
		<sec:authorize ifAllGranted="ROLE_ATTACHMENT_ATTACHMENT_DELALL">
			<li><a class="delete" href="${ctx}/attachment/attachment/delAll" target="selectedTodo" rel="ids" postType="string" title="确实要删除这些记录吗?"><span>批量删除</span></a></li>
		</sec:authorize>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
					
				<th orderField="attachName" class=${pageData.compositor.fieldName eq 'attachName' ? pageData.compositor.compositorType : ''}>附件名称</th>
					
				<th orderField="attachDes" class=${pageData.compositor.fieldName eq 'attachDes' ? pageData.compositor.compositorType : ''}>附件描述</th>
					
				<th orderField="attachId" class=${pageData.compositor.fieldName eq 'attachId' ? pageData.compositor.compositorType : ''}>附件ID</th>
					
				<th orderField="attachUri" class=${pageData.compositor.fieldName eq 'attachUri' ? pageData.compositor.compositorType : ''}>附件资源</th>
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" rel="attachment_viewdialog" >
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
						
					<td>${entity.attachName}</td>
						
					<td>${entity.attachDes}</td>
						
					<td>${entity.attachId}</td>
						
					<td>${entity.attachUri}</td>
				
					<td>
					<sec:authorize ifAllGranted="ROLE_ATTACHMENT_ATTACHMENT_DELETE">
						<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/attachment/attachment/delete?id=${entity.id}" class="btnDel">删除</a>
					</sec:authorize>
					<sec:authorize ifAllGranted="ROLE_ATTACHMENT_ATTACHMENT_EDIT">
						<a title="编辑附件信息" target="navTab" rel="attachment_attachment_edit" href="${ctx}/attachment/attachment/edit?id=${entity.id}" class="btnEdit">编辑</a>
					</sec:authorize>
						<a title="查看附件信息" target="navTab" rel="attachment_attachment_view" href="${ctx}/attachment/attachment/view?id=${entity.id}" class="btnView">查看</a>
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
