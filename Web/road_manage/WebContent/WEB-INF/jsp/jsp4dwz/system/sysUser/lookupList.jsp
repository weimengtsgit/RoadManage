<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form rel="pagerForm" id="pagerForm" method="post" action="${ctx}/system/sysUser/lookupList" onsubmit="return dwzSearch(this, 'dialog');">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>账号：</label>
					<input type="text" name="filter_LIKES_username" value="${pageData.filtraMap.LIKES_username}"/>
				</li>
			
				<li>
					<label>昵称：</label>
					<input type="text" name="filter_LIKES_name" value="${pageData.filtraMap.LIKES_name}"/>
				</li>
			
				<li style="display: none">
					<label>用户类型：</label>
					<tag:enum id="userType" defaultValue="" name="filter_EQS_userType" enumName="userType" enumKey="${pageData.filtraMap.EQS_userType}" />
				</li>
			
				<li>
					<label>所属部门：</label>
					<input id="system_userDept_deptName" type="hidden" name="userDept.id" value="${sysUser.userDept.id}"/>
					<input type="text" name="userDept.deptName" value="${pageData.filtraMap.EQS_userDept}" suggestFields="deptName" suggestUrl="${ctx}/system/sysDept/lookupJson" lookupGroup="userDept"  onchange="if(!this.value) document.getElementById('system_userDept_deptName').value=''" />
					<a class="btnLook" href="${ctx}/system/sysDept/lookupList" lookupGroup="userDept">查找带回</a>
				</li>
			
				<li>
					<label>所属角色：</label>
					<input id="system_userRole_roleName" type="hidden" name="userRole.id" value="${sysUser.userRole.id}"/>
					<input type="text" name="userRole.roleName" value="${pageData.filtraMap.EQS_userRole}" suggestFields="roleName" suggestUrl="${ctx}/system/sysRole/lookupJson" lookupGroup="userRole"  onchange="if(!this.value) document.getElementById('system_userRole_roleName').value=''" />
					<a class="btnLook" href="${ctx}/system/sysRole/lookupList" lookupGroup="userRole">查找带回</a>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive" style="float:right;"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<%-- <li><a class="button" href="${ctx}/system/sysUser/advancedSearch" target="dialog" title="查询框"><span>高级查询</span></a></li> --%>
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
					
				<th orderField="username" class="${pageData.compositor.fieldName eq 'username.' ? pageData.compositor.compositorType : ''}">账号</th>
					
				<th orderField="name" class="${pageData.compositor.fieldName eq 'name.' ? pageData.compositor.compositorType : ''}">昵称</th>
					
				<th orderField="userType" class="${pageData.compositor.fieldName eq 'userType.' ? pageData.compositor.compositorType : ''}">用户类型</th>
			
				<th orderField="userDept.deptName" class="${pageData.compositor.fieldName eq 'userDept.deptName' ? pageData.compositor.compositorType : ''}">所属部门</th>
			
				<th orderField="userRole.roleName" class="${pageData.compositor.fieldName eq 'userRole.roleName' ? pageData.compositor.compositorType : ''}">所属角色</th>
				
				<th width="90">查找带回</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}">
				<tr>
						
					<td>${entity.username}</td>
						
					<td>${entity.name}</td>
				
					<td><tag:enum isTag="false" id="userType" name="userType" enumName="userType" enumKey="${entity.userType}" /></td>		
				
					<td><a href="${ctx}/system/sysDept/view?id=${entity.userDept.id}" target="dialog" rel="system_sysUser_dialog" title="${entity.userDept.deptName}">${entity.userDept.deptName}</a></td>
				
					<td><a href="${ctx}/system/sysRole/view?id=${entity.userRole.id}" target="dialog" rel="system_sysUser_dialog" title="${entity.userRole.roleName}">${entity.userRole.roleName}</a></td>
				
					<td>
						<a class="btnSelect" href="javascript:SLAVEJS.getLoopupJson('${ctx}/system/sysUser/viewJson?id=${entity.id}')" title="查找带回">选择</a>
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
