<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form rel="pagerForm" id="pagerForm" method="post" action="${ctx}/customer/memberPromotion/lookupList" onsubmit="return dwzSearch(this, 'dialog');">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>会员：</label>
					<input id="customer_customer_mobile" type="hidden" name="customer.id" value="${memberPromotion.customer.id}"/>
					<input type="text" name="customer.mobile" value="${pageData.filtraMap.EQS_customer}" suggestFields="mobile" suggestUrl="${ctx}/lookupJson" lookupGroup="customer"  onchange="if(!this.value) document.getElementById('customer_customer_mobile').value=''" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="customer">查找带回</a>
				</li>
			
				<li>
					<label>商场：</label>
					<input id="customer_mall_name" type="hidden" name="mall.id" value="${memberPromotion.mall.id}"/>
					<input type="text" name="mall.name" value="${pageData.filtraMap.EQS_mall}" suggestFields="name" suggestUrl="${ctx}/mall/mall/lookupJson" lookupGroup="mall"  onchange="if(!this.value) document.getElementById('customer_mall_name').value=''" />
					<a class="btnLook" href="${ctx}/mall/mall/lookupList" lookupGroup="mall">查找带回</a>
				</li>
			
				<li>
					<label>商铺：</label>
					<input id="customer_shop_name" type="hidden" name="shop.id" value="${memberPromotion.shop.id}"/>
					<input type="text" name="shop.name" value="${pageData.filtraMap.EQS_shop}" suggestFields="name" suggestUrl="${ctx}/lookupJson" lookupGroup="shop"  onchange="if(!this.value) document.getElementById('customer_shop_name').value=''" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="shop">查找带回</a>
				</li>
			
				<li>
					<label>商铺优惠：</label>
					<input id="customer_shopPromotion_intro" type="hidden" name="shopPromotion.id" value="${memberPromotion.shopPromotion.id}"/>
					<input type="text" name="shopPromotion.intro" value="${pageData.filtraMap.EQS_shopPromotion}" suggestFields="intro" suggestUrl="${ctx}/lookupJson" lookupGroup="shopPromotion"  onchange="if(!this.value) document.getElementById('customer_shopPromotion_intro').value=''" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="shopPromotion">查找带回</a>
				</li>
			
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
				<li><div class="buttonActive" style="float:right;"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<%-- <li><a class="button" href="${ctx}/customer/memberPromotion/advancedSearch" target="dialog" title="查询框"><span>高级查询</span></a></li> --%>
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
			
				<th orderField="customer.mobile" class="${pageData.compositor.fieldName eq 'customer.mobile' ? pageData.compositor.compositorType : ''}">会员</th>
			
				<th orderField="mall.name" class="${pageData.compositor.fieldName eq 'mall.name' ? pageData.compositor.compositorType : ''}">商场</th>
			
				<th orderField="shop.name" class="${pageData.compositor.fieldName eq 'shop.name' ? pageData.compositor.compositorType : ''}">商铺</th>
			
				<th orderField="shopPromotion.intro" class="${pageData.compositor.fieldName eq 'shopPromotion.intro' ? pageData.compositor.compositorType : ''}">商铺优惠</th>
					
				<th orderField="validation" class="${pageData.compositor.fieldName eq 'validation.' ? pageData.compositor.compositorType : ''}">验证码</th>
					
				<th orderField="status" class="${pageData.compositor.fieldName eq 'status.' ? pageData.compositor.compositorType : ''}">状态</th>
				
				<th width="90">查找带回</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}">
				<tr>
				
					<td>
					<c:if test="${not empty entity.customer.mobile}">
					<a class="ghbutton search right" href="${ctx}/view?id=${entity.customer.id}" target="dialog" mask="true" rel="customer_memberPromotion_dialog" title="查看会员详情">${entity.customer.mobile}</a>
					</c:if>
					</td>
				
					<td>
					<c:if test="${not empty entity.mall.name}">
					<a class="ghbutton search right" href="${ctx}/mall/mall/view?id=${entity.mall.id}" target="dialog" mask="true" rel="customer_memberPromotion_dialog" title="查看商场详情">${entity.mall.name}</a>
					</c:if>
					</td>
				
					<td>
					<c:if test="${not empty entity.shop.name}">
					<a class="ghbutton search right" href="${ctx}/view?id=${entity.shop.id}" target="dialog" mask="true" rel="customer_memberPromotion_dialog" title="查看商铺详情">${entity.shop.name}</a>
					</c:if>
					</td>
				
					<td>
					<c:if test="${not empty entity.shopPromotion.intro}">
					<a class="ghbutton search right" href="${ctx}/view?id=${entity.shopPromotion.id}" target="dialog" mask="true" rel="customer_memberPromotion_dialog" title="查看商铺优惠详情">${entity.shopPromotion.intro}</a>
					</c:if>
					</td>
						
					<td>${entity.validation}</td>
						
					<td>${entity.status}</td>
				
					<td>
						<a class="btnSelect" href="javascript:SLAVEJS.getLoopupJson('${ctx}/customer/memberPromotion/viewJson?id=${entity.id}')" title="查找带回">选择</a>
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
