<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form rel="pagerForm" id="pagerForm" method="post" action="${ctx}/mall/apDevice/lookupList" onsubmit="return dwzSearch(this, 'dialog');">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>商场：</label>
					<input id="mall_mall_name" type="hidden" name="mall.id" value="${apDevice.mall.id}"/>
					<input type="text" name="mall.name" value="${pageData.filtraMap.EQS_mall}" suggestFields="name" suggestUrl="${ctx}/mall/mall/lookupJson" lookupGroup="mall"  onchange="if(!this.value) document.getElementById('mall_mall_name').value=''" />
					<a class="btnLook" href="${ctx}/mall/mall/lookupList" lookupGroup="mall">查找带回</a>
				</li>
			
				<li>
					<label>AP MAC：</label>
					<input type="text" name="filter_LIKES_mac" value="${pageData.filtraMap.LIKES_mac}"/>
				</li>
			
				<li>
					<label>设备位置：</label>
					<input type="text" name="filter_LIKES_location" value="${pageData.filtraMap.LIKES_location}"/>
				</li>
			
				<li>
					<label>设备IP：</label>
					<input type="text" name="filter_LIKES_ip" value="${pageData.filtraMap.LIKES_ip}"/>
				</li>
			
				<li>
					<label>设备运行状态：</label>
					<tag:enum id="status" defaultValue="" name="filter_EQS_status" enumName="deviceStatus" enumKey="${pageData.filtraMap.EQS_status}" />
				</li>
			
				<li>
					<label>创建时间：</label>
					<input id="createTime" name="filter_GED_createTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_createTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input id="createTime" name="filter_LED_createTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_createTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
			
				<li>
					<label>设备出厂SN：</label>
					<input type="text" name="filter_LIKES_sn" value="${pageData.filtraMap.LIKES_sn}"/>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive" style="float:right;"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<%-- <li><a class="button" href="${ctx}/mall/apDevice/advancedSearch" target="dialog" title="查询框"><span>高级查询</span></a></li> --%>
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
			
				<th orderField="mall.name" class="${pageData.compositor.fieldName eq 'mall.name' ? pageData.compositor.compositorType : ''}">商场</th>
					
				<th orderField="mac" class="${pageData.compositor.fieldName eq 'mac.' ? pageData.compositor.compositorType : ''}">AP MAC</th>
					
				<th orderField="location" class="${pageData.compositor.fieldName eq 'location.' ? pageData.compositor.compositorType : ''}">设备位置</th>
					
				<th orderField="ip" class="${pageData.compositor.fieldName eq 'ip.' ? pageData.compositor.compositorType : ''}">设备IP</th>
					
				<th orderField="status" class="${pageData.compositor.fieldName eq 'status.' ? pageData.compositor.compositorType : ''}">设备运行状态</th>
					
				<th orderField="createTime" class="${pageData.compositor.fieldName eq 'createTime.' ? pageData.compositor.compositorType : ''}">创建时间</th>
					
				<th orderField="sn" class="${pageData.compositor.fieldName eq 'sn.' ? pageData.compositor.compositorType : ''}">设备出厂SN</th>
				
				<th width="90">查找带回</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}">
				<tr>
				
					<td>
					<c:if test="${not empty entity.mall.name}">
					<a class="ghbutton search right" href="${ctx}/mall/mall/view?id=${entity.mall.id}" target="dialog" mask="true" rel="mall_apDevice_dialog" title="查看商场详情">${entity.mall.name}</a>
					</c:if>
					</td>
						
					<td>${entity.mac}</td>
						
					<td>${entity.location}</td>
						
					<td>${entity.ip}</td>
				
					<td><tag:enum isTag="false" id="status" name="status" enumName="deviceStatus" enumKey="${entity.status}" /></td>		
				
					<td><fmt:formatDate value="${entity.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
						
					<td>${entity.sn}</td>
				
					<td>
						<a class="btnSelect" href="javascript:SLAVEJS.getLoopupJson('${ctx}/mall/apDevice/viewJson?id=${entity.id}')" title="查找带回">选择</a>
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
