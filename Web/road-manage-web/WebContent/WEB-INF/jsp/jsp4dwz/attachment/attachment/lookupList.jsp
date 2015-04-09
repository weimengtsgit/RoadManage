<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form rel="pagerForm" id="pagerForm" method="post" action="${ctx}/attachment/attachment/lookupList" onsubmit="return dwzSearch(this, 'dialog');">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
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
				<li><div class="buttonActive" style="float:right;"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<%-- <li><a class="button" href="${ctx}/attachment/attachment/advancedSearch" target="dialog" title="查询框"><span>高级查询</span></a></li> --%>
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
					
				<th orderField="attachName" class="${pageData.compositor.fieldName eq 'attachName.' ? pageData.compositor.compositorType : ''}">附件名称</th>
					
				<th orderField="attachDes" class="${pageData.compositor.fieldName eq 'attachDes.' ? pageData.compositor.compositorType : ''}">附件描述</th>
					
				<th orderField="attachId" class="${pageData.compositor.fieldName eq 'attachId.' ? pageData.compositor.compositorType : ''}">附件ID</th>
					
				<th orderField="attachUri" class="${pageData.compositor.fieldName eq 'attachUri.' ? pageData.compositor.compositorType : ''}">附件资源</th>
				
				<th width="90">查找带回</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}">
				<tr>
						
					<td>${entity.attachName}</td>
						
					<td>${entity.attachDes}</td>
						
					<td>${entity.attachId}</td>
						
					<td>${entity.attachUri}</td>
				
					<td>
						<a class="btnSelect" href="javascript:SLAVEJS.getLoopupJson('${ctx}/attachment/attachment/viewJson?id=${entity.id}')" title="查找带回">选择</a>
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
