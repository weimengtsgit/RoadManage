<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/customer/msgLog/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>商铺：</label>
					<input id="customer_shop_name_list" type="hidden" name="shop.id" value='' />
					<input type="text" name="filter_LIKES_shop.name" value='${pageData.filtraMap["LIKES_shop.name"]}' suggestFields="name" suggestUrl="${ctx}/lookupJson" lookupGroup="shop" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="shop">查找带回</a>
				</li>
			
			
			
				<li>
					<label>手机号：</label>
					<input type="text" name="filter_LIKES_mobile" value="${pageData.filtraMap.LIKES_mobile}"/>
				</li>
			
			
			
				<li>
					<label>发送时间：</label>
					<input style="width:116px;" id="msgTime" name="filter_GED_msgTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_msgTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input style="width:116px;" id="msgTime" name="filter_LED_msgTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_msgTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
			
				<li>
					<label>发送状态：</label>
					<tag:enum id="status" inputType="select" defaultValue="" name="filter_EQT_status" enumName="successful" enumKey="${pageData.filtraMap.EQT_status}" />
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
	<div class="panelBar">
		<ul class="toolBar">
			<sec:authorize ifAllGranted="ROLE_CUSTOMER_MSGLOG_EXPORT">
				<li><a class="icon" href="${ctx}/customer/msgLog/exportExcel?exportPageSize=${pageData.pagination.totalCount}&excelName=短信发送记录明细&sheetName=短信发送记录明细&title=短信发送记录明细" target="dwzExport" target="navTab" title="实要导出这些记录吗?"><span>导出</span></a></li>
			</sec:authorize>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
			
				<th orderField="shop.name" class="${pageData.compositor.fieldName eq 'shop.name' ? pageData.compositor.compositorType : ''}">商铺</th>
			
				<th orderField="mall.name" class="${pageData.compositor.fieldName eq 'mall.name' ? pageData.compositor.compositorType : ''}">商场</th>
					
				<th orderField="mobile" class=${pageData.compositor.fieldName eq 'mobile' ? pageData.compositor.compositorType : ''}>手机号</th>
					
				<th orderField="msgContent" class=${pageData.compositor.fieldName eq 'msgContent' ? pageData.compositor.compositorType : ''}>短信内容</th>
					
				<th orderField="msgTime" class=${pageData.compositor.fieldName eq 'msgTime' ? pageData.compositor.compositorType : ''}>发送时间</th>
			
				<th orderField="status" class=${pageData.compositor.fieldName eq 'status' ? pageData.compositor.compositorType : ''}>发送状态</th>
					
				<th orderField="result" class=${pageData.compositor.fieldName eq 'result' ? pageData.compositor.compositorType : ''}>发送结果代码</th>
				
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" rel="customer_viewdialog" >
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize} </td>
				
					<td>
					<c:if test="${not empty entity.shop.name}">
					<a class="ghbutton search right"  href="${ctx}/view?id=${entity.shop.id}" target="dialog"  mask="true" rel="customer_msgLog_lookupdialog"  title="查看商铺">${entity.shop.name}</a>
					</c:if>
					</td>
				
					<td>
					<c:if test="${not empty entity.mall.name}">
					<a class="ghbutton search right"  href="${ctx}/mall/mall/view?id=${entity.mall.id}" target="dialog"  mask="true" rel="customer_msgLog_lookupdialog"  title="查看商场">${entity.mall.name}</a>
					</c:if>
					</td>
						
					<td>${entity.mobile}</td>
						
					<td>${entity.msgContent}</td>
				
					<td><fmt:formatDate value="${entity.msgTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
				
					<td><tag:enum tagType="view" enumName="successful" enumKey="${entity.status}" /></td>
						
					<td>${entity.result}</td>
				
					
					<td>
						<a title="查看短信发送记录" target="navTab" rel="customer_msgLog_view" href="${ctx}/customer/msgLog/view?id=${entity.id}" class="btnView">查看</a>
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
