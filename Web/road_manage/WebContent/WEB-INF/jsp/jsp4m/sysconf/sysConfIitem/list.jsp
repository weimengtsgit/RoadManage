<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/sysconf/sysConfIitem/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
					<input id="sysconf_confType_confName_list" type="hidden" name="filter_EQI_confType.id" value='${pageData.filtraMap["EQI_confType.id"]}' />
			
				<li>
					<label>配置项名称：</label>
					<input type="text" name="filter_LIKES_itemName" value="${pageData.filtraMap.LIKES_itemName}"/>
				</li>
			
				<li>
					<label>配置项key：</label>
					<input type="text" name="filter_LIKES_itemKey" value="${pageData.filtraMap.LIKES_itemKey}"/>
				</li>
			
				
				<li>
					<label>值类型：</label>
					<tag:enum id="valueType" inputType="select" defaultValue="" name="filter_EQS_valueType" enumName="sys_conf_value_type" enumKey="${pageData.filtraMap.EQS_valueType}" />
				</li>
			
				<li>
					<label>值枚举类型：</label>
					<input id="sysconf_enumType_enumDesc_list" type="hidden" name="enumType.id" value='' />
					<input type="text" name="filter_LIKES_enumType.enumDesc" value='${pageData.filtraMap["LIKES_enumType.enumDesc"]}' suggestFields="enumDesc" suggestUrl="${ctx}/system/sysEnum/lookupJson" lookupGroup="enumType" />
					<a class="btnLook" href="${ctx}/system/sysEnum/lookupList" lookupGroup="enumType">查找带回</a>
				</li>
			
				<li>
					<label>配置项描述：</label>
					<input type="text" name="filter_LIKES_des" value="${pageData.filtraMap.LIKES_des}"/>
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
	<div class="panelBar">
		<ul class="toolBar">
		<sec:authorize ifAllGranted="ROLE_SYSCONF_SYSCONFIITEM_NEW">
			<li><a class="add" href="${ctx}/sysconf/sysConfIitem/new?pid=${pageData.filtraMap["EQI_confType.id"]}" target="navTab" rel="sysconf_sysConfIitem_edit"><span>添加配置项</span></a></li>
		</sec:authorize>
			<li class="line">line</li>
		<sec:authorize ifAllGranted="ROLE_SYSCONF_SYSCONFIITEM_DELALL">
			<li><a class="delete" href="${ctx}/sysconf/sysConfIitem/delAll" target="selectedTodo" rel="ids" postType="string" title="确实要删除这些记录吗?"><span>批量删除</span></a></li>
		</sec:authorize>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
			
				<th orderField="confType.confName" class="${pageData.compositor.fieldName eq 'confType.confName' ? pageData.compositor.compositorType : ''}">配置类型</th>
					
				<th orderField="itemName" class=${pageData.compositor.fieldName eq 'itemName' ? pageData.compositor.compositorType : ''}>配置项名称</th>
					
				<th orderField="itemKey" class=${pageData.compositor.fieldName eq 'itemKey' ? pageData.compositor.compositorType : ''}>配置项key</th>
					
			
				<th orderField="valueType" class=${pageData.compositor.fieldName eq 'valueType' ? pageData.compositor.compositorType : ''}>值类型</th>
			
				<th orderField="enumType.enumDesc" class="${pageData.compositor.fieldName eq 'enumType.enumDesc' ? pageData.compositor.compositorType : ''}">值枚举类型</th>
					
				<th orderField="des" class=${pageData.compositor.fieldName eq 'des' ? pageData.compositor.compositorType : ''}>配置项描述</th>
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" rel="sysconf_viewdialog" >
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
				
					<td>
					<c:if test="${not empty entity.confType.confName}">
					<a class="ghbutton search right"  href="${ctx}/sysconf/sysConfType/view?id=${entity.confType.id}" target="dialog"  mask="true" rel="sysconf_sysConfIitem_lookupdialog"  title="查看配置类型">${entity.confType.confName}</a>
					</c:if>
					</td>
						
					<td>${entity.itemName}</td>
						
					<td>${entity.itemKey}</td>
				
				
					<td><tag:enum tagType="view" enumName="sys_conf_value_type" enumKey="${entity.valueType}" /></td>
				
					<td>
					<c:if test="${not empty entity.enumType.enumDesc}">
					<a class="ghbutton search right"  href="${ctx}/system/sysEnum/view?id=${entity.enumType.id}" target="dialog"  mask="true" rel="sysconf_sysConfIitem_lookupdialog"  title="查看值枚举类型">${entity.enumType.enumDesc}</a>
					</c:if>
					</td>
						
					<td>${entity.des}</td>
				
					<td>
					<sec:authorize ifAllGranted="ROLE_SYSCONF_SYSCONFIITEM_DELETE">
						<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/sysconf/sysConfIitem/delete?id=${entity.id}" class="btnDel">删除</a>
					</sec:authorize>
					<sec:authorize ifAllGranted="ROLE_SYSCONF_SYSCONFIITEM_EDIT">
						<a title="编辑配置项" target="navTab" rel="sysconf_sysConfIitem_edit" href="${ctx}/sysconf/sysConfIitem/edit?id=${entity.id}" class="btnEdit">编辑</a>
					</sec:authorize>
						<a title="查看配置项" target="navTab" rel="sysconf_sysConfIitem_view" href="${ctx}/sysconf/sysConfIitem/view?id=${entity.id}" class="btnView">查看</a>
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
