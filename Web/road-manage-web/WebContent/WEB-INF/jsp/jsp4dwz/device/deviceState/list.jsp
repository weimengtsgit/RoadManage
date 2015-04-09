<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/iacadevice/deviceState/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>设备：</label>
					<input id="iacadevice_device_deviceName_list" type="hidden" name="device.id" value='' />
					<input type="text" name="filter_LIKES_device.deviceName" value='${pageData.filtraMap["LIKES_device.deviceName"]}' suggestFields="deviceName" suggestUrl="${ctx}/iacadevice/device/lookupJson" lookupGroup="device" />
					<a class="btnLook" href="${ctx}/iacadevice/device/lookupList" lookupGroup="device">查找带回</a>
				</li>
					
					<input class="hiddenItem" type="hidden" name="filter_EQN_cpu" value="${pageData.filtraMap.EQN_cpu}"/>
					
					<input class="hiddenItem" type="hidden" name="filter_EQI_total" value="${pageData.filtraMap.EQI_total}"/>
					
					<input class="hiddenItem" type="hidden" name="filter_EQI_used" value="${pageData.filtraMap.EQI_used}"/>
					
					<input class="hiddenItem" type="hidden" name="filter_EQI_buffer" value="${pageData.filtraMap.EQI_buffer}"/>
					
					<input class="hiddenItem" type="hidden" name="filter_EQI_free" value="${pageData.filtraMap.EQI_free}"/>
					
					<input class="hiddenItem" type="hidden" name="filter_EQI_flow" value="${pageData.filtraMap.EQI_flow}"/>
			
				<li>
					<label>设备状态：</label>
					<tag:enum id="deviceState" defaultValue="" name="filter_EQI_deviceState" enumName="device_state" enumKey="${pageData.filtraMap.EQI_deviceState}" />
				</li>
			
				<li>
					<label>应用状态：</label>
					<tag:enum id="appState" defaultValue="" name="filter_EQI_appState" enumName="device_state" enumKey="${pageData.filtraMap.EQI_appState}" />
				</li>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_errApps" value="${pageData.filtraMap.LIKES_errApps}"/>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_msg" value="${pageData.filtraMap.LIKES_msg}"/>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<li><a class="button" href="${ctx}/iacadevice/deviceState/advancedSearch" target="dialog" mask="true" title="查询框"><span>高级查询</span></a></li>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${ctx}/iacadevice/deviceState/new" target="navTab" rel="iacadevice_deviceState_add"><span>添加设备状态信息</span></a></li>
			<li class="line">line</li>
			<li><a class="delete" href="${ctx}/iacadevice/deviceState/delAll" target="selectedTodo" rel="ids" postType="string" title="确实要删除这些记录吗?"><span>批量删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
			
				<th orderField="device.deviceName" class="${pageData.compositor.fieldName eq 'device.deviceName' ? pageData.compositor.compositorType : ''}">设备</th>
					
				<th orderField="cpu" class=${pageData.compositor.fieldName eq 'cpu' ? pageData.compositor.compositorType : ''}>CPU(%)</th>
					
				<th orderField="total" class=${pageData.compositor.fieldName eq 'total' ? pageData.compositor.compositorType : ''}>内存(total)</th>
					
				<th orderField="used" class=${pageData.compositor.fieldName eq 'used' ? pageData.compositor.compositorType : ''}>内存(used)</th>
					
				<th orderField="buffer" class=${pageData.compositor.fieldName eq 'buffer' ? pageData.compositor.compositorType : ''}>内存(buffer)</th>
					
				<th orderField="free" class=${pageData.compositor.fieldName eq 'free' ? pageData.compositor.compositorType : ''}>内存(free)</th>
					
				<th orderField="flow" class=${pageData.compositor.fieldName eq 'flow' ? pageData.compositor.compositorType : ''}>流量(Kbps)</th>
			
				<th orderField="deviceState" class=${pageData.compositor.fieldName eq 'deviceState' ? pageData.compositor.compositorType : ''}>设备状态</th>
			
				<th orderField="appState" class=${pageData.compositor.fieldName eq 'appState' ? pageData.compositor.compositorType : ''}>应用状态</th>
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}">
				<tr>
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
				
					<td><a href="${ctx}/iacadevice/device/view?id=${entity.device.id}" target="dialog" rel="iacadevice_deviceState_dialog" title="${entity.device.deviceName}">${entity.device.deviceName}</a></td>
						
					<td>${entity.cpu}</td>
						
					<td>${entity.total}</td>
						
					<td>${entity.used}</td>
						
					<td>${entity.buffer}</td>
						
					<td>${entity.free}</td>
						
					<td>${entity.flow}</td>
				
					<td><tag:enum isTag="false" id="deviceState" name="deviceState" enumName="device_state" enumKey="${entity.deviceState}" /></td>
				
					<td><tag:enum isTag="false" id="appState" name="appState" enumName="device_state" enumKey="${entity.appState}" /></td>
				
					<td>
						<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/iacadevice/deviceState/delete?id=${entity.id}" class="btnDel">删除</a>
						<a title="编辑设备状态信息" target="navTab" href="${ctx}/iacadevice/deviceState/edit?id=${entity.id}" class="btnEdit">编辑</a>
						<a title="查看设备状态信息" target="navTab" href="${ctx}/iacadevice/deviceState/view?id=${entity.id}" class="btnView">查看</a>
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
