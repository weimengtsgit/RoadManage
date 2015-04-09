<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/mall/apDevice/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>商场：</label>
					<input id="mall_mall_name_list" type="hidden" name="mall.id" value='' />
					<input type="text" name="filter_LIKES_mall.name" value='${pageData.filtraMap["LIKES_mall.name"]}' suggestFields="name" suggestUrl="${ctx}/mall/mall/lookupJson" lookupGroup="mall" />
					<a class="btnLook" href="${ctx}/mall/mall/lookupList" lookupGroup="mall">查找带回</a>
				</li>
			
				<li>
					<label>AP MAC：</label>
					<input type="text" name="filter_LIKES_mac" value="${pageData.filtraMap.LIKES_mac}"/>
				</li>
			
				<li>
					<label>设备位置：</label>
					<input type="text" name="filter_LIKES_location" value="${pageData.filtraMap.LIKES_location}"/>
				</li>
			
				<li>
					<label>设备IP：</label>
					<input type="text" name="filter_LIKES_ip" value="${pageData.filtraMap.LIKES_ip}"/>
				</li>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_description" value="${pageData.filtraMap.LIKES_description}"/>
			
				<li>
					<label>设备运行状态：</label>
					<tag:enum id="status" inputType="select" defaultValue="" name="filter_EQS_status" enumName="deviceStatus" enumKey="${pageData.filtraMap.EQS_status}" />
				</li>
			
				<li>
					<label>创建时间：</label>
					<input style="width:116px;" id="createTime" name="filter_GED_createTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_createTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input style="width:116px;" id="createTime" name="filter_LED_createTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_createTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
			
				<li>
					<label>设备出厂SN：</label>
					<input type="text" name="filter_LIKES_sn" value="${pageData.filtraMap.LIKES_sn}"/>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
<%-- 				<li><a class="button" href="${ctx}/mall/apDevice/advancedSearch" target="dialog" mask="true" width="795" height="460" rel="mall_apDevice_advancedSearchList" title="查询框"><span>高级查询</span></a></li> --%>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<sec:authorize ifAllGranted="ROLE_MALL_APDEVICE_NEW">
				<li><a class="add" href="${ctx}/mall/apDevice/new" target="navTab" rel="mall_apDevice_edit"><span>添加无线AP设备</span></a></li>
			</sec:authorize>
				<li class="line">line</li>
			<sec:authorize ifAllGranted="ROLE_MALL_APDEVICE_DELALL">
				<li><a class="delete" href="${ctx}/mall/apDevice/delAll" target="selectedTodo" rel="ids" postType="string" title="确实要删除这些记录吗?"><span>批量删除</span></a></li>
			</sec:authorize>
				<li class="line">line</li>
<%-- 			<sec:authorize ifAllGranted="ROLE_MALL_APDEVICE_IMPORT"> --%>
<%-- 				<li><a class="add" href="${ctx}/mall/apDevice/importView" rel="mall_apDevice_import" target="dialog" mask="true" width="470" height="230"><span>导入</span></a></li> --%>
<%-- 			</sec:authorize> --%>
<!-- 				<li class="line">line</li> -->
<%-- 			<sec:authorize ifAllGranted="ROLE_MALL_APDEVICE_EXPORT"> --%>
<%-- 				<li><a class="icon" href="${ctx}/mall/apDevice/exportExcel?exportPageSize=${pageData.pagination.totalCount}&excelName=无线AP设备明细&sheetName=无线AP设备明细&title=无线AP设备明细" target="dwzExport" target="navTab" title="实要导出这些记录吗?"><span>导出</span></a></li> --%>
<%-- 			</sec:authorize> --%>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
			
				<th orderField="mall.name" class="${pageData.compositor.fieldName eq 'mall.name' ? pageData.compositor.compositorType : ''}">商场</th>
					
				<th orderField="mac" class=${pageData.compositor.fieldName eq 'mac' ? pageData.compositor.compositorType : ''}>AP MAC</th>
					
				<th orderField="location" class=${pageData.compositor.fieldName eq 'location' ? pageData.compositor.compositorType : ''}>设备位置</th>
					
				<th orderField="ip" class=${pageData.compositor.fieldName eq 'ip' ? pageData.compositor.compositorType : ''}>设备IP</th>
			
				<th orderField="status" class=${pageData.compositor.fieldName eq 'status' ? pageData.compositor.compositorType : ''}>设备运行状态</th>
					
				<th orderField="createTime" class=${pageData.compositor.fieldName eq 'createTime' ? pageData.compositor.compositorType : ''}>创建时间</th>
					
				<th orderField="sn" class=${pageData.compositor.fieldName eq 'sn' ? pageData.compositor.compositorType : ''}>设备出厂SN</th>
				
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" rel="mall_viewdialog" >
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize} </td>
				
					<td>
					<c:if test="${not empty entity.mall.name}">
					<a class="ghbutton search right"  href="${ctx}/mall/mall/view?id=${entity.mall.id}" target="dialog"  mask="true" rel="mall_apDevice_lookupdialog"  title="查看商场">${entity.mall.name}</a>
					</c:if>
					</td>
						
					<td>${entity.mac}</td>
						
					<td>${entity.location}</td>
						
					<td>${entity.ip}</td>
				
					<td><tag:enum tagType="view" enumName="deviceStatus" enumKey="${entity.status}" /></td>
				
					<td><fmt:formatDate value="${entity.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
						
					<td>${entity.sn}</td>
				
					
					<td>
						<sec:authorize ifAllGranted="ROLE_MALL_APDEVICE_DELETE">
							<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/mall/apDevice/delete?id=${entity.id}" class="btnDel">删除</a>
						</sec:authorize>
						<sec:authorize ifAllGranted="ROLE_MALL_APDEVICE_EDIT">
							<a title="编辑无线AP设备" target="navTab" rel="mall_apDevice_edit" href="${ctx}/mall/apDevice/edit?id=${entity.id}" class="btnEdit">编辑</a>
						</sec:authorize>
						<a title="查看无线AP设备" target="navTab" rel="mall_apDevice_view" href="${ctx}/mall/apDevice/view?id=${entity.id}" class="btnView">查看</a>
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
