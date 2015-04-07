<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/report/reportDay/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>日期：</label>
					<input style="width:116px;" id="date" name="filter_GED_date" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_date}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input style="width:116px;" id="date" name="filter_LED_date" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_date}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
					
				<li>
					<label>宣传页展示数(PV)：</label>
					<input type="text" name="filter_EQI_pv" value="${pageData.filtraMap.EQI_pv}"/>
				</li>
					
				<li>
					<label>无线网络客流量（UV）：</label>
					<input type="text" name="filter_EQI_uv" value="${pageData.filtraMap.EQI_uv}"/>
				</li>
					
				<li>
					<label>手机注册用户数：</label>
					<input type="text" name="filter_EQI_newUserCount" value="${pageData.filtraMap.EQI_newUserCount}"/>
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
				<li><a class="button" href="${ctx}/report/reportDay/advancedSearch" target="dialog" mask="true" width="795" height="460" rel="report_reportDay_advancedSearchList" title="查询框"><span>高级查询</span></a></li>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<sec:authorize ifAllGranted="ROLE_REPORT_REPORTDAY_NEW">
				<li><a class="add" href="${ctx}/report/reportDay/new" target="navTab" rel="report_reportDay_edit"><span>添加日报表</span></a></li>
			</sec:authorize>
				<li class="line">line</li>
			<sec:authorize ifAllGranted="ROLE_REPORT_REPORTDAY_DELALL">
				<li><a class="delete" href="${ctx}/report/reportDay/delAll" target="selectedTodo" rel="ids" postType="string" title="确实要删除这些记录吗?"><span>批量删除</span></a></li>
			</sec:authorize>
				<li class="line">line</li>
			<sec:authorize ifAllGranted="ROLE_REPORT_REPORTDAY_IMPORT">
				<li><a class="add" href="${ctx}/report/reportDay/importView" rel="report_reportDay_import" target="dialog" mask="true" width="470" height="230"><span>导入</span></a></li>
			</sec:authorize>
				<li class="line">line</li>
			<sec:authorize ifAllGranted="ROLE_REPORT_REPORTDAY_EXPORT">
				<li><a class="icon" href="${ctx}/report/reportDay/exportExcel?exportPageSize=${pageData.pagination.totalCount}&excelName=日报表明细&sheetName=日报表明细&title=日报表明细" target="dwzExport" target="navTab" title="实要导出这些记录吗?"><span>导出</span></a></li>
			</sec:authorize>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
					
				<th orderField="date" class=${pageData.compositor.fieldName eq 'date' ? pageData.compositor.compositorType : ''}>日期</th>
					
				<th orderField="pv" class=${pageData.compositor.fieldName eq 'pv' ? pageData.compositor.compositorType : ''}>宣传页展示数(PV)</th>
					
				<th orderField="uv" class=${pageData.compositor.fieldName eq 'uv' ? pageData.compositor.compositorType : ''}>无线网络客流量（UV）</th>
					
				<th orderField="newUserCount" class=${pageData.compositor.fieldName eq 'newUserCount' ? pageData.compositor.compositorType : ''}>手机注册用户数</th>
			
				<th orderField="shopId.name" class="${pageData.compositor.fieldName eq 'shopId.name' ? pageData.compositor.compositorType : ''}">商铺</th>
				
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" rel="report_viewdialog" >
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize} </td>
				
					<td><fmt:formatDate value="${entity.date}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
						
					<td>${entity.pv}</td>
						
					<td>${entity.uv}</td>
						
					<td>${entity.newUserCount}</td>
				
					<td>
					<c:if test="${not empty entity.shopId.name}">
					<a class="ghbutton search right"  href="${ctx}/mall/shop/view?id=${entity.shopId.id}" target="dialog"  mask="true" rel="report_reportDay_lookupdialog"  title="查看商铺">${entity.shopId.name}</a>
					</c:if>
					</td>
				
					
					<td>
						<sec:authorize ifAllGranted="ROLE_REPORT_REPORTDAY_DELETE">
							<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/report/reportDay/delete?id=${entity.id}" class="btnDel">删除</a>
						</sec:authorize>
						<sec:authorize ifAllGranted="ROLE_REPORT_REPORTDAY_EDIT">
							<a title="编辑日报表" target="navTab" rel="report_reportDay_edit" href="${ctx}/report/reportDay/edit?id=${entity.id}" class="btnEdit">编辑</a>
						</sec:authorize>
						<a title="查看日报表" target="navTab" rel="report_reportDay_view" href="${ctx}/report/reportDay/view?id=${entity.id}" class="btnView">查看</a>
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
