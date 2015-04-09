<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/customer/customerRalation/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>客户：</label>
					<input id="customer_customer_mobile_list" type="hidden" name="customer.id" value='' />
					<input type="text" name="filter_LIKES_customer.mobile" value='${pageData.filtraMap["LIKES_customer.mobile"]}' suggestFields="mobile" suggestUrl="${ctx}/lookupJson" lookupGroup="customer" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="customer">查找带回</a>
				</li>
			
				<li>
					<label>终端：</label>
					<input id="customer_terminal_mac_list" type="hidden" name="terminal.id" value='' />
					<input type="text" name="filter_LIKES_terminal.mac" value='${pageData.filtraMap["LIKES_terminal.mac"]}' suggestFields="mac" suggestUrl="${ctx}/lookupJson" lookupGroup="terminal" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="terminal">查找带回</a>
				</li>
			
				<li>
					<label>商铺：</label>
					<input id="customer_shop_name_list" type="hidden" name="shop.id" value='' />
					<input type="text" name="filter_LIKES_shop.name" value='${pageData.filtraMap["LIKES_shop.name"]}' suggestFields="name" suggestUrl="${ctx}/lookupJson" lookupGroup="shop" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="shop">查找带回</a>
				</li>
			
				<li>
					<label>商场：</label>
					<input id="customer_mall_name_list" type="hidden" name="mall.id" value='' />
					<input type="text" name="filter_LIKES_mall.name" value='${pageData.filtraMap["LIKES_mall.name"]}' suggestFields="name" suggestUrl="${ctx}/mall/mall/lookupJson" lookupGroup="mall" />
					<a class="btnLook" href="${ctx}/mall/mall/lookupList" lookupGroup="mall">查找带回</a>
				</li>
			
				<li>
					<label>创建时间：</label>
					<input style="width:116px;" id="createTime" name="filter_GED_createTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_createTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input style="width:116px;" id="createTime" name="filter_LED_createTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_createTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
			
				<li>
					<label>是否收藏：</label>
					<tag:enum id="keep" inputType="select" defaultValue="" name="filter_EQS_keep" enumName="com_customerRalationType" enumKey="${pageData.filtraMap.EQS_keep}" />
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
<%-- 				<li><a class="button" href="${ctx}/customer/customerRalation/advancedSearch" target="dialog" mask="true" width="795" height="460" rel="customer_customerRalation_advancedSearchList" title="查询框"><span>高级查询</span></a></li> --%>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
<%-- 			<sec:authorize ifAllGranted="ROLE_CUSTOMER_CUSTOMERRALATION_NEW"> --%>
<%-- 				<li><a class="add" href="${ctx}/customer/customerRalation/new" target="navTab" rel="customer_customerRalation_edit"><span>添加商铺客户列表</span></a></li> --%>
<%-- 			</sec:authorize> --%>
<!-- 				<li class="line">line</li> -->
			<sec:authorize ifAllGranted="ROLE_CUSTOMER_CUSTOMERRALATION_DELALL">
				<li><a class="add" href="${ctx}/customer/customerRalation/toSendMsg"  target="selectedToDialog"  rel="ids" postType="string" ><span>发送短信</span></a></li>
			</sec:authorize>
				<li class="line">line</li>
<%-- 			<sec:authorize ifAllGranted="ROLE_CUSTOMER_CUSTOMERRALATION_IMPORT"> --%>
<%-- 				<li><a class="add" href="${ctx}/customer/customerRalation/importView" rel="customer_customerRalation_import" target="dialog" mask="true" width="470" height="230"><span>导入</span></a></li> --%>
<%-- 			</sec:authorize> --%>
<!-- 				<li class="line">line</li> -->
			<sec:authorize ifAllGranted="ROLE_CUSTOMER_CUSTOMERRALATION_EXPORT">
				<li><a class="icon" href="${ctx}/customer/customerRalation/exportExcel?exportPageSize=${pageData.pagination.totalCount}&excelName=商铺客户列表明细&sheetName=商铺客户列表明细&title=商铺客户列表明细" target="dwzExport" target="navTab" title="实要导出这些记录吗?"><span>导出</span></a></li>
			</sec:authorize>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
			
				<th orderField="customer.mobile" class="${pageData.compositor.fieldName eq 'customer.mobile' ? pageData.compositor.compositorType : ''}">客户</th>
			
				<th orderField="terminal.mac" class="${pageData.compositor.fieldName eq 'terminal.mac' ? pageData.compositor.compositorType : ''}">终端</th>
			
				<th orderField="shop.name" class="${pageData.compositor.fieldName eq 'shop.name' ? pageData.compositor.compositorType : ''}">商铺</th>
			
				<th orderField="mall.name" class="${pageData.compositor.fieldName eq 'mall.name' ? pageData.compositor.compositorType : ''}">商场</th>
					
				<th orderField="createTime" class=${pageData.compositor.fieldName eq 'createTime' ? pageData.compositor.compositorType : ''}>创建时间</th>
			
				<th orderField="keep" class=${pageData.compositor.fieldName eq 'keep' ? pageData.compositor.compositorType : ''}>是否收藏</th>
				
				
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
					<a class="ghbutton search right"  href="${ctx}/customer/customer/view?id=${entity.customer.id}" target="dialog"  mask="true" rel="customer_customerRalation_lookupdialog"  title="查看客户">${entity.customer.mobile}</a>
					</c:if>
					</td>
				
					<td>
					<c:if test="${not empty entity.terminal.mac}">
					<a class="ghbutton search right"  href="${ctx}/customer/terminal/view?id=${entity.terminal.id}" target="dialog"  mask="true" rel="customer_customerRalation_lookupdialog"  title="查看终端">${entity.terminal.mac}</a>
					</c:if>
					</td>
				
					<td>
					<c:if test="${not empty entity.shop.name}">
					<a class="ghbutton search right"  href="${ctx}/mall/shop/view?id=${entity.shop.id}" target="dialog"  mask="true" rel="customer_customerRalation_lookupdialog"  title="查看商铺">${entity.shop.name}</a>
					</c:if>
					</td>
				
					<td>
					<c:if test="${not empty entity.shop.mall.name}">
					<a class="ghbutton search right"  href="${ctx}/mall/mall/view?id=${entity.shop.mall.id}" target="dialog"  mask="true" rel="customer_customerRalation_lookupdialog"  title="查看商场">${entity.shop.mall.name}</a>
					</c:if>
					</td>
				
					<td><fmt:formatDate value="${entity.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
				
					<td><tag:enum tagType="view" enumName="com_customerRalationType" enumKey="${entity.keep}" /></td>
				
					
					<td>
<%-- 						<sec:authorize ifAllGranted="ROLE_CUSTOMER_CUSTOMERRALATION_DELETE"> --%>
<%-- 							<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/customer/customerRalation/delete?id=${entity.id}" class="btnDel">删除</a> --%>
<%-- 						</sec:authorize> --%>
<%-- 						<sec:authorize ifAllGranted="ROLE_CUSTOMER_CUSTOMERRALATION_EDIT"> --%>
<%-- 							<a title="编辑商铺客户列表" target="navTab" rel="customer_customerRalation_edit" href="${ctx}/customer/customerRalation/edit?id=${entity.id}" class="btnEdit">编辑</a> --%>
<%-- 						</sec:authorize> --%>
						<a title="查看商铺客户列表" target="navTab" rel="customer_customerRalation_view" href="${ctx}/customer/customerRalation/view?id=${entity.id}" class="btnView">查看</a>
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
