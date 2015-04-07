<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form rel="pagerForm" id="pagerForm" method="post" action="${ctx}/customer/terminal/lookupList" onsubmit="return dwzSearch(this, 'dialog');">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>终端MAC：</label>
					<input type="text" name="filter_LIKES_mac" value="${pageData.filtraMap.LIKES_mac}"/>
				</li>
			
				<li>
					<label>终端类型：</label>
					<tag:enum id="type" defaultValue="" name="filter_EQS_type" enumName="com_terminal_type" enumKey="${pageData.filtraMap.EQS_type}" />
				</li>
			
				<li>
					<label>终端描述：</label>
					<input type="text" name="filter_LIKES_memo" value="${pageData.filtraMap.LIKES_memo}"/>
				</li>
			
				<li>
					<label>关联顾客：</label>
					<input id="customer_customer_mobile" type="hidden" name="customer.id" value="${terminal.customer.id}"/>
					<input type="text" name="customer.mobile" value="${pageData.filtraMap.EQS_customer}" suggestFields="mobile" suggestUrl="${ctx}/customer/customer/lookupJson" lookupGroup="customer"  onchange="if(!this.value) document.getElementById('customer_customer_mobile').value=''" />
					<a class="btnLook" href="${ctx}/customer/customer/lookupList" lookupGroup="customer">查找带回</a>
				</li>
			
				<li>
					<label>最近使用时间：</label>
					<input id="lastAccessTime" name="filter_GED_lastAccessTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_lastAccessTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input id="lastAccessTime" name="filter_LED_lastAccessTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_lastAccessTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
			
				<li>
					<label>最近断开时间：</label>
					<input id="lastExitTime" name="filter_GED_lastExitTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_lastExitTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input id="lastExitTime" name="filter_LED_lastExitTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_lastExitTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
					
				<li>
					<label>访问次数：</label>
					<input type="text" name="filter_EQI_accessPortalTimes" value="${pageData.filtraMap.EQI_accessPortalTimes}"/>
				</li>
			
				<li>
					<label>注册AP设备MAC：</label>
					<input type="text" name="filter_LIKES_apMac" value="${pageData.filtraMap.LIKES_apMac}"/>
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
					<label>注册状态：</label>
					<tag:enum id="status" defaultValue="" name="filter_EQS_status" enumName="com_terminal_status" enumKey="${pageData.filtraMap.EQS_status}" />
				</li>
			
				<li>
					<label>注册类型：</label>
					<tag:enum id="regType" defaultValue="" name="filter_EQS_regType" enumName="com_terminal_regType" enumKey="${pageData.filtraMap.EQS_regType}" />
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive" style="float:right;"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<%-- <li><a class="button" href="${ctx}/customer/terminal/advancedSearch" target="dialog" title="查询框"><span>高级查询</span></a></li> --%>
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
					
				<th orderField="mac" class="${pageData.compositor.fieldName eq 'mac.' ? pageData.compositor.compositorType : ''}">终端MAC</th>
					
				<th orderField="type" class="${pageData.compositor.fieldName eq 'type.' ? pageData.compositor.compositorType : ''}">终端类型</th>
					
				<th orderField="memo" class="${pageData.compositor.fieldName eq 'memo.' ? pageData.compositor.compositorType : ''}">终端描述</th>
			
				<th orderField="customer.mobile" class="${pageData.compositor.fieldName eq 'customer.mobile' ? pageData.compositor.compositorType : ''}">关联顾客</th>
					
				<th orderField="lastAccessTime" class="${pageData.compositor.fieldName eq 'lastAccessTime.' ? pageData.compositor.compositorType : ''}">最近使用时间</th>
					
				<th orderField="lastExitTime" class="${pageData.compositor.fieldName eq 'lastExitTime.' ? pageData.compositor.compositorType : ''}">最近断开时间</th>
					
				<th orderField="accessPortalTimes" class="${pageData.compositor.fieldName eq 'accessPortalTimes.' ? pageData.compositor.compositorType : ''}">访问次数</th>
					
				<th orderField="apMac" class="${pageData.compositor.fieldName eq 'apMac.' ? pageData.compositor.compositorType : ''}">注册AP设备MAC</th>
					
				<th orderField="createTime" class="${pageData.compositor.fieldName eq 'createTime.' ? pageData.compositor.compositorType : ''}">创建时间</th>
					
				<th orderField="status" class="${pageData.compositor.fieldName eq 'status.' ? pageData.compositor.compositorType : ''}">注册状态</th>
					
				<th orderField="regType" class="${pageData.compositor.fieldName eq 'regType.' ? pageData.compositor.compositorType : ''}">注册类型</th>
				
				<th width="90">查找带回</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}">
				<tr>
						
					<td>${entity.mac}</td>
				
					<td><tag:enum isTag="false" id="type" name="type" enumName="com_terminal_type" enumKey="${entity.type}" /></td>		
						
					<td>${entity.memo}</td>
				
					<td>
					<c:if test="${not empty entity.customer.mobile}">
					<a class="ghbutton search right" href="${ctx}/customer/customer/view?id=${entity.customer.id}" target="dialog" mask="true" rel="customer_terminal_dialog" title="查看关联顾客详情">${entity.customer.mobile}</a>
					</c:if>
					</td>
				
					<td><fmt:formatDate value="${entity.lastAccessTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
				
					<td><fmt:formatDate value="${entity.lastExitTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
						
					<td>${entity.accessPortalTimes}</td>
						
					<td>${entity.apMac}</td>
				
					<td><fmt:formatDate value="${entity.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
				
					<td><tag:enum isTag="false" id="status" name="status" enumName="com_terminal_status" enumKey="${entity.status}" /></td>		
				
					<td><tag:enum isTag="false" id="regType" name="regType" enumName="com_terminal_regType" enumKey="${entity.regType}" /></td>		
				
					<td>
						<a class="btnSelect" href="javascript:SLAVEJS.getLoopupJson('${ctx}/customer/terminal/viewJson?id=${entity.id}')" title="查找带回">选择</a>
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
