<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/system/sysUser/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>账号：</label>
					<input type="text" name="filter_LIKES_username" value="${pageData.filtraMap.LIKES_username}"/>
				</li>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_password" value="${pageData.filtraMap.LIKES_password}"/>
			
				<li>
					<label>昵称：</label>
					<input type="text" name="filter_LIKES_name" value="${pageData.filtraMap.LIKES_name}"/>
				</li>
			
				<li style="display: none">
					<label>用户类型：</label>
					<tag:enum id="userType" defaultValue="" name="filter_EQS_userType" enumName="userType" enumKey="${pageData.filtraMap.EQS_userType}" />
				</li>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_userDesc" value="${pageData.filtraMap.LIKES_userDesc}"/>
			
				<li>
					<label>所属商铺：</label>
					<input id="system_shop_name_input" type="hidden" class="" name="shop.id" value="${sysUser.shop.id}"/>
					<input type="text" class="" size="24" name="shop.name" value="${sysUser.shop.name}" suggestFields="name" suggestUrl="${ctx}/mall/shop/lookupJson" lookupGroup="shop"  onchange="if(!this.value) document.getElementById('system_shop_name_input').value=''" />
					<a class="btnLook" href="${ctx}/mall/shop/lookupList" lookupGroup="shop">查找带回</a>		
				</li>
			
				<li>
					<label>所属角色：</label>
					<input id="system_userRole_roleName_list" type="hidden" name="userRole.id" value='' />
					<input type="text" name="filter_LIKES_userRole.roleName" value='${pageData.filtraMap["LIKES_userRole.roleName"]}' suggestFields="roleName" suggestUrl="${ctx}/system/sysRole/lookupJson" lookupGroup="userRole" />
					<a class="btnLook" href="${ctx}/system/sysRole/lookupList" lookupGroup="userRole">查找带回</a>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
<%-- 				<li><a class="button" rel="system_sysUser_advancedSearch" href="${ctx}/system/sysUser/advancedSearch" target="dialog" mask="true" width="795" height="460" title="查询框"><span>高级查询</span></a></li> --%>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${ctx}/system/sysUser/new" target="navTab" rel="system_sysUser_edit"><span>添加用户</span></a></li>
			<li class="line">line</li>
<%-- 			<li><a class="delete" href="${ctx}/system/sysUser/delAll" target="selectedTodo" rel="ids" postType="string" title="确实要删除这些记录吗?"><span>批量删除</span></a></li> --%>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
					
				<th orderField="username" class=${pageData.compositor.fieldName eq 'username' ? pageData.compositor.compositorType : ''}>账号</th>
					
				<th orderField="name" class=${pageData.compositor.fieldName eq 'name' ? pageData.compositor.compositorType : ''}>昵称</th>
			
				<th orderField="userType" class=${pageData.compositor.fieldName eq 'userType' ? pageData.compositor.compositorType : ''}>用户类型</th>
			
				<th orderField="shop.name" class="${pageData.compositor.fieldName eq 'shop.name' ? pageData.compositor.compositorType : ''}">所属商铺</th>
			
				<th orderField="userRole.roleName" class="${pageData.compositor.fieldName eq 'userRole.roleName' ? pageData.compositor.compositorType : ''}">所属角色</th>
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" title="查看用户-${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}">
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
					
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
						
					<td>${entity.username}</td>
						
					<td>${entity.name}</td>
				
					<td><tag:enum isTag="false" id="userType" name="userType" enumName="userType" enumKey="${entity.userType}" /></td>
				
					<td><a href="${ctx}/mall/shop/view?id=${entity.shop.id}" target="dialog" rel="system_sysUser_dialog" title="${entity.shop.name}">${entity.shop.name}</a></td>
				
					<td><a href="${ctx}/system/sysRole/view?id=${entity.userRole.id}" target="dialog" rel="system_sysUser_dialog" title="${entity.userRole.roleName}">${entity.userRole.roleName}</a></td>
				
					<td>
						<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/system/sysUser/delete?id=${entity.id}" class="btnDel">删除</a>
						<a title="编辑用户" target="navTab" rel="system_sysUser_edit" href="${ctx}/system/sysUser/edit?id=${entity.id}" class="btnEdit">编辑</a>
						<a title="查看用户" target="navTab" rel="system_sysUser_view" href="${ctx}/system/sysUser/view?id=${entity.id}" class="btnView">查看</a>
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
