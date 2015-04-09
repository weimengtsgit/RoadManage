<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return dwzSearch(this, 'dialog');" method="post" action="${ctx}/system/sysMenu/viewRefList">
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
					<tag:enum id="menuType" inputType="SELECT" defaultValue="" name="filter_EQS_menuType" enumName="menuType" enumKey="${pageData.filtraMap.EQS_menuType}" />
				</li>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_menuName" value="${pageData.filtraMap.LIKES_menuName}"/>
					
					<input class="hiddenItem" type="hidden" name="filter_EQI_menuSeq" value="${pageData.filtraMap.EQI_menuSeq}"/>
			
				<li>
					<label>是否IFRAME：</label>
					<tag:enum id="external" inputType="SELECT" defaultValue="" name="filter_EQI_external" enumName="isOrNot" enumKey="${pageData.filtraMap.EQI_external}" />
				</li>
			
				<li>
					<label>打开目标：</label>
					<tag:enum id="target" inputType="SELECT" defaultValue="" name="filter_EQS_target" enumName="target" enumKey="${pageData.filtraMap.EQS_target}" />
				</li>
			
				
					<input class="hiddenItem"  type="hidden" name="filter_EQI_parentId.id" value='${pageData.filtraMap["EQI_parentId.id"]}' />
				
			
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
					
				<th  orderField="menuDesc" class=${pageData.compositor.fieldName eq 'menuDesc' ? pageData.compositor.compositorType : ''}>菜单名称</th>
			
				<th orderField="menuType" class=${pageData.compositor.fieldName eq 'menuType' ? pageData.compositor.compositorType : ''}>菜单类型</th>
					
				<th  orderField="menuName" class=${pageData.compositor.fieldName eq 'menuName' ? pageData.compositor.compositorType : ''}>菜单URL</th>
					
				<th  orderField="menuSeq" class=${pageData.compositor.fieldName eq 'menuSeq' ? pageData.compositor.compositorType : ''}>菜单序列</th>
					
				<th  orderField="authorityName" class=${pageData.compositor.fieldName eq 'authorityName' ? pageData.compositor.compositorType : ''}>权限名称</th>
			
				<th orderField="external" class=${pageData.compositor.fieldName eq 'external' ? pageData.compositor.compositorType : ''}>是否IFRAME</th>
			
				<th orderField="target" class=${pageData.compositor.fieldName eq 'target' ? pageData.compositor.compositorType : ''}>打开目标</th>
			
				<th orderField="parentId.menuDesc" class="${pageData.compositor.fieldName eq 'parentId.menuDesc' ? pageData.compositor.compositorType : ''}">上级菜单</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" >
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
						
					<td>${entity.menuDesc}</td>
				
					<td><tag:enum isTag="false" tagType="view" id="menuType" name="menuType" enumName="menuType" enumKey="${entity.menuType}" /></td>
						
					<td>${entity.menuName}</td>
						
					<td>${entity.menuSeq}</td>
						
					<td>${entity.authorityName}</td>
				
					<td><tag:enum isTag="false" tagType="view" id="external" name="external" enumName="isOrNot" enumKey="${entity.external}" /></td>
				
					<td><tag:enum isTag="false" tagType="view" id="target" name="target" enumName="target" enumKey="${entity.target}" /></td>
				
					<td>
					<c:if test="${not empty entity.parentId.menuDesc}">
					<a class="ghbutton search right" href="${ctx}/system/sysMenu/view?id=${entity.parentId.id}" target="dialog" mask="true" rel="system_sysMenu_lookupdialog" title="查看上级菜单详情">${entity.parentId.menuDesc}</a>
					</c:if>
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
