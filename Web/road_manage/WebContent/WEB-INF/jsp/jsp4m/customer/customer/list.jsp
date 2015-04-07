<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/customer/customer/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>手机号：</label>
					<input type="text" name="filter_LIKES_mobile" value="${pageData.filtraMap.LIKES_mobile}"/>
				</li>
			
				<li>
					<label>微信号：</label>
					<input type="text" name="filter_LIKES_weixin" value="${pageData.filtraMap.LIKES_weixin}"/>
				</li>
			
				<li>
					<label>QQ号：</label>
					<input type="text" name="filter_LIKES_qq" value="${pageData.filtraMap.LIKES_qq}"/>
				</li>
			
				<li>
					<label>VIP号：</label>
					<input type="text" name="filter_LIKES_vip" value="${pageData.filtraMap.LIKES_vip}"/>
				</li>
			
				<li>
					<label>车牌号：</label>
					<input type="text" name="filter_LIKES_carNum" value="${pageData.filtraMap.LIKES_carNum}"/>
				</li>
					
				<li>
					<label>年龄：</label>
					<input type="text" name="filter_EQI_age" value="${pageData.filtraMap.EQI_age}"/>
				</li>
			
				<li>
					<label>性别：</label>
					<tag:enum id="sex" inputType="select" defaultValue="" name="filter_EQS_sex" enumName="sex" enumKey="${pageData.filtraMap.EQS_sex}" />
				</li>
			
				<li>
					<label>创建时间：</label>
					<input style="width:116px;" id="createTime" name="filter_GED_createTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_createTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input style="width:116px;" id="createTime" name="filter_LED_createTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_createTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_interest" value="${pageData.filtraMap.LIKES_interest}"/>
					
					<input class="hiddenItem" type="hidden" name="filter_EQI_trackId" value="${pageData.filtraMap.EQI_trackId}"/>
			
				<li>
					<label>最近一次使用终端：</label>
					<input id="customer_lastUseTerm_mac_list" type="hidden" name="lastUseTerm.id" value='' />
					<input type="text" name="filter_LIKES_lastUseTerm.mac" value='${pageData.filtraMap["LIKES_lastUseTerm.mac"]}' suggestFields="mac" suggestUrl="${ctx}/customer/terminal/lookupJson" lookupGroup="lastUseTerm" />
					<a class="btnLook" href="${ctx}/customer/terminal/lookupList" lookupGroup="lastUseTerm">查找带回</a>
				</li>
					
				<li>
					<label>账户余额：</label>
					<input type="text" name="filter_EQI_acctBalance" value="${pageData.filtraMap.EQI_acctBalance}"/>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
