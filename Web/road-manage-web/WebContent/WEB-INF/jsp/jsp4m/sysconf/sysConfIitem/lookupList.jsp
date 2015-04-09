<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form rel="pagerForm" id="pagerForm" method="post" action="${ctx}/sysconf/sysConfIitem/lookupList" onsubmit="return dwzSearch(this, 'dialog');">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>配置类型：</label>
					<input id="sysconf_confType_confName" type="hidden" name="confType.id" value="${sysConfIitem.confType.id}"/>
					<input type="text" name="confType.confName" value="${pageData.filtraMap.EQS_confType}" suggestFields="confName" suggestUrl="${ctx}/lookupJson" lookupGroup="confType"  onchange="if(!this.value) document.getElementById('sysconf_confType_confName').value=''" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="confType">查找带回</a>
				</li>
			
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
					<tag:enum id="valueType" defaultValue="" name="filter_EQS_valueType" enumName="sys_conf_value_type" enumKey="${pageData.filtraMap.EQS_valueType}" />
				</li>
			
				<li>
					<label>值枚举类型：</label>
					<input id="sysconf_enumType_enumDesc" type="hidden" name="enumType.id" value="${sysConfIitem.enumType.id}"/>
					<input type="text" name="enumType.enumDesc" value="${pageData.filtraMap.EQS_enumType}" suggestFields="enumDesc" suggestUrl="${ctx}/system/sysEnum/lookupJson" lookupGroup="enumType"  onchange="if(!this.value) document.getElementById('sysconf_enumType_enumDesc').value=''" />
					<a class="btnLook" href="${ctx}/system/sysEnum/lookupList" lookupGroup="enumType">查找带回</a>
				</li>
			
				<li>
					<label>配置项描述：</label>
					<input type="text" name="filter_LIKES_des" value="${pageData.filtraMap.LIKES_des}"/>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive" style="float:right;"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<%-- <li><a class="button" href="${ctx}/sysconf/sysConfIitem/advancedSearch" target="dialog" title="查询框"><span>高级查询</span></a></li> --%>
			</ul>
		</div>
	</div>
	</div>
</div>
</form>
<div class="pageContent">
	<table class="table" layoutH="160" targetType="dialog" width="100%">
		<thead>
			<tr>
			
				<th orderField="confType.confName" class="${pageData.compositor.fieldName eq 'confType.confName' ? pageData.compositor.compositorType : ''}">配置类型</th>
					
				<th orderField="itemName" class="${pageData.compositor.fieldName eq 'itemName.' ? pageData.compositor.compositorType : ''}">配置项名称</th>
					
				<th orderField="itemKey" class="${pageData.compositor.fieldName eq 'itemKey.' ? pageData.compositor.compositorType : ''}">配置项key</th>
					
				<th orderField="itemValue" class="${pageData.compositor.fieldName eq 'itemValue.' ? pageData.compositor.compositorType : ''}">配置项值</th>
					
				<th orderField="valueType" class="${pageData.compositor.fieldName eq 'valueType.' ? pageData.compositor.compositorType : ''}">值类型</th>
			
				<th orderField="enumType.enumDesc" class="${pageData.compositor.fieldName eq 'enumType.enumDesc' ? pageData.compositor.compositorType : ''}">值枚举类型</th>
					
				<th orderField="des" class="${pageData.compositor.fieldName eq 'des.' ? pageData.compositor.compositorType : ''}">配置项描述</th>
				
				<th width="90">查找带回</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}">
				<tr>
				
					<td>
					<c:if test="${not empty entity.confType.confName}">
					<a class="ghbutton search right" href="${ctx}/view?id=${entity.confType.id}" target="dialog" mask="true" rel="sysconf_sysConfIitem_dialog" title="查看配置类型详情">${entity.confType.confName}</a>
					</c:if>
					</td>
						
					<td>${entity.itemName}</td>
						
					<td>${entity.itemKey}</td>
						
					<td>${entity.itemValue}</td>
				
					<td><tag:enum isTag="false" id="valueType" name="valueType" enumName="sys_conf_value_type" enumKey="${entity.valueType}" /></td>		
				
					<td>
					<c:if test="${not empty entity.enumType.enumDesc}">
					<a class="ghbutton search right" href="${ctx}/system/sysEnum/view?id=${entity.enumType.id}" target="dialog" mask="true" rel="sysconf_sysConfIitem_dialog" title="查看值枚举类型详情">${entity.enumType.enumDesc}</a>
					</c:if>
					</td>
						
					<td>${entity.des}</td>
				
					<td>
						<a class="btnSelect" href="javascript:SLAVEJS.getLoopupJson('${ctx}/sysconf/sysConfIitem/viewJson?id=${entity.id}')" title="查找带回">选择</a>
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
	<div class="formBar">
			<ul>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div>
				</li>
			</ul>
		</div>
</div>
