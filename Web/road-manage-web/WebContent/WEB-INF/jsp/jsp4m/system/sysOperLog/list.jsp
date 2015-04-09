<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/system/sysOperLog/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>用户：</label>
					<input id="system_operUser_name_list" type="hidden" name="operUser.id" value='' />
					<input type="text" name="filter_LIKES_operUser.name" value='${pageData.filtraMap["LIKES_operUser.name"]}' suggestFields="name" suggestUrl="${ctx}/system/sysUser/lookupJson" lookupGroup="operUser" />
					<a class="btnLook" href="${ctx}/system/sysUser/lookupList" lookupGroup="operUser">查找带回</a>
				</li>
			
				<li>
					<label>操作模块：</label>
					<input type="text" name="filter_LIKES_operModule" value="${pageData.filtraMap.LIKES_operModule}"/>
				</li>
				
				<li>
					<label>操作动作：</label>
					<select name="filter_LIKES_operAction" >
						<option value="" <c:if test="${pageData.filtraMap.LIKES_operAction == ''}">selected</c:if>>全部</option>
						<option value="新增" <c:if test="${pageData.filtraMap.LIKES_operAction == '新增'}">selected</c:if>>新增</option>
						<option value="查询" <c:if test="${pageData.filtraMap.LIKES_operAction == '查询'}">selected</c:if>>查询</option>
						<option value="修改" <c:if test="${pageData.filtraMap.LIKES_operAction == '修改'}">selected</c:if>>修改</option>
						<option value="删除" <c:if test="${pageData.filtraMap.LIKES_operAction == '删除'}">selected</c:if>>删除</option>
						<option value="批量执行" <c:if test="${pageData.filtraMap.LIKES_operAction == '批量执行'}">selected</c:if>>批量执行</option>
						<option value="执行" <c:if test="${pageData.filtraMap.LIKES_operAction == '执行'}">selected</c:if>>执行</option>
					</select>
				</li>
			
				<li>
					<label>操作结果：</label>
					<select name="filter_LIKES_operResult">
					   <option value="" <c:if test="${pageData.filtraMap.LIKES_operResult == ''}">selected</c:if>>全部</option>
					   <option value="成功" <c:if test="${pageData.filtraMap.LIKES_operResult == '成功'}">selected</c:if>>成功</option>
					   <option value="失败" <c:if test="${pageData.filtraMap.LIKES_operResult == '失败'}">selected</c:if>>失败</option>
					</select>
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
				<li><a class="button" href="${ctx}/system/sysOperLog/advancedSearch" target="dialog" mask="true" title="查询框"><span>高级查询</span></a></li>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	
	<table class="table" width="100%" layoutH="111">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
			
				<th orderField="operUser.name" class="${pageData.compositor.fieldName eq 'operUser.name' ? pageData.compositor.compositorType : ''}">用户</th>
					
				<th orderField="operAction" class=${pageData.compositor.fieldName eq 'operAction' ? pageData.compositor.compositorType : ''}>操作动作</th>
					
				<th orderField="operModule" class=${pageData.compositor.fieldName eq 'operModule' ? pageData.compositor.compositorType : ''}>操作模块</th>
					
				<th orderField="operResult" class=${pageData.compositor.fieldName eq 'operResult' ? pageData.compositor.compositorType : ''}>操作结果</th>
					
				<th orderField="ip" class=${pageData.compositor.fieldName eq 'ip' ? pageData.compositor.compositorType : ''}>用户IP</th>
				
				<th orderField="createTime" class=${pageData.compositor.fieldName eq 'createTime' ? pageData.compositor.compositorType : ''}>操作时间</th>
				
				<th width="35">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" rel="system_viewdialog" >
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
				
					<td>
					<c:if test="${not empty entity.operUser.name}">
					<a class="ghbutton search right"  href="${ctx}/system/sysUser/view?id=${entity.operUser.id}" target="dialog"  mask="true" rel="system_sysOperLog_lookupdialog"  title="查看用户">${entity.operUser.name}</a>
					</c:if>
					</td>
						
					<td>${entity.operAction}</td>
						
					<td>${entity.operModule}</td>
						
					<td>${entity.operResult}</td>
						
					<td>${entity.ip}</td>
					
					<td><fmt:formatDate value="${entity.createTime }" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>
						<a title="查看操作日志" target="navTab" rel="system_sysOperLog_view" href="${ctx}/system/sysOperLog/view?id=${entity.id}" class="btnView">查看</a>
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
