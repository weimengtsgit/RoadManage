<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form rel="pagerForm" id="pagerForm" method="post" action="${ctx}/system/sysDept/lookupList" onsubmit="return dwzSearch(this, 'dialog');">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>部门名称：</label>
					<input type="text" name="filter_LIKES_deptName" value="${pageData.filtraMap.LIKES_deptName}"/>
				</li>
			
				<li>
					<label>部门编号：</label>
					<input type="text" name="filter_LIKES_deptNum" value="${pageData.filtraMap.LIKES_deptNum}"/>
				</li>
			
				<li>
					<label>上级部门：</label>
					<input id="system_parentId_deptName" type="hidden" name="parentId.id" value="${sysDept.parentId.id}"/>
					<input type="text" name="parentId.deptName" value="${pageData.filtraMap.EQS_parentId}" suggestFields="deptName" suggestUrl="${ctx}/system/sysDept/lookupJson" lookupGroup="parentId"  onchange="if(!this.value) document.getElementById('system_parentId_deptName').value=''" />
					<a class="btnLook" href="${ctx}/system/sysDept/lookupList" lookupGroup="parentId">查找带回</a>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive" style="float:right;"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<%-- <li><a class="button" href="${ctx}/system/sysDept/advancedSearch" target="dialog" title="查询框"><span>高级查询</span></a></li> --%>
			</ul>
		</div>
	</div>
	</div>
</div>
</form>
<div class="pageContent">
	<table class="table" layoutH="138" targetType="dialog" width="100%">
		<thead>
			<tr>
					
				<th orderField="deptName" class="${pageData.compositor.fieldName eq 'deptName.' ? pageData.compositor.compositorType : ''}">部门名称</th>
					
				<th orderField="deptNum" class="${pageData.compositor.fieldName eq 'deptNum.' ? pageData.compositor.compositorType : ''}">部门编号</th>
					
				<th orderField="deptAddr" class="${pageData.compositor.fieldName eq 'deptAddr.' ? pageData.compositor.compositorType : ''}">部门地址</th>
			
				<th orderField="parentId.deptName" class="${pageData.compositor.fieldName eq 'parentId.deptName' ? pageData.compositor.compositorType : ''}">上级部门</th>
				
				<th width="90">查找带回</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}">
				<tr>
						
					<td>${entity.deptName}</td>
						
					<td>${entity.deptNum}</td>
						
					<td>${entity.deptAddr}</td>
				
					<td><a href="${ctx}/system/sysDept/view?id=${entity.parentId.id}" target="dialog" rel="system_sysDept_dialog" title="${entity.parentId.deptName}">${entity.parentId.deptName}</a></td>
				
					<td>
						<a class="btnSelect" href="javascript:SLAVEJS.getLoopupJson('${ctx}/system/sysDept/viewJson?id=${entity.id}')" title="查找带回">选择</a>
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
</div>
