<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/customer/statShow/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>终端MAC：</label>
					<input type="text" name="filter_LIKES_termMac" value="${pageData.filtraMap.LIKES_termMac}"/>
				</li>
			
				<li>
					<label>AP设备MAC：</label>
					<input type="text" name="filter_LIKES_apMac" value="${pageData.filtraMap.LIKES_apMac}"/>
				</li>
			
				<li>
					<label>终端IP：</label>
					<input type="text" name="filter_LIKES_termIp" value="${pageData.filtraMap.LIKES_termIp}"/>
				</li>
			
				<li>
					<label>USER-AGENT：</label>
					<input type="text" name="filter_LIKES_userAgent" value="${pageData.filtraMap.LIKES_userAgent}"/>
				</li>
			
				<li>
					<label>访问来源：</label>
					<tag:enum id="accessType" inputType="select" defaultValue="" name="filter_EQT_accessType" enumName="com_statShow_accessType" enumKey="${pageData.filtraMap.EQS_accessType}" />
				</li>
			
				<li>
					<label>时间：</label>
					<input style="width:116px;" id="statTime" name="filter_GED_statTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_statTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input style="width:116px;" id="statTime" name="filter_LED_statTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_statTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
					
				<li>
					<label>资源ID：</label>
					<input type="text" name="filter_EQI_resourceId" value="${pageData.filtraMap.EQI_resourceId}"/>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
<%-- 				<li><a class="button" href="${ctx}/customer/statShow/advancedSearch" target="dialog" mask="true" width="795" height="460" rel="customer_statShow_advancedSearchList" title="查询框"><span>高级查询</span></a></li> --%>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
<%-- 			<sec:authorize ifAllGranted="ROLE_CUSTOMER_STATSHOW_NEW"> --%>
<%-- 				<li><a class="add" href="${ctx}/customer/statShow/new" target="navTab" rel="customer_statShow_edit"><span>添加内容展示记录</span></a></li> --%>
<%-- 			</sec:authorize> --%>
<!-- 				<li class="line">line</li> -->
<%-- 			<sec:authorize ifAllGranted="ROLE_CUSTOMER_STATSHOW_DELALL"> --%>
<%-- 				<li><a class="delete" href="${ctx}/customer/statShow/delAll" target="selectedTodo" rel="ids" postType="string" title="确实要删除这些记录吗?"><span>批量删除</span></a></li> --%>
<%-- 			</sec:authorize> --%>
<!-- 				<li class="line">line</li> -->
<%-- 			<sec:authorize ifAllGranted="ROLE_CUSTOMER_STATSHOW_IMPORT"> --%>
<%-- 				<li><a class="add" href="${ctx}/customer/statShow/importView" rel="customer_statShow_import" target="dialog" mask="true" width="470" height="230"><span>导入</span></a></li> --%>
<%-- 			</sec:authorize> --%>
<!-- 				<li class="line">line</li> -->
			<sec:authorize ifAllGranted="ROLE_CUSTOMER_STATSHOW_EXPORT">
				<li><a class="icon" href="${ctx}/customer/statShow/exportExcel?exportPageSize=${pageData.pagination.totalCount}&excelName=内容展示记录明细&sheetName=内容展示记录明细&title=内容展示记录明细" target="dwzExport" target="navTab" title="实要导出这些记录吗?"><span>导出</span></a></li>
			</sec:authorize>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
					
				<th orderField="termMac" class=${pageData.compositor.fieldName eq 'termMac' ? pageData.compositor.compositorType : ''}>终端MAC</th>
					
				<th orderField="apMac" class=${pageData.compositor.fieldName eq 'apMac' ? pageData.compositor.compositorType : ''}>AP设备MAC</th>
					
				<th orderField="termIp" class=${pageData.compositor.fieldName eq 'termIp' ? pageData.compositor.compositorType : ''}>终端IP</th>
					
				<th orderField="userAgent" class=${pageData.compositor.fieldName eq 'userAgent' ? pageData.compositor.compositorType : ''}>USER-AGENT</th>
			
				<th orderField="accessType" class=${pageData.compositor.fieldName eq 'accessType' ? pageData.compositor.compositorType : ''}>访问来源</th>
					
				<th orderField="statTime" class=${pageData.compositor.fieldName eq 'statTime' ? pageData.compositor.compositorType : ''}>时间</th>
					
				<th orderField="resourceId" class=${pageData.compositor.fieldName eq 'resourceId' ? pageData.compositor.compositorType : ''}>资源ID</th>
				
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" rel="customer_viewdialog" >
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize} </td>
						
					<td>${entity.termMac}</td>
						
					<td>${entity.apMac}</td>
						
					<td>${entity.termIp}</td>
						
					<td>${entity.userAgent}</td>
				
					<td><tag:enum tagType="view" enumName="com_statShow_accessType" enumKey="${entity.accessType}" /></td>
				
					<td><fmt:formatDate value="${entity.statTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
						
					<td>${entity.resourceId}</td>
				
					
					<td>
						<sec:authorize ifAllGranted="ROLE_CUSTOMER_STATSHOW_DELETE">
							<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/customer/statShow/delete?id=${entity.id}" class="btnDel">删除</a>
						</sec:authorize>
						<sec:authorize ifAllGranted="ROLE_CUSTOMER_STATSHOW_EDIT">
							<a title="编辑内容展示记录" target="navTab" rel="customer_statShow_edit" href="${ctx}/customer/statShow/edit?id=${entity.id}" class="btnEdit">编辑</a>
						</sec:authorize>
						<a title="查看内容展示记录" target="navTab" rel="customer_statShow_view" href="${ctx}/customer/statShow/view?id=${entity.id}" class="btnView">查看</a>
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
