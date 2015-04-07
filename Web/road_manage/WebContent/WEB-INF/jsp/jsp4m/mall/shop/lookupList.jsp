<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form rel="pagerForm" id="pagerForm" method="post" action="${ctx}/mall/shop/lookupList" onsubmit="return dwzSearch(this, 'dialog');">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>商场：</label>
					<input id="mall_mall_name" type="hidden" name="mall.id" value="${shop.mall.id}"/>
					<input type="text" name="mall.name" value="${pageData.filtraMap.EQS_mall}" suggestFields="name" suggestUrl="${ctx}/lookupJson" lookupGroup="mall"  onchange="if(!this.value) document.getElementById('mall_mall_name').value=''" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="mall">查找带回</a>
				</li>
			
				<li>
					<label>商铺名称：</label>
					<input type="text" name="filter_LIKES_name" value="${pageData.filtraMap.LIKES_name}"/>
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
					<label>商铺编号：</label>
					<input type="text" name="filter_LIKES_sn" value="${pageData.filtraMap.LIKES_sn}"/>
				</li>
			
				<li>
					<label>联系人：</label>
					<input type="text" name="filter_LIKES_contact" value="${pageData.filtraMap.LIKES_contact}"/>
				</li>
			
				<li>
					<label>联系人电话：</label>
					<input type="text" name="filter_LIKES_phone" value="${pageData.filtraMap.LIKES_phone}"/>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive" style="float:right;"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<%-- <li><a class="button" href="${ctx}/mall/shop/advancedSearch" target="dialog" title="查询框"><span>高级查询</span></a></li> --%>
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
					
				<th orderField="name" class="${pageData.compositor.fieldName eq 'name.' ? pageData.compositor.compositorType : ''}">商铺名称</th>
					
				<th orderField="createTime" class="${pageData.compositor.fieldName eq 'createTime.' ? pageData.compositor.compositorType : ''}">创建时间</th>
					
				<th orderField="sn" class="${pageData.compositor.fieldName eq 'sn.' ? pageData.compositor.compositorType : ''}">商铺编号</th>
					
				<th orderField="contact" class="${pageData.compositor.fieldName eq 'contact.' ? pageData.compositor.compositorType : ''}">联系人</th>
					
				<th orderField="phone" class="${pageData.compositor.fieldName eq 'phone.' ? pageData.compositor.compositorType : ''}">联系人电话</th>
				
				<th width="90">查找带回</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}">
				<tr>
				
					<td>
					<c:if test="${not empty entity.mall.name}">
					<a class="ghbutton search right" href="${ctx}/view?id=${entity.mall.id}" target="dialog" mask="true" rel="mall_shop_dialog" title="查看商场详情">${entity.mall.name}</a>
					</c:if>
					</td>
						
					<td>${entity.name}</td>
				
					<td><fmt:formatDate value="${entity.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
						
					<td>${entity.sn}</td>
						
					<td>${entity.contact}</td>
						
					<td>${entity.phone}</td>
				
					<td>
						<a class="btnSelect" href="javascript:SLAVEJS.getLoopupJson('${ctx}/mall/shop/viewJson?id=${entity.id}')" title="查找带回">选择</a>
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
