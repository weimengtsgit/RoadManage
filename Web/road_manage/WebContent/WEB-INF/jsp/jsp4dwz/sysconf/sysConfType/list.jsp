<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/sysconf/sysConfType/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>配置名称：</label>
					<input type="text" name="filter_LIKES_confName" value="${pageData.filtraMap.LIKES_confName}"/>
				</li>
			
				<li>
					<label>配置描述：</label>
					<input type="text" name="filter_LIKES_confDes" value="${pageData.filtraMap.LIKES_confDes}"/>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<li><a class="button" href="${ctx}/sysconf/sysConfType/advancedSearch" target="dialog" mask="true" title="查询框"><span>高级查询</span></a></li>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
		<sec:authorize ifAllGranted="ROLE_SYSCONF_SYSCONFTYPE_NEW">
			<li><a class="add" href="${ctx}/sysconf/sysConfType/new" target="navTab" rel="sysconf_sysConfType_edit"><span>添加配置类型</span></a></li>
		</sec:authorize>
			<li class="line">line</li>
		<sec:authorize ifAllGranted="ROLE_SYSCONF_SYSCONFTYPE_DELALL">
			<li><a class="delete" href="${ctx}/sysconf/sysConfType/delAll" target="selectedTodo" rel="ids" postType="string" title="确实要删除这些记录吗?"><span>批量删除</span></a></li>
		</sec:authorize>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
					
				<th orderField="confName" class=${pageData.compositor.fieldName eq 'confName' ? pageData.compositor.compositorType : ''}>配置名称</th>
					
				<th orderField="confDes" class=${pageData.compositor.fieldName eq 'confDes' ? pageData.compositor.compositorType : ''}>配置描述</th>
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" rel="sysconf_viewdialog" >
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
						
					<td>${entity.confName}</td>
						
					<td>${entity.confDes}</td>
				
					<td>
					<sec:authorize ifAllGranted="ROLE_SYSCONF_SYSCONFTYPE_DELETE">
						<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/sysconf/sysConfType/delete?id=${entity.id}" class="btnDel">删除</a>
					</sec:authorize>
					<sec:authorize ifAllGranted="ROLE_SYSCONF_SYSCONFTYPE_EDIT">
						<a title="编辑配置类型" target="navTab" rel="sysconf_sysConfType_edit" href="${ctx}/sysconf/sysConfType/edit?id=${entity.id}" class="btnEdit">编辑</a>
					</sec:authorize>
						<a title="查看配置类型" target="navTab" rel="sysconf_sysConfType_view" href="${ctx}/sysconf/sysConfType/view?id=${entity.id}" class="btnView">查看</a>
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
