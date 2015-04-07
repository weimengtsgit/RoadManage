<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return dwzSearch(this, 'dialog');" method="post" action="${ctx}/mall/mallPromotion/viewRefList">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				
					<input class="hiddenItem"  type="hidden" name="filter_EQI_mall.id" value='${pageData.filtraMap["EQI_mall.id"]}' />
				
			
				<li>
					<label>优惠活动简介：</label>
					<input type="text" name="filter_LIKES_intro" value="${pageData.filtraMap.LIKES_intro}"/>
				</li>
			
				<li>
					<label>活动具体内容：</label>
					<input type="text" name="filter_LIKES_details" value="${pageData.filtraMap.LIKES_details}"/>
				</li>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_image" value="${pageData.filtraMap.LIKES_image}"/>
			
					<input class="hiddenItem"  type="hidden" name="filter_EQI_imageAttachment.id" value='${pageData.filtraMap["EQI_imageAttachment.id"]}' />
			
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
					<label>状态：</label>
					<tag:enum id="status" inputType="SELECT" defaultValue="" name="filter_EQS_status" enumName="promotionStatus" enumKey="${pageData.filtraMap.EQS_status}" />
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
			
				<th orderField="mall.name" class="${pageData.compositor.fieldName eq 'mall.name' ? pageData.compositor.compositorType : ''}">商场</th>
					
				<th  orderField="intro" class=${pageData.compositor.fieldName eq 'intro' ? pageData.compositor.compositorType : ''}>优惠活动简介</th>
					
				<th  orderField="details" class=${pageData.compositor.fieldName eq 'details' ? pageData.compositor.compositorType : ''}>活动具体内容</th>
					
				<th  orderField="beginTime" class=${pageData.compositor.fieldName eq 'beginTime' ? pageData.compositor.compositorType : ''}>开始展示时间</th>
					
				<th  orderField="endTime" class=${pageData.compositor.fieldName eq 'endTime' ? pageData.compositor.compositorType : ''}>结束展示时间</th>
			
				<th orderField="status" class=${pageData.compositor.fieldName eq 'status' ? pageData.compositor.compositorType : ''}>状态</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" >
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
				
					<td>
					<c:if test="${not empty entity.mall.name}">
					<a class="ghbutton search right" href="${ctx}/view?id=${entity.mall.id}" target="dialog" mask="true" rel="mall_mallPromotion_lookupdialog" title="查看商场详情">${entity.mall.name}</a>
					</c:if>
					</td>
						
					<td>${entity.intro}</td>
						
					<td>${entity.details}</td>
				
					<td><fmt:formatDate value="${entity.beginTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
				
					<td><fmt:formatDate value="${entity.endTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
				
					<td><tag:enum isTag="false" tagType="view" id="status" name="status" enumName="promotionStatus" enumKey="${entity.status}" /></td>
				
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
