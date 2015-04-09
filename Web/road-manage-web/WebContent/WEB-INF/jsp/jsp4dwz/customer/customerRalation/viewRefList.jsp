<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return dwzSearch(this, 'dialog');" method="post" action="${ctx}/customer/customerRalation/viewRefList">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				
					<input class="hiddenItem"  type="hidden" name="filter_EQI_customer.id" value='${pageData.filtraMap["EQI_customer.id"]}' />
				
			
				
					<input class="hiddenItem"  type="hidden" name="filter_EQI_terminal.id" value='${pageData.filtraMap["EQI_terminal.id"]}' />
				
			
				
					<input class="hiddenItem"  type="hidden" name="filter_EQI_shop.id" value='${pageData.filtraMap["EQI_shop.id"]}' />
				
			
				
					<input class="hiddenItem"  type="hidden" name="filter_EQI_mall.id" value='${pageData.filtraMap["EQI_mall.id"]}' />
				
			
				<li>
					<label>创建时间：</label>
					<input id="createTime" name="filter_GED_createTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_createTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input id="createTime" name="filter_LED_createTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_createTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
			
				<li>
					<label>是否收藏：</label>
					<tag:enum id="keep" inputType="SELECT" defaultValue="" name="filter_EQS_keep" enumName="com_customerRalationType" enumKey="${pageData.filtraMap.EQS_keep}" />
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
			
				<th orderField="customer.mobile" class="${pageData.compositor.fieldName eq 'customer.mobile' ? pageData.compositor.compositorType : ''}">客户</th>
			
				<th orderField="terminal.mac" class="${pageData.compositor.fieldName eq 'terminal.mac' ? pageData.compositor.compositorType : ''}">终端</th>
			
				<th orderField="shop.name" class="${pageData.compositor.fieldName eq 'shop.name' ? pageData.compositor.compositorType : ''}">商铺</th>
			
				<th orderField="mall.name" class="${pageData.compositor.fieldName eq 'mall.name' ? pageData.compositor.compositorType : ''}">商场</th>
					
				<th  orderField="createTime" class=${pageData.compositor.fieldName eq 'createTime' ? pageData.compositor.compositorType : ''}>创建时间</th>
			
				<th orderField="keep" class=${pageData.compositor.fieldName eq 'keep' ? pageData.compositor.compositorType : ''}>是否收藏</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" >
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
				
					<td>
					<c:if test="${not empty entity.customer.mobile}">
					<a class="ghbutton search right" href="${ctx}/view?id=${entity.customer.id}" target="dialog" mask="true" rel="customer_customerRalation_lookupdialog" title="查看客户详情">${entity.customer.mobile}</a>
					</c:if>
					</td>
				
					<td>
					<c:if test="${not empty entity.terminal.mac}">
					<a class="ghbutton search right" href="${ctx}/view?id=${entity.terminal.id}" target="dialog" mask="true" rel="customer_customerRalation_lookupdialog" title="查看终端详情">${entity.terminal.mac}</a>
					</c:if>
					</td>
				
					<td>
					<c:if test="${not empty entity.shop.name}">
					<a class="ghbutton search right" href="${ctx}/view?id=${entity.shop.id}" target="dialog" mask="true" rel="customer_customerRalation_lookupdialog" title="查看商铺详情">${entity.shop.name}</a>
					</c:if>
					</td>
				
					<td>
					<c:if test="${not empty entity.mall.name}">
					<a class="ghbutton search right" href="${ctx}/mall/mall/view?id=${entity.mall.id}" target="dialog" mask="true" rel="customer_customerRalation_lookupdialog" title="查看商场详情">${entity.mall.name}</a>
					</c:if>
					</td>
				
					<td><fmt:formatDate value="${entity.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
				
					<td><tag:enum isTag="false" tagType="view" id="keep" name="keep" enumName="com_customerRalationType" enumKey="${entity.keep}" /></td>
				
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
