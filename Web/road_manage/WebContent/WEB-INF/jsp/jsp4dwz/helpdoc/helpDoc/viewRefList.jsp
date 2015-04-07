<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return dwzSearch(this, 'dialog');" method="post" action="${ctx}/helpdoc/helpDoc/viewRefList">
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
			
				
					<input class="hiddenItem"  type="hidden" name="filter_EQI_sysMenu.id" value='${pageData.filtraMap["EQI_sysMenu.id"]}' />
				
			
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
					
				<th  orderField="docTitle" class=${pageData.compositor.fieldName eq 'docTitle' ? pageData.compositor.compositorType : ''}>文档标题</th>
					
				<th  orderField="docDesc" class=${pageData.compositor.fieldName eq 'docDesc' ? pageData.compositor.compositorType : ''}>文档描述</th>
			
				<th orderField="sysMenu.menuDesc" class="${pageData.compositor.fieldName eq 'sysMenu.menuDesc' ? pageData.compositor.compositorType : ''}">所属菜单</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" >
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
						
					<td>${entity.docTitle}</td>
						
					<td>${entity.docDesc}</td>
				
					<td>
					<c:if test="${not empty entity.sysMenu.menuDesc}">
					<a class="ghbutton search right" href="${ctx}/system/sysMenu/view?id=${entity.sysMenu.id}" target="dialog" mask="true" rel="helpdoc_helpDoc_lookupdialog" title="查看所属菜单详情">${entity.sysMenu.menuDesc}</a>
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
