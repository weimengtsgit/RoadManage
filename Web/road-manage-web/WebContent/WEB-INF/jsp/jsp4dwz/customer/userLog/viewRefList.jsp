<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return dwzSearch(this, 'dialog');" method="post" action="${ctx}/customer/userLog/viewRefList">
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
					<label>认证名：</label>
					<input type="text" name="filter_LIKES_authName" value="${pageData.filtraMap.LIKES_authName}"/>
				</li>
			
				<li>
					<label>终端IP：</label>
					<input type="text" name="filter_LIKES_termIp" value="${pageData.filtraMap.LIKES_termIp}"/>
				</li>
			
				<li>
					<label>AP设备MAC：</label>
					<input type="text" name="filter_LIKES_apMac" value="${pageData.filtraMap.LIKES_apMac}"/>
				</li>
			
				<li>
					<label>上线时间：</label>
					<input id="onlineTime" name="filter_GED_onlineTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_onlineTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input id="onlineTime" name="filter_LED_onlineTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_onlineTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
			
				<li>
					<label>下线时间：</label>
					<input id="offlineTime" name="filter_GED_offlineTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_offlineTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input id="offlineTime" name="filter_LED_offlineTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_offlineTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
					
				<li>
					<label>上网总时长(秒)：</label>
					<input type="text" name="filter_EQI_totalTime" value="${pageData.filtraMap.EQI_totalTime}"/>
				</li>
					
				<li>
					<label>上网总流量(MB)：</label>
					<input type="text" name="filter_EQI_totalFlow" value="${pageData.filtraMap.EQI_totalFlow}"/>
				</li>
					
				<li>
					<label>费用：</label>
					<input type="text" name="filter_EQI_totalFee" value="${pageData.filtraMap.EQI_totalFee}"/>
				</li>
			
				<li>
					<label>唯一标识：</label>
					<input type="text" name="filter_LIKES_sessionId" value="${pageData.filtraMap.LIKES_sessionId}"/>
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
					
				<th  orderField="authName" class=${pageData.compositor.fieldName eq 'authName' ? pageData.compositor.compositorType : ''}>认证名</th>
					
				<th  orderField="termIp" class=${pageData.compositor.fieldName eq 'termIp' ? pageData.compositor.compositorType : ''}>终端IP</th>
					
				<th  orderField="apMac" class=${pageData.compositor.fieldName eq 'apMac' ? pageData.compositor.compositorType : ''}>AP设备MAC</th>
					
				<th  orderField="onlineTime" class=${pageData.compositor.fieldName eq 'onlineTime' ? pageData.compositor.compositorType : ''}>上线时间</th>
					
				<th  orderField="offlineTime" class=${pageData.compositor.fieldName eq 'offlineTime' ? pageData.compositor.compositorType : ''}>下线时间</th>
					
				<th  orderField="totalTime" class=${pageData.compositor.fieldName eq 'totalTime' ? pageData.compositor.compositorType : ''}>上网总时长(秒)</th>
					
				<th  orderField="totalFlow" class=${pageData.compositor.fieldName eq 'totalFlow' ? pageData.compositor.compositorType : ''}>上网总流量(MB)</th>
					
				<th  orderField="totalFee" class=${pageData.compositor.fieldName eq 'totalFee' ? pageData.compositor.compositorType : ''}>费用</th>
					
				<th  orderField="sessionId" class=${pageData.compositor.fieldName eq 'sessionId' ? pageData.compositor.compositorType : ''}>唯一标识</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" >
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
						
					<td>${entity.termMac}</td>
						
					<td>${entity.authName}</td>
						
					<td>${entity.termIp}</td>
						
					<td>${entity.apMac}</td>
				
					<td><fmt:formatDate value="${entity.onlineTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
				
					<td><fmt:formatDate value="${entity.offlineTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
						
					<td>${entity.totalTime}</td>
						
					<td>${entity.totalFlow}</td>
						
					<td>${entity.totalFee}</td>
						
					<td>${entity.sessionId}</td>
				
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
