<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/system/sysLog/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>用户：</label>
					<input id="system_logUser_username_list" type="hidden" name="logUser.id" value='' />
					<input type="text" name="filter_LIKES_logUser.name" value='${pageData.filtraMap["LIKES_logUser.name"]}' suggestFields="name" suggestUrl="${ctx}/system/sysUser/lookupJson" lookupGroup="logUser" />
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
			
				<li >
					<label>登录结果：</label>
					<tag:enum id="logResultType" defaultValue="" name="filter_EQS_logResultType" enumName="logResultType" enumKey="${pageData.filtraMap.EQS_logResultType}" />
				</li>
			
				<li>
					<label>登录时间：</label>
					<input id="logTime"  name="filter_GED_logTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_logTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input id="logTime"  name="filter_LED_logTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_logTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<li><a class="button" href="${ctx}/system/sysLog/advancedSearch" target="dialog" mask="true" title="查询框"><span>高级查询</span></a></li>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<table class="table" width="100%" layoutH="111">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
				
				<th orderField="logUser.name" class="${pageData.compositor.fieldName eq 'logUser.name' ? pageData.compositor.compositorType : ''}">用户</th>
					
				<th orderField="logIp" class=${pageData.compositor.fieldName eq 'logIp' ? pageData.compositor.compositorType : ''}>用户所在IP</th>
			
				<th orderField="logType" class=${pageData.compositor.fieldName eq 'logType' ? pageData.compositor.compositorType : ''}>登录类型</th>
			
				<th orderField="logResultType" class=${pageData.compositor.fieldName eq 'logResultType' ? pageData.compositor.compositorType : ''}>登录结果</th>
					
				<th orderField="logTime" class=${pageData.compositor.fieldName eq 'logTime' ? pageData.compositor.compositorType : ''}>登录时间</th>
				
				<th width="35">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" title="查看登录日志-${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}">
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
				
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
					
					<td><a href="${ctx}/system/sysUser/view?id=${entity.logUser.id}" target="dialog" rel="system_sysLog_dialog" title="${entity.logUser.name}">${entity.logUser.name}</a></td>
						
					<td>${entity.logIp}</td>
				
					<td><tag:enum isTag="false" id="logType" name="logType" enumName="logType" enumKey="${entity.logType}" /></td>
				
					<td><tag:enum isTag="false" id="logResultType" name="logResultType" enumName="logResultType" enumKey="${entity.logResultType}" /></td>
				
					<td><fmt:formatDate value="${entity.logTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
				
					<td>
						<a title="查看登录日志" target="dialog" mask="true" href="${ctx}/system/sysLog/view?id=${entity.id}" class="btnView">查看</a>
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
