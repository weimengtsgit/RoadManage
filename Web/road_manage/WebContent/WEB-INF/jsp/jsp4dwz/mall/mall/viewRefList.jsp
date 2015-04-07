<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return dwzSearch(this, 'dialog');" method="post" action="${ctx}/mall/mall/viewRefList">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>商场名称：</label>
					<input type="text" name="filter_LIKES_name" value="${pageData.filtraMap.LIKES_name}"/>
				</li>
			
				<li>
					<label>商场地址：</label>
					<input type="text" name="filter_LIKES_address" value="${pageData.filtraMap.LIKES_address}"/>
				</li>
			
				<li>
					<label>联系人：</label>
					<input type="text" name="filter_LIKES_contact" value="${pageData.filtraMap.LIKES_contact}"/>
				</li>
			
				<li>
					<label>电话：</label>
					<input type="text" name="filter_LIKES_phone" value="${pageData.filtraMap.LIKES_phone}"/>
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
					<label>商场介绍：</label>
					<input type="text" name="filter_LIKES_intro" value="${pageData.filtraMap.LIKES_intro}"/>
				</li>
			
					<input class="hiddenItem"  type="hidden" name="filter_EQI_logoAttachment.id" value='${pageData.filtraMap["EQI_logoAttachment.id"]}' />
			
					<input class="hiddenItem"  type="hidden" name="filter_EQI_backgroudAttachment.id" value='${pageData.filtraMap["EQI_backgroudAttachment.id"]}' />
			
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
					
				<th  orderField="name" class=${pageData.compositor.fieldName eq 'name' ? pageData.compositor.compositorType : ''}>商场名称</th>
					
				<th  orderField="address" class=${pageData.compositor.fieldName eq 'address' ? pageData.compositor.compositorType : ''}>商场地址</th>
					
				<th  orderField="contact" class=${pageData.compositor.fieldName eq 'contact' ? pageData.compositor.compositorType : ''}>联系人</th>
					
				<th  orderField="phone" class=${pageData.compositor.fieldName eq 'phone' ? pageData.compositor.compositorType : ''}>电话</th>
					
				<th  orderField="createTime" class=${pageData.compositor.fieldName eq 'createTime' ? pageData.compositor.compositorType : ''}>创建时间</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" >
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
						
					<td>${entity.name}</td>
						
					<td>${entity.address}</td>
						
					<td>${entity.contact}</td>
						
					<td>${entity.phone}</td>
				
					<td><fmt:formatDate value="${entity.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
				
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
