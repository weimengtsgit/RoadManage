<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form rel="pagerForm" id="pagerForm" method="post" action="${ctx}/customer/customerRalation/lookupList" onsubmit="return dwzSearch(this, 'dialog');">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>客户：</label>
					<input id="customer_customer_mobile" type="hidden" name="customer.id" value="${customerRalation.customer.id}"/>
					<input type="text" name="customer.mobile" value="${pageData.filtraMap.EQS_customer}" suggestFields="mobile" suggestUrl="${ctx}/lookupJson" lookupGroup="customer"  onchange="if(!this.value) document.getElementById('customer_customer_mobile').value=''" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="customer">查找带回</a>
				</li>
			
				<li>
					<label>终端：</label>
					<input id="customer_terminal_mac" type="hidden" name="terminal.id" value="${customerRalation.terminal.id}"/>
					<input type="text" name="terminal.mac" value="${pageData.filtraMap.EQS_terminal}" suggestFields="mac" suggestUrl="${ctx}/lookupJson" lookupGroup="terminal"  onchange="if(!this.value) document.getElementById('customer_terminal_mac').value=''" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="terminal">查找带回</a>
				</li>
			
				<li>
					<label>商铺：</label>
					<input id="customer_shop_name" type="hidden" name="shop.id" value="${customerRalation.shop.id}"/>
					<input type="text" name="shop.name" value="${pageData.filtraMap.EQS_shop}" suggestFields="name" suggestUrl="${ctx}/lookupJson" lookupGroup="shop"  onchange="if(!this.value) document.getElementById('customer_shop_name').value=''" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="shop">查找带回</a>
				</li>
			
				<li>
					<label>商场：</label>
					<input id="customer_mall_name" type="hidden" name="mall.id" value="${customerRalation.mall.id}"/>
					<input type="text" name="mall.name" value="${pageData.filtraMap.EQS_mall}" suggestFields="name" suggestUrl="${ctx}/mall/mall/lookupJson" lookupGroup="mall"  onchange="if(!this.value) document.getElementById('customer_mall_name').value=''" />
					<a class="btnLook" href="${ctx}/mall/mall/lookupList" lookupGroup="mall">查找带回</a>
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
					<label>是否收藏：</label>
					<tag:enum id="keep" defaultValue="" name="filter_EQS_keep" enumName="com_customerRalationType" enumKey="${pageData.filtraMap.EQS_keep}" />
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive" style="float:right;"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<%-- <li><a class="button" href="${ctx}/customer/customerRalation/advancedSearch" target="dialog" title="查询框"><span>高级查询</span></a></li> --%>
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
			
				<th orderField="customer.mobile" class="${pageData.compositor.fieldName eq 'customer.mobile' ? pageData.compositor.compositorType : ''}">客户</th>
			
				<th orderField="terminal.mac" class="${pageData.compositor.fieldName eq 'terminal.mac' ? pageData.compositor.compositorType : ''}">终端</th>
			
				<th orderField="shop.name" class="${pageData.compositor.fieldName eq 'shop.name' ? pageData.compositor.compositorType : ''}">商铺</th>
			
				<th orderField="mall.name" class="${pageData.compositor.fieldName eq 'mall.name' ? pageData.compositor.compositorType : ''}">商场</th>
					
				<th orderField="createTime" class="${pageData.compositor.fieldName eq 'createTime.' ? pageData.compositor.compositorType : ''}">创建时间</th>
					
				<th orderField="keep" class="${pageData.compositor.fieldName eq 'keep.' ? pageData.compositor.compositorType : ''}">是否收藏</th>
				
				<th width="90">查找带回</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}">
				<tr>
				
					<td>
					<c:if test="${not empty entity.customer.mobile}">
					<a class="ghbutton search right" href="${ctx}/view?id=${entity.customer.id}" target="dialog" mask="true" rel="customer_customerRalation_dialog" title="查看客户详情">${entity.customer.mobile}</a>
					</c:if>
					</td>
				
					<td>
					<c:if test="${not empty entity.terminal.mac}">
					<a class="ghbutton search right" href="${ctx}/view?id=${entity.terminal.id}" target="dialog" mask="true" rel="customer_customerRalation_dialog" title="查看终端详情">${entity.terminal.mac}</a>
					</c:if>
					</td>
				
					<td>
					<c:if test="${not empty entity.shop.name}">
					<a class="ghbutton search right" href="${ctx}/view?id=${entity.shop.id}" target="dialog" mask="true" rel="customer_customerRalation_dialog" title="查看商铺详情">${entity.shop.name}</a>
					</c:if>
					</td>
				
					<td>
					<c:if test="${not empty entity.mall.name}">
					<a class="ghbutton search right" href="${ctx}/mall/mall/view?id=${entity.mall.id}" target="dialog" mask="true" rel="customer_customerRalation_dialog" title="查看商场详情">${entity.mall.name}</a>
					</c:if>
					</td>
				
					<td><fmt:formatDate value="${entity.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
				
					<td><tag:enum isTag="false" id="keep" name="keep" enumName="com_customerRalationType" enumKey="${entity.keep}" /></td>		
				
					<td>
						<a class="btnSelect" href="javascript:SLAVEJS.getLoopupJson('${ctx}/customer/customerRalation/viewJson?id=${entity.id}')" title="查找带回">选择</a>
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
