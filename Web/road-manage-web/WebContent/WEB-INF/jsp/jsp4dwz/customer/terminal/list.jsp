<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/customer/terminal/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>终端MAC：</label>
					<input type="text" name="filter_LIKES_mac" value="${pageData.filtraMap.LIKES_mac}"/>
				</li>
			
				<li>
					<label>终端类型：</label>
					<tag:enum id="type" inputType="select" defaultValue="" name="filter_EQS_type" enumName="com_terminal_type" enumKey="${pageData.filtraMap.EQS_type}" />
				</li>
			
				<li>
					<label>终端描述：</label>
					<input type="text" name="filter_LIKES_memo" value="${pageData.filtraMap.LIKES_memo}"/>
				</li>
			
				<li>
					<label>关联顾客：</label>
					<input id="customer_customer_mobile_list" type="hidden" name="customer.id" value='' />
					<input type="text" name="filter_LIKES_customer.mobile" value='${pageData.filtraMap["LIKES_customer.mobile"]}' suggestFields="mobile" suggestUrl="${ctx}/customer/customer/lookupJson" lookupGroup="customer" />
					<a class="btnLook" href="${ctx}/customer/customer/lookupList" lookupGroup="customer">查找带回</a>
				</li>
			
				<li>
					<label>最近使用时间：</label>
					<input style="width:116px;" id="lastAccessTime" name="filter_GED_lastAccessTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_lastAccessTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input style="width:116px;" id="lastAccessTime" name="filter_LED_lastAccessTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_lastAccessTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
			
				<li>
					<label>最近断开时间：</label>
					<input style="width:116px;" id="lastExitTime" name="filter_GED_lastExitTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_lastExitTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input style="width:116px;" id="lastExitTime" name="filter_LED_lastExitTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_lastExitTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
					
				<li>
					<label>访问次数：</label>
					<input type="text" name="filter_EQI_accessPortalTimes" value="${pageData.filtraMap.EQI_accessPortalTimes}"/>
				</li>
			
				<li>
					<label>注册AP设备MAC：</label>
					<input type="text" name="filter_LIKES_apMac" value="${pageData.filtraMap.LIKES_apMac}"/>
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
					<label>注册状态：</label>
					<tag:enum id="status" inputType="select" defaultValue="" name="filter_EQS_status" enumName="com_terminal_status" enumKey="${pageData.filtraMap.EQS_status}" />
				</li>
			
				<li>
					<label>注册类型：</label>
					<tag:enum id="regType" inputType="select" defaultValue="" name="filter_EQS_regType" enumName="com_terminal_regType" enumKey="${pageData.filtraMap.EQS_regType}" />
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
<%-- 				<li><a class="button" href="${ctx}/customer/terminal/advancedSearch" target="dialog" mask="true" width="795" height="460" rel="customer_terminal_advancedSearchList" title="查询框"><span>高级查询</span></a></li> --%>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
<%-- 			<sec:authorize ifAllGranted="ROLE_CUSTOMER_TERMINAL_NEW"> --%>
<%-- 				<li><a class="add" href="${ctx}/customer/terminal/new" target="navTab" rel="customer_terminal_edit"><span>添加终端信息</span></a></li> --%>
<%-- 			</sec:authorize> --%>
<!-- 				<li class="line">line</li> -->
<%-- 			<sec:authorize ifAllGranted="ROLE_CUSTOMER_TERMINAL_DELALL"> --%>
<%-- 				<li><a class="delete" href="${ctx}/customer/terminal/delAll" target="selectedTodo" rel="ids" postType="string" title="确实要删除这些记录吗?"><span>批量删除</span></a></li> --%>
<%-- 			</sec:authorize> --%>
<!-- 				<li class="line">line</li> -->
<%-- 			<sec:authorize ifAllGranted="ROLE_CUSTOMER_TERMINAL_IMPORT"> --%>
<%-- 				<li><a class="add" href="${ctx}/customer/terminal/importView" rel="customer_terminal_import" target="dialog" mask="true" width="470" height="230"><span>导入</span></a></li> --%>
<%-- 			</sec:authorize> --%>
<!-- 				<li class="line">line</li> -->
			<sec:authorize ifAllGranted="ROLE_CUSTOMER_TERMINAL_EXPORT">
				<li><a class="icon" href="${ctx}/customer/terminal/exportExcel?exportPageSize=${pageData.pagination.totalCount}&excelName=终端信息明细&sheetName=终端信息明细&title=终端信息明细" target="dwzExport" target="navTab" title="实要导出这些记录吗?"><span>导出</span></a></li>
			</sec:authorize>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
					
				<th orderField="mac" class=${pageData.compositor.fieldName eq 'mac' ? pageData.compositor.compositorType : ''}>终端MAC</th>
			
				<th orderField="type" class=${pageData.compositor.fieldName eq 'type' ? pageData.compositor.compositorType : ''}>终端类型</th>
					
				<th orderField="memo" class=${pageData.compositor.fieldName eq 'memo' ? pageData.compositor.compositorType : ''}>终端描述</th>
			
				<th orderField="customer.mobile" class="${pageData.compositor.fieldName eq 'customer.mobile' ? pageData.compositor.compositorType : ''}">关联顾客</th>
					
				<th orderField="lastAccessTime" class=${pageData.compositor.fieldName eq 'lastAccessTime' ? pageData.compositor.compositorType : ''}>最近使用时间</th>
					
				<th orderField="lastExitTime" class=${pageData.compositor.fieldName eq 'lastExitTime' ? pageData.compositor.compositorType : ''}>最近断开时间</th>
					
				<th orderField="accessPortalTimes" class=${pageData.compositor.fieldName eq 'accessPortalTimes' ? pageData.compositor.compositorType : ''}>访问次数</th>
					
				<th orderField="apMac" class=${pageData.compositor.fieldName eq 'apMac' ? pageData.compositor.compositorType : ''}>注册AP设备MAC</th>
					
				<th orderField="createTime" class=${pageData.compositor.fieldName eq 'createTime' ? pageData.compositor.compositorType : ''}>创建时间</th>
			
				<th orderField="status" class=${pageData.compositor.fieldName eq 'status' ? pageData.compositor.compositorType : ''}>注册状态</th>
			
				<th orderField="regType" class=${pageData.compositor.fieldName eq 'regType' ? pageData.compositor.compositorType : ''}>注册类型</th>
				
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" rel="customer_viewdialog" >
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize} </td>
						
					<td>${entity.mac}</td>
				
					<td><tag:enum tagType="view" enumName="com_terminal_type" enumKey="${entity.type}" /></td>
						
					<td>${entity.memo}</td>
				
					<td>
					<c:if test="${not empty entity.customer.mobile}">
					<a class="ghbutton search right"  href="${ctx}/customer/customer/view?id=${entity.customer.id}" target="dialog"  mask="true" rel="customer_terminal_lookupdialog"  title="查看关联顾客">${entity.customer.mobile}</a>
					</c:if>
					</td>
				
					<td><fmt:formatDate value="${entity.lastAccessTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
				
					<td><fmt:formatDate value="${entity.lastExitTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
						
					<td>${entity.accessPortalTimes}</td>
						
					<td>${entity.apMac}</td>
				
					<td><fmt:formatDate value="${entity.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
				
					<td><tag:enum tagType="view" enumName="com_terminal_status" enumKey="${entity.status}" /></td>
				
					<td><tag:enum tagType="view" enumName="com_terminal_regType" enumKey="${entity.regType}" /></td>
				
					
					<td>
						<sec:authorize ifAllGranted="ROLE_CUSTOMER_TERMINAL_DELETE">
							<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/customer/terminal/delete?id=${entity.id}" class="btnDel">删除</a>
						</sec:authorize>
						<sec:authorize ifAllGranted="ROLE_CUSTOMER_TERMINAL_EDIT">
							<a title="编辑终端信息" target="navTab" rel="customer_terminal_edit" href="${ctx}/customer/terminal/edit?id=${entity.id}" class="btnEdit">编辑</a>
						</sec:authorize>
						<a title="查看终端信息" target="navTab" rel="customer_terminal_view" href="${ctx}/customer/terminal/view?id=${entity.id}" class="btnView">查看</a>
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
