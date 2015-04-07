<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/mall/shopPromotion/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>商铺：</label>
					<input id="mall_shop_name_list" type="hidden" name="shop.id" value='' />
					<input type="text" name="filter_LIKES_shop.name" value='${pageData.filtraMap["LIKES_shop.name"]}' suggestFields="name" suggestUrl="${ctx}/lookupJson" lookupGroup="shop" />
					<a class="btnLook" href="${ctx}/mall/shop/lookupList" lookupGroup="shop">查找带回</a>
				</li>
			
				<li>
					<label>优惠活动简介：</label>
					<input type="text" name="filter_LIKES_intro" value="${pageData.filtraMap.LIKES_intro}"/>
				</li>
			
				<li>
					<label>活动具体内容：</label>
					<input type="text" name="filter_LIKES_details" value="${pageData.filtraMap.LIKES_details}"/>
				</li>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_image" value="${pageData.filtraMap.LIKES_image}"/>
			
					<input class="hiddenItem" id="mall_imageAttachment_attachName_list" type="hidden" name="filter_EQI_imageAttachment.id" value='${pageData.filtraMap["EQI_imageAttachment.id"]}' />
					<input class="hiddenItem" type="hidden" name="imageAttachment.attachName" value='${pageData.allMap["imageAttachment.attachName"]}' suggestFields="attachName" suggestUrl="${ctx}/attachment/attachment/lookupJson" lookupGroup="imageAttachment"  onchange="if(!this.value) document.getElementById('mall_imageAttachment_attachName_list').value=''" />
			
				<li>
					<label>开始展示时间：</label>
					<input style="width:116px;" id="beginTime" name="filter_GED_beginTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_beginTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input style="width:116px;" id="beginTime" name="filter_LED_beginTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_beginTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
			
				<li>
					<label>结束展示时间：</label>
					<input style="width:116px;" id="endTime" name="filter_GED_endTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_endTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input style="width:116px;" id="endTime" name="filter_LED_endTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_endTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
			
				<li>
					<label>审核状态：</label>
					<tag:enum id="auditStatus" inputType="select" defaultValue="" name="filter_EQS_auditStatus" enumName="shopAuditStatus" enumKey="${pageData.filtraMap.EQS_auditStatus}" />
				</li>
			
				<li>
					<label>状态：</label>
					<tag:enum id="status" inputType="select" defaultValue="" name="filter_EQS_status" enumName="promotionStatus" enumKey="${pageData.filtraMap.EQS_status}" />
				</li>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_auditRejectReason" value="${pageData.filtraMap.LIKES_auditRejectReason}"/>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
<%-- 				<li><a class="button" href="${ctx}/mall/shopPromotion/advancedSearch" target="dialog" mask="true" width="795" height="460" rel="mall_shopPromotion_advancedSearchList" title="查询框"><span>高级查询</span></a></li> --%>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<sec:authorize ifAllGranted="ROLE_MALL_SHOPPROMOTION_NEW">
				<li><a class="add" href="${ctx}/mall/shopPromotion/new" target="navTab" rel="mall_shopPromotion_edit"><span>添加商铺促销活动</span></a></li>
			</sec:authorize>
				<li class="line">line</li>
			<sec:authorize ifAllGranted="ROLE_MALL_SHOPPROMOTION_DELALL">
				<li><a class="delete" href="${ctx}/mall/shopPromotion/delAll" target="selectedTodo" rel="ids" postType="string" title="确实要删除这些记录吗?"><span>批量删除</span></a></li>
			</sec:authorize>
			<sec:authorize ifAllGranted="ROLE_MALL_SHOPPROMOTION_SUBMITAUDIT">
				<li><a class="add" href="${ctx}/mall/shopPromotion/submitAudit" target="selectedTodo" rel="ids" postType="string" title="确实要提交审核吗?提交审核后将不能修改！"><span>提交审核</span></a></li>
			</sec:authorize>
				<li class="line">line</li>
