<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/mall/messageTemplate/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>模版名称：</label>
					<input type="text" name="filter_LIKES_name" value="${pageData.filtraMap.LIKES_name}"/>
				</li>
			
				<li>
					<label>模版内容：</label>
					<input type="text" name="filter_LIKES_content" value="${pageData.filtraMap.LIKES_content}"/>
				</li>
			
					<input class="hiddenItem" id="mall_shop_name_list" type="hidden" name="filter_EQI_shop.id" value='${pageData.filtraMap["EQI_shop.id"]}' />
					<input class="hiddenItem" type="hidden" name="shop.name" value='${pageData.allMap["shop.name"]}' suggestFields="name" suggestUrl="${ctx}/mall/shop/lookupJson" lookupGroup="shop"  onchange="if(!this.value) document.getElementById('mall_shop_name_list').value=''" />
			
					<input class="hiddenItem" id="mall_mall_name_list" type="hidden" name="filter_EQI_mall.id" value='${pageData.filtraMap["EQI_mall.id"]}' />
					<input class="hiddenItem" type="hidden" name="mall.name" value='${pageData.allMap["mall.name"]}' suggestFields="name" suggestUrl="${ctx}/mall/mall/lookupJson" lookupGroup="mall"  onchange="if(!this.value) document.getElementById('mall_mall_name_list').value=''" />
			
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
			<sec:authorize ifAllGranted="ROLE_MALL_MESSAGETEMPLATE_NEW">
				<li><a class="add" href="${ctx}/mall/messageTemplate/new" target="navTab" rel="mall_messageTemplate_edit"><span>添加短信模版</span></a></li>
			</sec:authorize>
				<li class="line">line</li>
			<sec:authorize ifAllGranted="ROLE_MALL_MESSAGETEMPLATE_DELALL">
				<li><a class="delete" href="${ctx}/mall/messageTemplate/delAll" target="selectedTodo" rel="ids" postType="string" title="确实要删除这些记录吗?"><span>批量删除</span></a></li>
			</sec:authorize>
<!-- 				<li class="line">line</li> -->
<%-- 			<sec:authorize ifAllGranted="ROLE_MALL_MESSAGETEMPLATE_IMPORT"> --%>
<%-- 				<li><a class="add" href="${ctx}/mall/messageTemplate/importView" rel="mall_messageTemplate_import" target="dialog" mask="true" width="470" height="230"><span>导入</span></a></li> --%>
<%-- 			</sec:authorize> --%>
<!-- 				<li class="line">line</li> -->
<%-- 			<sec:authorize ifAllGranted="ROLE_MALL_MESSAGETEMPLATE_EXPORT"> --%>
<%-- 				<li><a class="icon" href="${ctx}/mall/messageTemplate/exportExcel?exportPageSize=${pageData.pagination.totalCount}&excelName=短信模版明细&sheetName=短信模版明细&title=短信模版明细" target="dwzExport" target="navTab" title="实要导出这些记录吗?"><span>导出</span></a></li> --%>
<%-- 			</sec:authorize> --%>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
					
				<th orderField="name" class=${pageData.compositor.fieldName eq 'name' ? pageData.compositor.compositorType : ''}>模版名称</th>
					
				<th orderField="content" class=${pageData.compositor.fieldName eq 'content' ? pageData.compositor.compositorType : ''}>模版内容</th>
				
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" rel="mall_viewdialog" >
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize} </td>
						
					<td>${entity.name}</td>
						
					<td>${entity.content}</td>
				
					
					<td>
						<sec:authorize ifAllGranted="ROLE_MALL_MESSAGETEMPLATE_DELETE">
							<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/mall/messageTemplate/delete?id=${entity.id}" class="btnDel">删除</a>
						</sec:authorize>
						<sec:authorize ifAllGranted="ROLE_MALL_MESSAGETEMPLATE_EDIT">
							<a title="编辑短信模版" target="navTab" rel="mall_messageTemplate_edit" href="${ctx}/mall/messageTemplate/edit?id=${entity.id}" class="btnEdit">编辑</a>
						</sec:authorize>
						<a title="查看短信模版" target="navTab" rel="mall_messageTemplate_view" href="${ctx}/mall/messageTemplate/view?id=${entity.id}" class="btnView">查看</a>
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
