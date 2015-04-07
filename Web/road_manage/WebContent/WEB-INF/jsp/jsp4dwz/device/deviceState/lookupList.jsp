<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form rel="pagerForm" id="pagerForm" method="post" action="${ctx}/iacadevice/deviceState/lookupList" onsubmit="return dwzSearch(this, 'dialog');">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>设备：</label>
					<input id="iacadevice_device_deviceName" type="hidden" name="device.id" value="${deviceState.device.id}"/>
					<input type="text" name="device.deviceName" value="${pageData.filtraMap.EQS_device}" suggestFields="deviceName" suggestUrl="${ctx}/iacadevice/device/lookupJson" lookupGroup="device"  onchange="if(!this.value) document.getElementById('iacadevice_device_deviceName').value=''" />
					<a class="btnLook" href="${ctx}/iacadevice/device/lookupList" lookupGroup="device">查找带回</a>
				</li>
			
				<li>
					<label>设备状态：</label>
					<tag:enum id="deviceState" defaultValue="" name="filter_EQI_deviceState" enumName="device_state" enumKey="${pageData.filtraMap.EQI_deviceState}" />
				</li>
			
				<li>
					<label>应用状态：</label>
					<tag:enum id="appState" defaultValue="" name="filter_EQI_appState" enumName="device_state" enumKey="${pageData.filtraMap.EQI_appState}" />
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive" style="float:right;"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<%-- <li><a class="button" href="${ctx}/iacadevice/deviceState/advancedSearch" target="dialog" title="查询框"><span>高级查询</span></a></li> --%>
			</ul>
		</div>
	</div>
	</div>
</div>
</form>
<div class="pageContent">
	<table class="table" layoutH="138" targetType="dialog" width="100%">
		<thead>
			<tr>
			
				<th orderField="device.deviceName" class="${pageData.compositor.fieldName eq 'device.deviceName' ? pageData.compositor.compositorType : ''}">设备</th>
					
				<th orderField="cpu" class="${pageData.compositor.fieldName eq 'cpu.' ? pageData.compositor.compositorType : ''}">CPU(%)</th>
					
				<th orderField="total" class="${pageData.compositor.fieldName eq 'total.' ? pageData.compositor.compositorType : ''}">内存(total)</th>
					
				<th orderField="used" class="${pageData.compositor.fieldName eq 'used.' ? pageData.compositor.compositorType : ''}">内存(used)</th>
					
				<th orderField="buffer" class="${pageData.compositor.fieldName eq 'buffer.' ? pageData.compositor.compositorType : ''}">内存(buffer)</th>
					
				<th orderField="free" class="${pageData.compositor.fieldName eq 'free.' ? pageData.compositor.compositorType : ''}">内存(free)</th>
					
				<th orderField="flow" class="${pageData.compositor.fieldName eq 'flow.' ? pageData.compositor.compositorType : ''}">流量(Kbps)</th>
					
				<th orderField="deviceState" class="${pageData.compositor.fieldName eq 'deviceState.' ? pageData.compositor.compositorType : ''}">设备状态</th>
					
				<th orderField="appState" class="${pageData.compositor.fieldName eq 'appState.' ? pageData.compositor.compositorType : ''}">应用状态</th>
				
				<th width="90">查找带回</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}">
				<tr>
				
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
						<a class="btnSelect" href="javascript:SLAVEJS.getLoopupJson('${ctx}/iacadevice/deviceState/viewJson?id=${entity.id}')" title="查找带回">选择</a>
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
</div>
