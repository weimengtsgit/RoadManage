<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form rel="pagerForm" id="pagerForm" method="post" action="${ctx}/mall/shopPromotion/lookupList" onsubmit="return dwzSearch(this, 'dialog');">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>商铺：</label>
					<input id="mall_shop_name" type="hidden" name="shop.id" value="${shopPromotion.shop.id}"/>
					<input type="text" name="shop.name" value="${pageData.filtraMap.EQS_shop}" suggestFields="name" suggestUrl="${ctx}/lookupJson" lookupGroup="shop"  onchange="if(!this.value) document.getElementById('mall_shop_name').value=''" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="shop">查找带回</a>
				</li>
			
				<li>
					<label>优惠活动简介：</label>
					<input type="text" name="filter_LIKES_intro" value="${pageData.filtraMap.LIKES_intro}"/>
				</li>
			
				<li>
					<label>活动具体内容：</label>
					<input type="text" name="filter_LIKES_details" value="${pageData.filtraMap.LIKES_details}"/>
				</li>
			
				<li>
					<label>开始展示时间：</label>
					<input id="beginTime" name="filter_GED_beginTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_beginTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input id="beginTime" name="filter_LED_beginTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_beginTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
			
				<li>
					<label>结束展示时间：</label>
					<input id="endTime" name="filter_GED_endTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_endTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input id="endTime" name="filter_LED_endTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_endTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
			
				<li>
					<label>审核状态：</label>
					<tag:enum id="auditStatus" defaultValue="" name="filter_EQS_auditStatus" enumName="shopAuditStatus" enumKey="${pageData.filtraMap.EQS_auditStatus}" />
				</li>
			
				<li>
					<label>状态：</label>
					<tag:enum id="status" defaultValue="" name="filter_EQS_status" enumName="promotionStatus" enumKey="${pageData.filtraMap.EQS_status}" />
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive" style="float:right;"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<%-- <li><a class="button" href="${ctx}/mall/shopPromotion/advancedSearch" target="dialog" title="查询框"><span>高级查询</span></a></li> --%>
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
			
				<th orderField="shop.name" class="${pageData.compositor.fieldName eq 'shop.name' ? pageData.compositor.compositorType : ''}">商铺</th>
					
				<th orderField="intro" class="${pageData.compositor.fieldName eq 'intro.' ? pageData.compositor.compositorType : ''}">优惠活动简介</th>
					
				<th orderField="details" class="${pageData.compositor.fieldName eq 'details.' ? pageData.compositor.compositorType : ''}">活动具体内容</th>
					
				<th orderField="beginTime" class="${pageData.compositor.fieldName eq 'beginTime.' ? pageData.compositor.compositorType : ''}">开始展示时间</th>
					
				<th orderField="endTime" class="${pageData.compositor.fieldName eq 'endTime.' ? pageData.compositor.compositorType : ''}">结束展示时间</th>
					
				<th orderField="auditStatus" class="${pageData.compositor.fieldName eq 'auditStatus.' ? pageData.compositor.compositorType : ''}">审核状态</th>
					
				<th orderField="status" class="${pageData.compositor.fieldName eq 'status.' ? pageData.compositor.compositorType : ''}">状态</th>
				
				<th width="90">查找带回</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}">
				<tr>
				
					<td>
					<c:if test="${not empty entity.shop.name}">
					<a class="ghbutton search right" href="${ctx}/view?id=${entity.shop.id}" target="dialog" mask="true" rel="mall_shopPromotion_dialog" title="查看商铺详情">${entity.shop.name}</a>
					</c:if>
					</td>
						
					<td>${entity.intro}</td>
						
					<td>${entity.details}</td>
				
					<td><fmt:formatDate value="${entity.beginTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
				
					<td><fmt:formatDate value="${entity.endTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
				
					<td><tag:enum isTag="false" id="auditStatus" name="auditStatus" enumName="shopAuditStatus" enumKey="${entity.auditStatus}" /></td>		
				
					<td><tag:enum isTag="false" id="status" name="status" enumName="promotionStatus" enumKey="${entity.status}" /></td>		
				
					<td>
						<a class="btnSelect" href="javascript:SLAVEJS.getLoopupJson('${ctx}/mall/shopPromotion/viewJson?id=${entity.id}')" title="查找带回">选择</a>
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
