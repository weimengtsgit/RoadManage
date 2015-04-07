<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return dwzSearch(this, 'dialog');" method="post" action="${ctx}/customer/memberPromotion/viewRefList">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				
					<input class="hiddenItem"  type="hidden" name="filter_EQI_customer.id" value='${pageData.filtraMap["EQI_customer.id"]}' />
				
			
				
					<input class="hiddenItem"  type="hidden" name="filter_EQI_mall.id" value='${pageData.filtraMap["EQI_mall.id"]}' />
				
			
				
					<input class="hiddenItem"  type="hidden" name="filter_EQI_shop.id" value='${pageData.filtraMap["EQI_shop.id"]}' />
				
			
				
					<input class="hiddenItem"  type="hidden" name="filter_EQI_shopPromotion.id" value='${pageData.filtraMap["EQI_shopPromotion.id"]}' />
				
			
				<li>
					<label>验证码：</label>
					<input type="text" name="filter_LIKES_validation" value="${pageData.filtraMap.LIKES_validation}"/>
				</li>
					
				<li>
					<label>状态：</label>
					<input type="text" name="filter_EQS_status" value="${pageData.filtraMap.EQS_status}"/>
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
			
				<th orderField="customer.mobile" class="${pageData.compositor.fieldName eq 'customer.mobile' ? pageData.compositor.compositorType : ''}">会员</th>
			
				<th orderField="mall.name" class="${pageData.compositor.fieldName eq 'mall.name' ? pageData.compositor.compositorType : ''}">商场</th>
			
				<th orderField="shop.name" class="${pageData.compositor.fieldName eq 'shop.name' ? pageData.compositor.compositorType : ''}">商铺</th>
			
				<th orderField="shopPromotion.intro" class="${pageData.compositor.fieldName eq 'shopPromotion.intro' ? pageData.compositor.compositorType : ''}">商铺优惠</th>
					
				<th  orderField="validation" class=${pageData.compositor.fieldName eq 'validation' ? pageData.compositor.compositorType : ''}>验证码</th>
					
				<th  orderField="status" class=${pageData.compositor.fieldName eq 'status' ? pageData.compositor.compositorType : ''}>状态</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" >
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
				
					<td>
					<c:if test="${not empty entity.customer.mobile}">
					<a class="ghbutton search right" href="${ctx}/view?id=${entity.customer.id}" target="dialog" mask="true" rel="customer_memberPromotion_lookupdialog" title="查看会员详情">${entity.customer.mobile}</a>
					</c:if>
					</td>
				
					<td>
					<c:if test="${not empty entity.mall.name}">
					<a class="ghbutton search right" href="${ctx}/mall/mall/view?id=${entity.mall.id}" target="dialog" mask="true" rel="customer_memberPromotion_lookupdialog" title="查看商场详情">${entity.mall.name}</a>
					</c:if>
					</td>
				
					<td>
					<c:if test="${not empty entity.shop.name}">
					<a class="ghbutton search right" href="${ctx}/view?id=${entity.shop.id}" target="dialog" mask="true" rel="customer_memberPromotion_lookupdialog" title="查看商铺详情">${entity.shop.name}</a>
					</c:if>
					</td>
				
					<td>
					<c:if test="${not empty entity.shopPromotion.intro}">
					<a class="ghbutton search right" href="${ctx}/view?id=${entity.shopPromotion.id}" target="dialog" mask="true" rel="customer_memberPromotion_lookupdialog" title="查看商铺优惠详情">${entity.shopPromotion.intro}</a>
					</c:if>
					</td>
						
					<td>${entity.validation}</td>
						
					<td>${entity.status}</td>
				
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
