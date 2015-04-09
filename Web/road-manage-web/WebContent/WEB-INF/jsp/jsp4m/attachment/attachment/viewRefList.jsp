<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return dwzSearch(this, 'dialog');" method="post" action="${ctx}/attachment/attachment/viewRefList">
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
					
				<th  orderField="attachName" class=${pageData.compositor.fieldName eq 'attachName' ? pageData.compositor.compositorType : ''}>附件名称</th>
					
				<th  orderField="attachDes" class=${pageData.compositor.fieldName eq 'attachDes' ? pageData.compositor.compositorType : ''}>附件描述</th>
					
				<th  orderField="attachId" class=${pageData.compositor.fieldName eq 'attachId' ? pageData.compositor.compositorType : ''}>附件ID</th>
					
				<th  orderField="attachUri" class=${pageData.compositor.fieldName eq 'attachUri' ? pageData.compositor.compositorType : ''}>附件资源</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" >
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
						
					<td>${entity.attachName}</td>
						
					<td>${entity.attachDes}</td>
						
					<td>${entity.attachId}</td>
						
					<td>${entity.attachUri}</td>
				
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
