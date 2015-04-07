<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>


<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/system/sysEnumValue/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>枚举键：</label>
					<input type="text" name="filter_LIKES_enumKey" value="${pageData.filtraMap.LIKES_enumKey}"/>
				</li>
			
				<li>
					<label>枚举值：</label>
					<input type="text" name="filter_LIKES_enumVal" value="${pageData.filtraMap.LIKES_enumVal}"/>
				</li>
					
					<input class="hiddenItem" type="hidden" name="filter_EQI_enumSeq" value="${pageData.filtraMap.EQI_enumSeq}"/>
			
					<input id="system_enumId_enumDesc_list" type="hidden" name="filter_EQI_enumId.id" value='${pageData.filtraMap["EQI_enumId.id"]}' />
			
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
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${ctx}/system/sysEnumValue/new?pid=${pageData.filtraMap["EQI_enumId.id"]}" target="navTab" rel="system_sysEnumValue_edit"><span>添加枚举值</span></a></li>
			<li class="line">line</li>
			<li><a class="delete" href="${ctx}/system/sysEnumValue/delAll" target="selectedTodo" rel="ids" postType="string" title="确实要删除这些记录吗?"><span>批量删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
					
				<th orderField="enumKey" class=${pageData.compositor.fieldName eq 'enumKey' ? pageData.compositor.compositorType : ''}>枚举键</th>
					
				<th orderField="enumVal" class=${pageData.compositor.fieldName eq 'enumVal' ? pageData.compositor.compositorType : ''}>枚举值</th>
					
				<th orderField="enumSeq" class=${pageData.compositor.fieldName eq 'enumSeq' ? pageData.compositor.compositorType : ''}>枚举序列</th>
			
				<th orderField="enumId.enumDesc" class="${pageData.compositor.fieldName eq 'enumId.enumDesc' ? pageData.compositor.compositorType : ''}">枚举对象</th>
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" title="查看枚举值-${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}">
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
						
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
					
					<td>${entity.enumKey}</td>
						
					<td>${entity.enumVal}</td>
						
					<td>${entity.enumSeq}</td>
				
					<td><a href="${ctx}/system/sysEnum/view?id=${entity.enumId.id}" target="dialog" rel="system_sysEnumValue_dialog" title="${entity.enumId.enumDesc}">${entity.enumId.enumDesc}</a></td>
				
					<td>
						<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/system/sysEnumValue/delete?id=${entity.id}" class="btnDel">删除</a>
						<a title="编辑枚举值" target="navTab" rel="system_sysEnumValue_edit" href="${ctx}/system/sysEnumValue/edit?id=${entity.id}" class="btnEdit">编辑</a>
						<a title="查看枚举值" target="navTab" rel="system_sysEnumValue_view" href="${ctx}/system/sysEnumValue/view?id=${entity.id}" class="btnView">查看</a>
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
