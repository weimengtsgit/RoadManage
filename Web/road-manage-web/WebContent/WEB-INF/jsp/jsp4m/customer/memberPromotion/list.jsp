<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/customer/memberPromotion/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>会员：</label>
					<input id="customer_customer_mobile_list" type="hidden" name="customer.id" value='' />
					<input type="text" name="filter_LIKES_customer.mobile" value='${pageData.filtraMap["LIKES_customer.mobile"]}' suggestFields="mobile" suggestUrl="${ctx}/lookupJson" lookupGroup="customer" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="customer">查找带回</a>
				</li>
			
				<li>
					<label>商场：</label>
					<input id="customer_mall_name_list" type="hidden" name="mall.id" value='' />
					<input type="text" name="filter_LIKES_mall.name" value='${pageData.filtraMap["LIKES_mall.name"]}' suggestFields="name" suggestUrl="${ctx}/mall/mall/lookupJson" lookupGroup="mall" />
					<a class="btnLook" href="${ctx}/mall/mall/lookupList" lookupGroup="mall">查找带回</a>
				</li>
			
				<li>
					<label>商铺：</label>
					<input id="customer_shop_name_list" type="hidden" name="shop.id" value='' />
					<input type="text" name="filter_LIKES_shop.name" value='${pageData.filtraMap["LIKES_shop.name"]}' suggestFields="name" suggestUrl="${ctx}/lookupJson" lookupGroup="shop" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="shop">查找带回</a>
				</li>
			
				<li>
					<label>商铺优惠：</label>
					<input id="customer_shopPromotion_intro_list" type="hidden" name="shopPromotion.id" value='' />
					<input type="text" name="filter_LIKES_shopPromotion.intro" value='${pageData.filtraMap["LIKES_shopPromotion.intro"]}' suggestFields="intro" suggestUrl="${ctx}/lookupJson" lookupGroup="shopPromotion" />
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
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<li><a class="button" href="${ctx}/customer/memberPromotion/advancedSearch" target="dialog" mask="true" width="795" height="460" rel="customer_memberPromotion_advancedSearchList" title="查询框"><span>高级查询</span></a></li>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<sec:authorize ifAllGranted="ROLE_CUSTOMER_MEMBERPROMOTION_NEW">
				<li><a class="add" href="${ctx}/customer/memberPromotion/new" target="navTab" rel="customer_memberPromotion_edit"><span>添加会员优惠</span></a></li>
			</sec:authorize>
				<li class="line">line</li>
			<sec:authorize ifAllGranted="ROLE_CUSTOMER_MEMBERPROMOTION_DELALL">
				<li><a class="delete" href="${ctx}/customer/memberPromotion/delAll" target="selectedTodo" rel="ids" postType="string" title="确实要删除这些记录吗?"><span>批量删除</span></a></li>
			</sec:authorize>
				<li class="line">line</li>
			<sec:authorize ifAllGranted="ROLE_CUSTOMER_MEMBERPROMOTION_IMPORT">
				<li><a class="add" href="${ctx}/customer/memberPromotion/importView" rel="customer_memberPromotion_import" target="dialog" mask="true" width="470" height="230"><span>导入</span></a></li>
			</sec:authorize>
				<li class="line">line</li>
			<sec:authorize ifAllGranted="ROLE_CUSTOMER_MEMBERPROMOTION_EXPORT">
				<li><a class="icon" href="${ctx}/customer/memberPromotion/exportExcel?exportPageSize=${pageData.pagination.totalCount}&excelName=会员优惠明细&sheetName=会员优惠明细&title=会员优惠明细" target="dwzExport" target="navTab" title="实要导出这些记录吗?"><span>导出</span></a></li>
			</sec:authorize>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
			
				<th orderField="customer.mobile" class="${pageData.compositor.fieldName eq 'customer.mobile' ? pageData.compositor.compositorType : ''}">会员</th>
			
				<th orderField="mall.name" class="${pageData.compositor.fieldName eq 'mall.name' ? pageData.compositor.compositorType : ''}">商场</th>
			
				<th orderField="shop.name" class="${pageData.compositor.fieldName eq 'shop.name' ? pageData.compositor.compositorType : ''}">商铺</th>
			
				<th orderField="shopPromotion.intro" class="${pageData.compositor.fieldName eq 'shopPromotion.intro' ? pageData.compositor.compositorType : ''}">商铺优惠</th>
					
				<th orderField="validation" class=${pageData.compositor.fieldName eq 'validation' ? pageData.compositor.compositorType : ''}>验证码</th>
					
				<th orderField="status" class=${pageData.compositor.fieldName eq 'status' ? pageData.compositor.compositorType : ''}>状态</th>
				
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" rel="customer_viewdialog" >
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize} </td>
				
					<td>
					<c:if test="${not empty entity.customer.mobile}">
					<a class="ghbutton search right"  href="${ctx}/view?id=${entity.customer.id}" target="dialog"  mask="true" rel="customer_memberPromotion_lookupdialog"  title="查看会员">${entity.customer.mobile}</a>
					</c:if>
					</td>
				
					<td>
					<c:if test="${not empty entity.mall.name}">
					<a class="ghbutton search right"  href="${ctx}/mall/mall/view?id=${entity.mall.id}" target="dialog"  mask="true" rel="customer_memberPromotion_lookupdialog"  title="查看商场">${entity.mall.name}</a>
					</c:if>
					</td>
				
					<td>
					<c:if test="${not empty entity.shop.name}">
					<a class="ghbutton search right"  href="${ctx}/view?id=${entity.shop.id}" target="dialog"  mask="true" rel="customer_memberPromotion_lookupdialog"  title="查看商铺">${entity.shop.name}</a>
					</c:if>
					</td>
				
					<td>
					<c:if test="${not empty entity.shopPromotion.intro}">
					<a class="ghbutton search right"  href="${ctx}/view?id=${entity.shopPromotion.id}" target="dialog"  mask="true" rel="customer_memberPromotion_lookupdialog"  title="查看商铺优惠">${entity.shopPromotion.intro}</a>
					</c:if>
					</td>
						
					<td>${entity.validation}</td>
						
					<td>${entity.status}</td>
				
					
					<td>
						<sec:authorize ifAllGranted="ROLE_CUSTOMER_MEMBERPROMOTION_DELETE">
							<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/customer/memberPromotion/delete?id=${entity.id}" class="btnDel">删除</a>
						</sec:authorize>
						<sec:authorize ifAllGranted="ROLE_CUSTOMER_MEMBERPROMOTION_EDIT">
							<a title="编辑会员优惠" target="navTab" rel="customer_memberPromotion_edit" href="${ctx}/customer/memberPromotion/edit?id=${entity.id}" class="btnEdit">编辑</a>
						</sec:authorize>
						<a title="查看会员优惠" target="navTab" rel="customer_memberPromotion_view" href="${ctx}/customer/memberPromotion/view?id=${entity.id}" class="btnView">查看</a>
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
