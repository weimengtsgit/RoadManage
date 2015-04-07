<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form rel="pagerForm" id="pagerForm" method="post" action="${ctx}/helpdoc/helpDoc/lookupList" onsubmit="return dwzSearch(this, 'dialog');">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>文档标题：</label>
					<input type="text" name="filter_LIKES_docTitle" value="${pageData.filtraMap.LIKES_docTitle}"/>
				</li>
			
				<li>
					<label>所属菜单：</label>
					<input id="helpdoc_sysMenu_menuDesc" type="hidden" name="sysMenu.id" value="${helpDoc.sysMenu.id}"/>
					<input type="text" name="sysMenu.menuDesc" value="${pageData.filtraMap.EQS_sysMenu}" suggestFields="menuDesc" suggestUrl="${ctx}/system/sysMenu/lookupJson" lookupGroup="sysMenu"  onchange="if(!this.value) document.getElementById('helpdoc_sysMenu_menuDesc').value=''" />
					<a class="btnLook" href="${ctx}/system/sysMenu/lookupList" lookupGroup="sysMenu">查找带回</a>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive" style="float:right;"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<%-- <li><a class="button" href="${ctx}/helpdoc/helpDoc/advancedSearch" target="dialog" title="查询框"><span>高级查询</span></a></li> --%>
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
					
				<th orderField="docTitle" class="${pageData.compositor.fieldName eq 'docTitle.' ? pageData.compositor.compositorType : ''}">文档标题</th>
					
				<th orderField="docDesc" class="${pageData.compositor.fieldName eq 'docDesc.' ? pageData.compositor.compositorType : ''}">文档描述</th>
			
				<th orderField="sysMenu.menuDesc" class="${pageData.compositor.fieldName eq 'sysMenu.menuDesc' ? pageData.compositor.compositorType : ''}">所属菜单</th>
				
				<th width="90">查找带回</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}">
				<tr>
						
					<td>${entity.docTitle}</td>
						
					<td>${entity.docDesc}</td>
				
					<td>
					<c:if test="${not empty entity.sysMenu.menuDesc}">
					<a class="ghbutton search right" href="${ctx}/system/sysMenu/view?id=${entity.sysMenu.id}" target="dialog" mask="true" rel="helpdoc_helpDoc_dialog" title="查看所属菜单详情">${entity.sysMenu.menuDesc}</a>
					</c:if>
					</td>
				
					<td>
						<a class="btnSelect" href="javascript:SLAVEJS.getLoopupJson('${ctx}/helpdoc/helpDoc/viewJson?id=${entity.id}')" title="查找带回">选择</a>
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
