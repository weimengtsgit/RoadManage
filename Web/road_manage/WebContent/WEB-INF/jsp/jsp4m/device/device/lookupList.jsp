<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form rel="pagerForm" id="pagerForm" method="post" action="${ctx}/device/device/lookupList" onsubmit="return dwzSearch(this, 'dialog');">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>设备名称：</label>
					<input type="text" name="filter_LIKES_deviceName" value="${pageData.filtraMap.LIKES_deviceName}"/>
				</li>
			
				<li>
					<label>设备编号：</label>
					<input type="text" name="filter_LIKES_deviceNum" value="${pageData.filtraMap.LIKES_deviceNum}"/>
				</li>
			
				<li>
					<label>设备类型：</label>
					<tag:enum id="deviceType" defaultValue="" name="filter_EQS_deviceType" enumName="deviceType" enumKey="${pageData.filtraMap.EQS_deviceType}" />
				</li>
			
				<li>
					<label>是否受控：</label>
					<tag:enum id="controlledState" defaultValue="" name="filter_EQS_controlledState" enumName="isOrNot" enumKey="${pageData.filtraMap.EQS_controlledState}" />
				</li>
			
				<li>
					<label>设备状态：</label>
					<tag:enum id="deviceState" defaultValue="" name="filter_EQI_deviceState" enumName="device_state" enumKey="${pageData.filtraMap.EQI_deviceState}" />
				</li>
			
				<li>
					<label>应用状态：</label>
					<tag:enum id="appState" defaultValue="" name="filter_EQI_appState" enumName="device_state" enumKey="${pageData.filtraMap.EQI_appState}" />
				</li>
			
				<li>
					<label>设备IP：</label>
					<input type="text" name="filter_LIKES_deviceIp" value="${pageData.filtraMap.LIKES_deviceIp}"/>
				</li>
			
				<li>
					<label>设备组别：</label>
					<tag:enum id="deviceGroup" defaultValue="" name="filter_EQS_deviceGroup" enumName="deviceGroup" enumKey="${pageData.filtraMap.EQS_deviceGroup}" />
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive" style="float:right;"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<%-- <li><a class="button" href="${ctx}/device/device/advancedSearch" target="dialog" title="查询框"><span>高级查询</span></a></li> --%>
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
					
				<th orderField="deviceName" class="${pageData.compositor.fieldName eq 'deviceName.' ? pageData.compositor.compositorType : ''}">设备名称</th>
					
				<th orderField="deviceNum" class="${pageData.compositor.fieldName eq 'deviceNum.' ? pageData.compositor.compositorType : ''}">设备编号</th>
					
				<th orderField="deviceType" class="${pageData.compositor.fieldName eq 'deviceType.' ? pageData.compositor.compositorType : ''}">设备类型</th>
					
				<th orderField="controlledState" class="${pageData.compositor.fieldName eq 'controlledState.' ? pageData.compositor.compositorType : ''}">是否受控</th>
					
				<th orderField="deviceState" class="${pageData.compositor.fieldName eq 'deviceState.' ? pageData.compositor.compositorType : ''}">设备状态</th>
					
				<th orderField="appState" class="${pageData.compositor.fieldName eq 'appState.' ? pageData.compositor.compositorType : ''}">应用状态</th>
					
				<th orderField="deviceIp" class="${pageData.compositor.fieldName eq 'deviceIp.' ? pageData.compositor.compositorType : ''}">设备IP</th>
					
				<th orderField="deviceGroup" class="${pageData.compositor.fieldName eq 'deviceGroup.' ? pageData.compositor.compositorType : ''}">设备组别</th>
				
				<th width="90">查找带回</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}">
				<tr>
						
					<td>${entity.deviceName}</td>
						
					<td>${entity.deviceNum}</td>
				
					<td><tag:enum isTag="false" id="deviceType" name="deviceType" enumName="deviceType" enumKey="${entity.deviceType}" /></td>		
				
					<td><tag:enum isTag="false" id="controlledState" name="controlledState" enumName="isOrNot" enumKey="${entity.controlledState}" /></td>		
				
					<td><tag:enum isTag="false" id="deviceState" name="deviceState" enumName="device_state" enumKey="${entity.deviceState}" /></td>		
				
					<td><tag:enum isTag="false" id="appState" name="appState" enumName="device_state" enumKey="${entity.appState}" /></td>		
						
					<td>${entity.deviceIp}</td>
				
					<td><tag:enum isTag="false" id="deviceGroup" name="deviceGroup" enumName="deviceGroup" enumKey="${entity.deviceGroup}" /></td>		
				
					<td>
						<a class="btnSelect" href="javascript:SLAVEJS.getLoopupJson('${ctx}/device/device/viewJson?id=${entity.id}')" title="查找带回">选择</a>
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
