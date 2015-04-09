<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/device/device/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

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
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_apps" value="${pageData.filtraMap.LIKES_apps}"/>
			
				<li>
					<label>设备IP：</label>
					<input type="text" name="filter_LIKES_deviceIp" value="${pageData.filtraMap.LIKES_deviceIp}"/>
				</li>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_loginName" value="${pageData.filtraMap.LIKES_loginName}"/>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_loginPwd" value="${pageData.filtraMap.LIKES_loginPwd}"/>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_des" value="${pageData.filtraMap.LIKES_des}"/>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<li><a class="button" href="${ctx}/device/device/advancedSearch" target="dialog" mask="true" title="查询框"><span>高级查询</span></a></li>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${ctx}/device/device/new" target="navTab" rel="device_device_add"><span>添加设备信息</span></a></li>
			<li class="line">line</li>
			<li><a class="delete" href="${ctx}/device/device/delAll" target="selectedTodo" rel="ids" postType="string" title="确实要删除这些记录吗?"><span>批量删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
					
				<th orderField="deviceName" class=${pageData.compositor.fieldName eq 'deviceName' ? pageData.compositor.compositorType : ''}>设备名称</th>
					
				<th orderField="deviceNum" class=${pageData.compositor.fieldName eq 'deviceNum' ? pageData.compositor.compositorType : ''}>设备编号</th>
			
				<th orderField="controlledState" class=${pageData.compositor.fieldName eq 'controlledState' ? pageData.compositor.compositorType : ''}>是否受控</th>
			
				<th orderField="deviceState" class=${pageData.compositor.fieldName eq 'deviceState' ? pageData.compositor.compositorType : ''}>设备状态</th>
			
				<th orderField="appState" class=${pageData.compositor.fieldName eq 'appState' ? pageData.compositor.compositorType : ''}>应用状态</th>
					
				<th orderField="deviceIp" class=${pageData.compositor.fieldName eq 'deviceIp' ? pageData.compositor.compositorType : ''}>设备IP</th>
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="index">
				<tr target="dialog" mask="true" >
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
						
					<td>${entity.deviceName}</td>
						
					<td>${entity.deviceNum}</td>
				
					<td>
					<tag:enum id="controlledState" name="controlledState" enumName="isOrNot" enumKey="${entity.controlledState}" tagType="editInList" href="${ctx}/device/device/setControlledState?id=${entity.id}&value="/>
					</td>
					
					<td>
					<a class="ghbutton search right" href="${ctx }/device/deviceState/deviceStatelist?filter_EQI_device.id=${entity.id }" target="dialog" mask="true" title="设备状态监控信息【${entity.deviceName}】" width=800 height=600>
					<tag:enum isTag="false" id="deviceState" name="deviceState" enumName="device_state" enumKey="${entity.deviceState}" />
					</a>
					</td>
				
					<td>
					<tag:enum tagType="view" name="appState" enumName="device_state" enumKey="${entity.appState}"/>
					</td>
						
					<td>${entity.deviceIp}</td>
				
					<td>
						<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/device/device/delete?id=${entity.id}" class="btnDel">删除</a>
						<a title="编辑设备信息" target="navTab" href="${ctx}/device/device/edit?id=${entity.id}" class="btnEdit">编辑</a>
						<a title="查看设备信息" target="dialog" mask="true" href="${ctx}/device/device/view?id=${entity.id}" class="btnView">查看</a>
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
