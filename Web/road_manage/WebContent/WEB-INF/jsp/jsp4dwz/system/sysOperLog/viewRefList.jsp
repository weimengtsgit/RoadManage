<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return dwzSearch(this, 'dialog');" method="post" action="${ctx}/system/sysOperLog/viewRefList">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				
					<input class="hiddenItem"  type="hidden" name="filter_EQI_operUser.id" value='${pageData.filtraMap["EQI_operUser.id"]}' />
				
			
				<li>
					<label>操作动作：</label>
					<input type="text" name="filter_LIKES_operAction" value="${pageData.filtraMap.LIKES_operAction}"/>
				</li>
			
				<li>
					<label>操作模块：</label>
					<input type="text" name="filter_LIKES_operModule" value="${pageData.filtraMap.LIKES_operModule}"/>
				</li>
			
				<li>
					<label>操作结果：</label>
					<input type="text" name="filter_LIKES_operResult" value="${pageData.filtraMap.LIKES_operResult}"/>
				</li>
			
				<li>
					<label>用户IP：</label>
					<input type="text" name="filter_LIKES_ip" value="${pageData.filtraMap.LIKES_ip}"/>
				</li>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_operContent" value="${pageData.filtraMap.LIKES_operContent}"/>
			
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
			
				<th orderField="operUser.name" class="${pageData.compositor.fieldName eq 'operUser.name' ? pageData.compositor.compositorType : ''}">用户</th>
					
				<th  orderField="operAction" class=${pageData.compositor.fieldName eq 'operAction' ? pageData.compositor.compositorType : ''}>操作动作</th>
					
				<th  orderField="operModule" class=${pageData.compositor.fieldName eq 'operModule' ? pageData.compositor.compositorType : ''}>操作模块</th>
					
				<th  orderField="operResult" class=${pageData.compositor.fieldName eq 'operResult' ? pageData.compositor.compositorType : ''}>操作结果</th>
					
				<th  orderField="ip" class=${pageData.compositor.fieldName eq 'ip' ? pageData.compositor.compositorType : ''}>用户IP</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" >
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
				
					<td>
					<c:if test="${not empty entity.operUser.name}">
					<a class="ghbutton search right" href="${ctx}/system/sysUser/view?id=${entity.operUser.id}" target="dialog" mask="true" rel="system_sysOperLog_lookupdialog" title="查看用户详情">${entity.operUser.name}</a>
					</c:if>
					</td>
						
					<td>${entity.operAction}</td>
						
					<td>${entity.operModule}</td>
						
					<td>${entity.operResult}</td>
						
					<td>${entity.ip}</td>
				
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
