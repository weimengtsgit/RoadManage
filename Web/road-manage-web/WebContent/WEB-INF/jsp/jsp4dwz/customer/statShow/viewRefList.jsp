<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return dwzSearch(this, 'dialog');" method="post" action="${ctx}/customer/statShow/viewRefList">
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
					<tag:enum id="accessType" inputType="SELECT" defaultValue="" name="filter_EQS_accessType" enumName="com_statShow_accessType" enumKey="${pageData.filtraMap.EQS_accessType}" />
				</li>
			
				<li>
					<label>时间：</label>
					<input id="statTime" name="filter_GED_statTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_statTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input id="statTime" name="filter_LED_statTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_statTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
					
				<li>
					<label>资源ID：</label>
					<input type="text" name="filter_EQI_resourceId" value="${pageData.filtraMap.EQI_resourceId}"/>
				</li>
			
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
	<table class="table" width="100%" layoutH="150"  targetType="dialog">
		<thead>
			<tr>
				<th width="32">序号</th>
					
				<th  orderField="termMac" class=${pageData.compositor.fieldName eq 'termMac' ? pageData.compositor.compositorType : ''}>终端MAC</th>
					
				<th  orderField="apMac" class=${pageData.compositor.fieldName eq 'apMac' ? pageData.compositor.compositorType : ''}>AP设备MAC</th>
					
				<th  orderField="termIp" class=${pageData.compositor.fieldName eq 'termIp' ? pageData.compositor.compositorType : ''}>终端IP</th>
					
				<th  orderField="userAgent" class=${pageData.compositor.fieldName eq 'userAgent' ? pageData.compositor.compositorType : ''}>USER-AGENT</th>
			
				<th orderField="accessType" class=${pageData.compositor.fieldName eq 'accessType' ? pageData.compositor.compositorType : ''}>访问来源</th>
					
				<th  orderField="statTime" class=${pageData.compositor.fieldName eq 'statTime' ? pageData.compositor.compositorType : ''}>时间</th>
					
				<th  orderField="resourceId" class=${pageData.compositor.fieldName eq 'resourceId' ? pageData.compositor.compositorType : ''}>资源ID</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" >
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
						
					<td>${entity.termMac}</td>
						
					<td>${entity.apMac}</td>
						
					<td>${entity.termIp}</td>
						
					<td>${entity.userAgent}</td>
				
					<td><tag:enum isTag="false" tagType="view" id="accessType" name="accessType" enumName="com_statShow_accessType" enumKey="${entity.accessType}" /></td>
				
					<td><fmt:formatDate value="${entity.statTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
						
					<td>${entity.resourceId}</td>
				
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
	<div class="formBar">
			<ul>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div>
				</li>
			</ul>
		</div>
</div>
