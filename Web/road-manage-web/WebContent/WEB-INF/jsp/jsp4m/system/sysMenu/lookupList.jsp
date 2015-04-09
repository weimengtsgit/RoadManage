<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form rel="pagerForm" id="pagerForm" method="post" action="${ctx}/system/sysMenu/lookupList" onsubmit="return dwzSearch(this, 'dialog');">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>菜单名称：</label>
					<input type="text" name="filter_LIKES_menuDesc" value="${pageData.filtraMap.LIKES_menuDesc}"/>
				</li>
			
				<li>
					<label>菜单类型：</label>
					<tag:enum id="menuType" defaultValue="" name="filter_EQS_menuType" enumName="menuType" enumKey="${pageData.filtraMap.EQS_menuType}" />
				</li>
			
				<li>
					<label>是否IFRAME：</label>
					<tag:enum id="external" defaultValue="" name="filter_EQI_external" enumName="isOrNot" enumKey="${pageData.filtraMap.EQI_external}" />
				</li>
			
				<li>
					<label>打开目标：</label>
					<tag:enum id="target" defaultValue="" name="filter_EQS_target" enumName="target" enumKey="${pageData.filtraMap.EQS_target}" />
				</li>
			
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive" style="float:right;"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<%-- <li><a class="button" href="${ctx}/system/sysMenu/advancedSearch" target="dialog" title="查询框"><span>高级查询</span></a></li> --%>
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
					
				<th orderField="menuDesc" class="${pageData.compositor.fieldName eq 'menuDesc.' ? pageData.compositor.compositorType : ''}">菜单名称</th>
					
				<th orderField="menuType" class="${pageData.compositor.fieldName eq 'menuType.' ? pageData.compositor.compositorType : ''}">菜单类型</th>
					
				<th orderField="menuName" class="${pageData.compositor.fieldName eq 'menuName.' ? pageData.compositor.compositorType : ''}">菜单URL</th>
					
				<th orderField="menuSeq" class="${pageData.compositor.fieldName eq 'menuSeq.' ? pageData.compositor.compositorType : ''}">菜单序列</th>
					
				<th orderField="authorityName" class="${pageData.compositor.fieldName eq 'authorityName.' ? pageData.compositor.compositorType : ''}">权限名称</th>
					
				<th orderField="external" class="${pageData.compositor.fieldName eq 'external.' ? pageData.compositor.compositorType : ''}">是否IFRAME</th>
					
				<th orderField="target" class="${pageData.compositor.fieldName eq 'target.' ? pageData.compositor.compositorType : ''}">打开目标</th>
			
				
				<th width="90">查找带回</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}">
				<tr>
						
					<td>${entity.menuDesc}</td>
				
					<td><tag:enum isTag="false" id="menuType" name="menuType" enumName="menuType" enumKey="${entity.menuType}" /></td>		
						
					<td>${entity.menuName}</td>
						
					<td>${entity.menuSeq}</td>
						
					<td>${entity.authorityName}</td>
				
					<td><tag:enum isTag="false" id="external" name="external" enumName="isOrNot" enumKey="${entity.external}" /></td>		
				
					<td><tag:enum isTag="false" id="target" name="target" enumName="target" enumKey="${entity.target}" /></td>		
				
					
					<td>
						<a class="btnSelect" href="javascript:SLAVEJS.getLoopupJson('${ctx}/system/sysMenu/viewJson?id=${entity.id}')" title="查找带回">选择</a>
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