<%-- 				<li><a class="button" href="${ctx}/customer/customer/advancedSearch" target="dialog" mask="true" width="795" height="460" rel="customer_customer_advancedSearchList" title="查询框"><span>高级查询</span></a></li> --%>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
<%-- 			<sec:authorize ifAllGranted="ROLE_CUSTOMER_CUSTOMER_NEW"> --%>
<%-- 				<li><a class="add" href="${ctx}/customer/customer/new" target="navTab" rel="customer_customer_edit"><span>添加顾客信息</span></a></li> --%>
<%-- 			</sec:authorize> --%>
<!-- 				<li class="line">line</li> -->
<%-- 			<sec:authorize ifAllGranted="ROLE_CUSTOMER_CUSTOMER_DELALL"> --%>
<%-- 				<li><a class="delete" href="${ctx}/customer/customer/delAll" target="selectedTodo" rel="ids" postType="string" title="确实要删除这些记录吗?"><span>批量删除</span></a></li> --%>
<%-- 			</sec:authorize> --%>
<!-- 				<li class="line">line</li> -->
<%-- 			<sec:authorize ifAllGranted="ROLE_CUSTOMER_CUSTOMER_IMPORT"> --%>
<%-- 				<li><a class="add" href="${ctx}/customer/customer/importView" rel="customer_customer_import" target="dialog" mask="true" width="470" height="230"><span>导入</span></a></li> --%>
<%-- 			</sec:authorize> --%>
<!-- 				<li class="line">line</li> -->
			<sec:authorize ifAllGranted="ROLE_CUSTOMER_CUSTOMER_EXPORT">
				<li><a class="icon" href="${ctx}/customer/customer/exportExcel?exportPageSize=${pageData.pagination.totalCount}&excelName=顾客信息明细&sheetName=顾客信息明细&title=顾客信息明细" target="dwzExport" target="navTab" title="实要导出这些记录吗?"><span>导出</span></a></li>
			</sec:authorize>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
					
				<th orderField="mobile" class=${pageData.compositor.fieldName eq 'mobile' ? pageData.compositor.compositorType : ''}>手机号</th>
					
				<th orderField="weixin" class=${pageData.compositor.fieldName eq 'weixin' ? pageData.compositor.compositorType : ''}>微信号</th>
					
				<th orderField="qq" class=${pageData.compositor.fieldName eq 'qq' ? pageData.compositor.compositorType : ''}>QQ号</th>
					
				<th orderField="vip" class=${pageData.compositor.fieldName eq 'vip' ? pageData.compositor.compositorType : ''}>VIP号</th>
					
				<th orderField="carNum" class=${pageData.compositor.fieldName eq 'carNum' ? pageData.compositor.compositorType : ''}>车牌号</th>
					
				<th orderField="age" class=${pageData.compositor.fieldName eq 'age' ? pageData.compositor.compositorType : ''}>年龄</th>
			
				<th orderField="sex" class=${pageData.compositor.fieldName eq 'sex' ? pageData.compositor.compositorType : ''}>性别</th>
					
				<th orderField="createTime" class=${pageData.compositor.fieldName eq 'createTime' ? pageData.compositor.compositorType : ''}>创建时间</th>
			
				<th orderField="lastUseTerm.mac" class="${pageData.compositor.fieldName eq 'lastUseTerm.mac' ? pageData.compositor.compositorType : ''}">最近一次使用终端</th>
					
				<th orderField="acctBalance" class=${pageData.compositor.fieldName eq 'acctBalance' ? pageData.compositor.compositorType : ''}>账户余额</th>
				
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" rel="customer_viewdialog" >
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize} </td>
						
					<td>${entity.mobile}</td>
						
					<td>${entity.weixin}</td>
						
					<td>${entity.qq}</td>
						
					<td>${entity.vip}</td>
						
					<td>${entity.carNum}</td>
						
					<td>${entity.age}</td>
				
					<td><tag:enum tagType="view" enumName="sex" enumKey="${entity.sex}" /></td>
				
					<td><fmt:formatDate value="${entity.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
				
					<td>
					<c:if test="${not empty entity.lastUseTerm.mac}">
					<a class="ghbutton search right"  href="${ctx}/customer/terminal/view?id=${entity.lastUseTerm.id}" target="dialog"  mask="true" rel="customer_customer_lookupdialog"  title="查看最近一次使用终端">${entity.lastUseTerm.mac}</a>
					</c:if>
					</td>
						
					<td>${entity.acctBalance}</td>
				
					
					<td>
						<sec:authorize ifAllGranted="ROLE_CUSTOMER_CUSTOMER_DELETE">
							<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/customer/customer/delete?id=${entity.id}" class="btnDel">删除</a>
						</sec:authorize>
						<sec:authorize ifAllGranted="ROLE_CUSTOMER_CUSTOMER_EDIT">
							<a title="编辑顾客信息" target="navTab" rel="customer_customer_edit" href="${ctx}/customer/customer/edit?id=${entity.id}" class="btnEdit">编辑</a>
						</sec:authorize>
						<a title="查看顾客信息" target="navTab" rel="customer_customer_view" href="${ctx}/customer/customer/view?id=${entity.id}" class="btnView">查看</a>
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
