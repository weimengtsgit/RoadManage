<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/report/reportFresh/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>统计项：</label>
					<tag:enum id="type" inputType="select" defaultValue="" name="filter_EQT_type" enumName="com_reportFresh_type" enumKey="${pageData.filtraMap.EQT_type}" />
				</li>
					
				<li>
					<label>数量：</label>
					<input type="text" name="filter_EQI_count" value="${pageData.filtraMap.EQI_count}"/>
				</li>
			
				<li>
					<label>商铺：</label>
					<input id="report_shopId_name_list" type="hidden" name="shopId.id" value='' />
					<input type="text" name="filter_LIKES_shopId.name" value='${pageData.filtraMap["LIKES_shopId.name"]}' suggestFields="name" suggestUrl="${ctx}/mall/shop/lookupJson" lookupGroup="shopId" />
					<a class="btnLook" href="${ctx}/mall/shop/lookupList" lookupGroup="shopId">查找带回</a>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<li><a class="button" href="${ctx}/report/reportFresh/advancedSearch" target="dialog" mask="true" width="795" height="460" rel="report_reportFresh_advancedSearchList" title="查询框"><span>高级查询</span></a></li>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<sec:authorize ifAllGranted="ROLE_REPORT_REPORTFRESH_NEW">
				<li><a class="add" href="${ctx}/report/reportFresh/new" target="navTab" rel="report_reportFresh_edit"><span>添加最新统计数据</span></a></li>
			</sec:authorize>
				<li class="line">line</li>
			<sec:authorize ifAllGranted="ROLE_REPORT_REPORTFRESH_DELALL">
				<li><a class="delete" href="${ctx}/report/reportFresh/delAll" target="selectedTodo" rel="ids" postType="string" title="确实要删除这些记录吗?"><span>批量删除</span></a></li>
			</sec:authorize>
				<li class="line">line</li>
			<sec:authorize ifAllGranted="ROLE_REPORT_REPORTFRESH_IMPORT">
				<li><a class="add" href="${ctx}/report/reportFresh/importView" rel="report_reportFresh_import" target="dialog" mask="true" width="470" height="230"><span>导入</span></a></li>
			</sec:authorize>
				<li class="line">line</li>
			<sec:authorize ifAllGranted="ROLE_REPORT_REPORTFRESH_EXPORT">
				<li><a class="icon" href="${ctx}/report/reportFresh/exportExcel?exportPageSize=${pageData.pagination.totalCount}&excelName=最新统计数据明细&sheetName=最新统计数据明细&title=最新统计数据明细" target="dwzExport" target="navTab" title="实要导出这些记录吗?"><span>导出</span></a></li>
			</sec:authorize>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
			
				<th orderField="type" class=${pageData.compositor.fieldName eq 'type' ? pageData.compositor.compositorType : ''}>统计项</th>
					
				<th orderField="count" class=${pageData.compositor.fieldName eq 'count' ? pageData.compositor.compositorType : ''}>数量</th>
			
				<th orderField="shopId.name" class="${pageData.compositor.fieldName eq 'shopId.name' ? pageData.compositor.compositorType : ''}">商铺</th>
				
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" rel="report_viewdialog" >
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize} </td>
				
					<td><tag:enum tagType="view" enumName="com_reportFresh_type" enumKey="${entity.type}" /></td>
						
					<td>${entity.count}</td>
				
					<td>
					<c:if test="${not empty entity.shopId.name}">
					<a class="ghbutton search right"  href="${ctx}/mall/shop/view?id=${entity.shopId.id}" target="dialog"  mask="true" rel="report_reportFresh_lookupdialog"  title="查看商铺">${entity.shopId.name}</a>
					</c:if>
					</td>
				
					
					<td>
						<sec:authorize ifAllGranted="ROLE_REPORT_REPORTFRESH_DELETE">
							<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/report/reportFresh/delete?id=${entity.id}" class="btnDel">删除</a>
						</sec:authorize>
						<sec:authorize ifAllGranted="ROLE_REPORT_REPORTFRESH_EDIT">
							<a title="编辑最新统计数据" target="navTab" rel="report_reportFresh_edit" href="${ctx}/report/reportFresh/edit?id=${entity.id}" class="btnEdit">编辑</a>
						</sec:authorize>
						<a title="查看最新统计数据" target="navTab" rel="report_reportFresh_view" href="${ctx}/report/reportFresh/view?id=${entity.id}" class="btnView">查看</a>
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