<%-- 			<sec:authorize ifAllGranted="ROLE_MALL_SHOPPROMOTION_IMPORT"> --%>
<%-- 				<li><a class="add" href="${ctx}/mall/shopPromotion/importView" rel="mall_shopPromotion_import" target="dialog" mask="true" width="470" height="230"><span>导入</span></a></li> --%>
<%-- 			</sec:authorize> --%>
<!-- 				<li class="line">line</li> -->
<%-- 			<sec:authorize ifAllGranted="ROLE_MALL_SHOPPROMOTION_EXPORT"> --%>
<%-- 				<li><a class="icon" href="${ctx}/mall/shopPromotion/exportExcel?exportPageSize=${pageData.pagination.totalCount}&excelName=商铺促销活动明细&sheetName=商铺促销活动明细&title=商铺促销活动明细" target="dwzExport" target="navTab" title="实要导出这些记录吗?"><span>导出</span></a></li> --%>
<%-- 			</sec:authorize> --%>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
			
				<th orderField="shop.name" class="${pageData.compositor.fieldName eq 'shop.name' ? pageData.compositor.compositorType : ''}">商铺</th>
					
				<th orderField="intro" class=${pageData.compositor.fieldName eq 'intro' ? pageData.compositor.compositorType : ''}>优惠活动简介</th>
					
				<th orderField="details" width="150" class=${pageData.compositor.fieldName eq 'details' ? pageData.compositor.compositorType : ''}>活动具体内容</th>
					
				<th orderField="beginTime" class=${pageData.compositor.fieldName eq 'beginTime' ? pageData.compositor.compositorType : ''}>开始展示时间</th>
					
				<th orderField="endTime" class=${pageData.compositor.fieldName eq 'endTime' ? pageData.compositor.compositorType : ''}>结束展示时间</th>
			
				<th orderField="auditStatus" class=${pageData.compositor.fieldName eq 'auditStatus' ? pageData.compositor.compositorType : ''}>审核状态</th>
			
				<th orderField="status" class=${pageData.compositor.fieldName eq 'status' ? pageData.compositor.compositorType : ''}>状态</th>
				
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" rel="mall_viewdialog" >
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize} </td>
				
					<td>
					<c:if test="${not empty entity.shop.name}">
					<a class="ghbutton search right"  href="${ctx}/mall/shop/view?id=${entity.shop.id}" target="dialog"  mask="true" rel="mall_shopPromotion_lookupdialog"  title="查看商铺">${entity.shop.name}</a>
					</c:if>
					</td>
						
					<td>${entity.intro}</td>
						
					<td>${entity.details}</td>
				
					<td><fmt:formatDate value="${entity.beginTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
				
					<td><fmt:formatDate value="${entity.endTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
				
					<td><tag:enum tagType="view" enumName="shopAuditStatus" enumKey="${entity.auditStatus}" /></td>
				
				
					<td>
					
					<sec:authorize ifAllGranted="ROLE_MALL_SHOPPROMOTION_SETSTATUS">
					<tag:enum tagType="editInList" enumName="promotionStatus" enumKey="${entity.status}" href="${ctx}/mall/shopPromotion/setStatus?id=${entity.id}&value=" />
					</sec:authorize>
					<sec:authorize ifNotGranted="ROLE_MALL_SHOPPROMOTION_SETSTATUS">
					<tag:enum tagType="view" enumName="promotionStatus" enumKey="${entity.status}" />
					</sec:authorize>					
					</td>
				
				
				
					
					<td>
						<sec:authorize ifAllGranted="ROLE_MALL_SHOPPROMOTION_DELETE">
							<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/mall/shopPromotion/delete?id=${entity.id}" class="btnDel">删除</a>
						</sec:authorize>
						<sec:authorize ifAllGranted="ROLE_MALL_SHOPPROMOTION_EDIT">
							<c:if test="${entity.auditStatus==0||entity.auditStatus==4}">
							<a title="编辑商铺促销活动" target="navTab" rel="mall_shopPromotion_edit" href="${ctx}/mall/shopPromotion/edit?id=${entity.id}" class="btnEdit">编辑</a>
							</c:if>
						</sec:authorize>
						<sec:authorize ifAllGranted="ROLE_MALL_SHOPPROMOTION_AUDIT">
							<c:if test="${entity.auditStatus==1}">
							<a title="审核商铺促销活动" target="navTab" rel="mall_shopPromotion_audit" href="${ctx}/mall/shopPromotion/audit?id=${entity.id}" class="btnEdit">审核</a>
							</c:if>
						</sec:authorize>
						<a title="查看商铺促销活动" target="navTab" rel="mall_shopPromotion_view" href="${ctx}/mall/shopPromotion/view?id=${entity.id}" class="btnView">查看</a>
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
