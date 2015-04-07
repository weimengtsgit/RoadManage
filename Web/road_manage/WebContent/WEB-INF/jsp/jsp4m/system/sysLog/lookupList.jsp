<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form rel="pagerForm" id="pagerForm" method="post" action="${ctx}/system/sysLog/lookupList" onsubmit="return dwzSearch(this, 'dialog');">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>用户：</label>
					<input id="system_logUser_username" type="hidden" name="logUser.id" value="${sysLog.logUser.id}"/>
					<input type="text" name="logUser.name" value="${pageData.filtraMap.EQS_logUser}" suggestFields="name" suggestUrl="${ctx}/system/sysUser/lookupJson" lookupGroup="logUser"  onchange="if(!this.value) document.getElementById('system_logUser_username').value=''" />
					<a class="btnLook" href="${ctx}/system/sysUser/lookupList" lookupGroup="logUser">查找带回</a>
				</li>
			
				<li>
					<label>用户所在IP：</label>
					<input type="text" name="filter_LIKES_logIp" value="${pageData.filtraMap.LIKES_logIp}"/>
				</li>
			
				<li>
					<label>登录类型：</label>
					<tag:enum id="logType" defaultValue="" name="filter_EQS_logType" enumName="logType" enumKey="${pageData.filtraMap.EQS_logType}" />
				</li>
			
				<li>
					<label>登录结果：</label>
					<tag:enum id="logResultType" defaultValue="" name="filter_EQS_logResultType" enumName="logResultType" enumKey="${pageData.filtraMap.EQS_logResultType}" />
				</li>
			
				<li>
					<label>登录时间：</label>
					<input id="logTime" name="filter_EQD_logTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.EQD_logTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive" style="float:right;"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<%-- <li><a class="button" href="${ctx}/system/sysLog/advancedSearch" target="dialog" title="查询框"><span>高级查询</span></a></li> --%>
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
			
				<th orderField="logUser.name" class="${pageData.compositor.fieldName eq 'logUser.name' ? pageData.compositor.compositorType : ''}">用户</th>
					
				<th orderField="logIp" class="${pageData.compositor.fieldName eq 'logIp.' ? pageData.compositor.compositorType : ''}">用户所在IP</th>
					
				<th orderField="logType" class="${pageData.compositor.fieldName eq 'logType.' ? pageData.compositor.compositorType : ''}">登录类型</th>
					
				<th orderField="logResultType" class="${pageData.compositor.fieldName eq 'logResultType.' ? pageData.compositor.compositorType : ''}">登录结果</th>
					
				<th orderField="logTime" class="${pageData.compositor.fieldName eq 'logTime.' ? pageData.compositor.compositorType : ''}">登录时间</th>
				
				<th width="90">查找带回</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}">
				<tr>
				
					<td><a href="${ctx}/system/sysUser/view?id=${entity.logUser.id}" target="dialog" rel="system_sysLog_dialog" title="${entity.logUser.name}">${entity.logUser.name}</a></td>
						
					<td>${entity.logIp}</td>
				
					<td><tag:enum isTag="false" id="logType" name="logType" enumName="logType" enumKey="${entity.logType}" /></td>		
				
					<td><tag:enum isTag="false" id="logResultType" name="logResultType" enumName="logResultType" enumKey="${entity.logResultType}" /></td>		
				
					<td><fmt:formatDate value="${entity.logTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
				
					<td>
						<a class="btnSelect" href="javascript:SLAVEJS.getLoopupJson('${ctx}/system/sysLog/viewJson?id=${entity.id}')" title="查找带回">选择</a>
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
