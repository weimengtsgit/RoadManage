<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form rel="pagerForm" id="pagerForm" method="post" action="${ctx}/system/sysEnumValue/lookupList" onsubmit="return dwzSearch(this, 'dialog');">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
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
			
				<li>
					<label>枚举对象：</label>
					<input id="system_enumId_enumDesc" type="hidden" name="enumId.id" value="${sysEnumValue.enumId.id}"/>
					<input type="text" name="enumId.enumDesc" value="${pageData.filtraMap.EQS_enumId}" suggestFields="enumDesc" suggestUrl="${ctx}/system/sysEnum/lookupJson" lookupGroup="enumId"  onchange="if(!this.value) document.getElementById('system_enumId_enumDesc').value=''" />
					<a class="btnLook" href="${ctx}/system/sysEnum/lookupList" lookupGroup="enumId">查找带回</a>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive" style="float:right;"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<%-- <li><a class="button" href="${ctx}/system/sysEnumValue/advancedSearch" target="dialog" title="查询框"><span>高级查询</span></a></li> --%>
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
					
				<th orderField="enumKey" class="${pageData.compositor.fieldName eq 'enumKey.' ? pageData.compositor.compositorType : ''}">枚举键</th>
					
				<th orderField="enumVal" class="${pageData.compositor.fieldName eq 'enumVal.' ? pageData.compositor.compositorType : ''}">枚举值</th>
					
				<th orderField="enumSeq" class="${pageData.compositor.fieldName eq 'enumSeq.' ? pageData.compositor.compositorType : ''}">枚举序列</th>
			
				<th orderField="enumId.enumDesc" class="${pageData.compositor.fieldName eq 'enumId.enumDesc' ? pageData.compositor.compositorType : ''}">枚举对象</th>
				
				<th width="90">查找带回</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}">
				<tr>
						
					<td>${entity.enumKey}</td>
						
					<td>${entity.enumVal}</td>
						
					<td>${entity.enumSeq}</td>
				
					<td><a href="${ctx}/system/sysEnum/view?id=${entity.enumId.id}" target="dialog" rel="system_sysEnumValue_dialog" title="${entity.enumId.enumDesc}">${entity.enumId.enumDesc}</a></td>
				
					<td>
						<a class="btnSelect" href="javascript:SLAVEJS.getLoopupJson('${ctx}/system/sysEnumValue/viewJson?id=${entity.id}')" title="查找带回">选择</a>
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
