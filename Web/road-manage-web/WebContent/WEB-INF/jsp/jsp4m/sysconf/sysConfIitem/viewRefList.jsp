<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return dwzSearch(this, 'dialog');" method="post" action="${ctx}/sysconf/sysConfIitem/viewRefList">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				
					<input class="hiddenItem"  type="hidden" name="filter_EQI_confType.id" value='${pageData.filtraMap["EQI_confType.id"]}' />
				
			
				<li>
					<label>配置项名称：</label>
					<input type="text" name="filter_LIKES_itemName" value="${pageData.filtraMap.LIKES_itemName}"/>
				</li>
			
				<li>
					<label>配置项key：</label>
					<input type="text" name="filter_LIKES_itemKey" value="${pageData.filtraMap.LIKES_itemKey}"/>
				</li>
			
				<li>
					<label>配置项值：</label>
					<input type="text" name="filter_LIKES_itemValue" value="${pageData.filtraMap.LIKES_itemValue}"/>
				</li>
			
				<li>
					<label>值类型：</label>
					<tag:enum id="valueType" inputType="SELECT" defaultValue="" name="filter_EQS_valueType" enumName="sys_conf_value_type" enumKey="${pageData.filtraMap.EQS_valueType}" />
				</li>
			
				
					<input class="hiddenItem"  type="hidden" name="filter_EQI_enumType.id" value='${pageData.filtraMap["EQI_enumType.id"]}' />
				
			
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
	<table class="table" width="100%" layoutH="150"  targetType="dialog">
		<thead>
			<tr>
				<th width="32">序号</th>
			
				<th orderField="confType.confName" class="${pageData.compositor.fieldName eq 'confType.confName' ? pageData.compositor.compositorType : ''}">配置类型</th>
					
				<th  orderField="itemName" class=${pageData.compositor.fieldName eq 'itemName' ? pageData.compositor.compositorType : ''}>配置项名称</th>
					
				<th  orderField="itemKey" class=${pageData.compositor.fieldName eq 'itemKey' ? pageData.compositor.compositorType : ''}>配置项key</th>
					
				<th  orderField="itemValue" class=${pageData.compositor.fieldName eq 'itemValue' ? pageData.compositor.compositorType : ''}>配置项值</th>
			
				<th orderField="valueType" class=${pageData.compositor.fieldName eq 'valueType' ? pageData.compositor.compositorType : ''}>值类型</th>
			
				<th orderField="enumType.enumDesc" class="${pageData.compositor.fieldName eq 'enumType.enumDesc' ? pageData.compositor.compositorType : ''}">值枚举类型</th>
					
				<th  orderField="des" class=${pageData.compositor.fieldName eq 'des' ? pageData.compositor.compositorType : ''}>配置项描述</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" >
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
				
					<td>
					<c:if test="${not empty entity.confType.confName}">
					<a class="ghbutton search right" href="${ctx}/view?id=${entity.confType.id}" target="dialog" mask="true" rel="sysconf_sysConfIitem_lookupdialog" title="查看配置类型详情">${entity.confType.confName}</a>
					</c:if>
					</td>
						
					<td>${entity.itemName}</td>
						
					<td>${entity.itemKey}</td>
						
					<td>${entity.itemValue}</td>
				
					<td><tag:enum isTag="false" tagType="view" id="valueType" name="valueType" enumName="sys_conf_value_type" enumKey="${entity.valueType}" /></td>
				
					<td>
					<c:if test="${not empty entity.enumType.enumDesc}">
					<a class="ghbutton search right" href="${ctx}/system/sysEnum/view?id=${entity.enumType.id}" target="dialog" mask="true" rel="sysconf_sysConfIitem_lookupdialog" title="查看值枚举类型详情">${entity.enumType.enumDesc}</a>
					</c:if>
					</td>
						
					<td>${entity.des}</td>
				
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
