<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/mall/shop/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
			
				<li>
					<label>商铺名称：</label>
					<input type="text" name="filter_LIKES_name" value="${pageData.filtraMap.LIKES_name}"/>
				</li>
				<li>
					<label>所属商场：</label>
					<input id="mall_mall_name_list" type="hidden" name="mall.id" value='' />
					<input type="text" name="filter_LIKES_mall.name" value='${pageData.filtraMap["LIKES_mall.name"]}' suggestFields="name" suggestUrl="${ctx}/lookupJson" lookupGroup="mall" />
					<a class="btnLook" href="${ctx}/lookupList" lookupGroup="mall">查找带回</a>
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
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_hotline1" value="${pageData.filtraMap.LIKES_hotline1}"/>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_hotline2" value="${pageData.filtraMap.LIKES_hotline2}"/>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_hotline3" value="${pageData.filtraMap.LIKES_hotline3}"/>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_intro" value="${pageData.filtraMap.LIKES_intro}"/>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_logo" value="${pageData.filtraMap.LIKES_logo}"/>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_image" value="${pageData.filtraMap.LIKES_image}"/>
			
					<input class="hiddenItem" id="mall_logoAttachment_attachName_list" type="hidden" name="filter_EQI_logoAttachment.id" value='${pageData.filtraMap["EQI_logoAttachment.id"]}' />
					<input class="hiddenItem" type="hidden" name="logoAttachment.attachName" value='${pageData.allMap["logoAttachment.attachName"]}' suggestFields="attachName" suggestUrl="${ctx}/attachment/attachment/lookupJson" lookupGroup="logoAttachment"  onchange="if(!this.value) document.getElementById('mall_logoAttachment_attachName_list').value=''" />
			
					<input class="hiddenItem" id="mall_imageAttachment_attachName_list" type="hidden" name="filter_EQI_imageAttachment.id" value='${pageData.filtraMap["EQI_imageAttachment.id"]}' />
					<input class="hiddenItem" type="hidden" name="imageAttachment.attachName" value='${pageData.allMap["imageAttachment.attachName"]}' suggestFields="attachName" suggestUrl="${ctx}/attachment/attachment/lookupJson" lookupGroup="imageAttachment"  onchange="if(!this.value) document.getElementById('mall_imageAttachment_attachName_list').value=''" />
			
					<input class="hiddenItem" id="mall_device_attachName_list" type="hidden" name="filter_EQI_device.id" value='${pageData.filtraMap["EQI_device.id"]}' />
					<input class="hiddenItem" type="hidden" name="device.attachName" value='${pageData.allMap["device.attachName"]}' suggestFields="attachName" suggestUrl="${ctx}/lookupJson" lookupGroup="device"  onchange="if(!this.value) document.getElementById('mall_device_attachName_list').value=''" />
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
<%-- 				<li><a class="button" href="${ctx}/mall/shop/advancedSearch" target="dialog" mask="true" width="795" height="460" rel="mall_shop_advancedSearchList" title="查询框"><span>高级查询</span></a></li> --%>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<sec:authorize ifAllGranted="ROLE_MALL_SHOP_NEW">
				<li><a class="add" href="${ctx}/mall/shop/new" target="navTab" rel="mall_shop_edit"><span>添加商铺信息</span></a></li>
			</sec:authorize>
				<li class="line">line</li>
			<sec:authorize ifAllGranted="ROLE_MALL_SHOP_DELALL">
				<li><a class="delete" href="${ctx}/mall/shop/delAll" target="selectedTodo" rel="ids" postType="string" title="确实要删除这些记录吗?"><span>批量删除</span></a></li>
			</sec:authorize>
				<li class="line">line</li>
<%-- 			<sec:authorize ifAllGranted="ROLE_MALL_SHOP_IMPORT"> --%>
<%-- 				<li><a class="add" href="${ctx}/mall/shop/importView" rel="mall_shop_import" target="dialog" mask="true" width="470" height="230"><span>导入</span></a></li> --%>
<%-- 			</sec:authorize> --%>
<!-- 				<li class="line">line</li> -->
<%-- 			<sec:authorize ifAllGranted="ROLE_MALL_SHOP_EXPORT"> --%>
<%-- 				<li><a class="icon" href="${ctx}/mall/shop/exportExcel?exportPageSize=${pageData.pagination.totalCount}&excelName=商铺信息明细&sheetName=商铺信息明细&title=商铺信息明细" target="dwzExport" target="navTab" title="实要导出这些记录吗?"><span>导出</span></a></li> --%>
<%-- 			</sec:authorize> --%>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
			
				<th orderField="name" class=${pageData.compositor.fieldName eq 'name' ? pageData.compositor.compositorType : ''}>商铺名称</th>
					
				<th orderField="mall.name" class="${pageData.compositor.fieldName eq 'mall.name' ? pageData.compositor.compositorType : ''}">所属商场</th>
					
				<th orderField="createTime" class=${pageData.compositor.fieldName eq 'createTime' ? pageData.compositor.compositorType : ''}>创建时间</th>
					
				<th orderField="sn" class=${pageData.compositor.fieldName eq 'sn' ? pageData.compositor.compositorType : ''}>商铺编号</th>
					
				<th orderField="contact" class=${pageData.compositor.fieldName eq 'contact' ? pageData.compositor.compositorType : ''}>联系人</th>
					
				<th orderField="phone" class=${pageData.compositor.fieldName eq 'phone' ? pageData.compositor.compositorType : ''}>联系人电话</th>
				
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" rel="mall_viewdialog" >
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize} </td>
				
					<td>${entity.name}</td>
					<td>
					<c:if test="${not empty entity.mall.name}">
					<a class="ghbutton search right"  href="${ctx}/mall/mall/view?id=${entity.mall.id}" target="dialog"  mask="true" rel="mall_shop_lookupdialog"  title="查看商场">${entity.mall.name}</a>
					</c:if>
					</td>
						
				
					<td><fmt:formatDate value="${entity.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
						
					<td>${entity.sn}</td>
						
					<td>${entity.contact}</td>
						
					<td>${entity.phone}</td>
				
					
					<td>
						<sec:authorize ifAllGranted="ROLE_MALL_SHOP_DELETE">
							<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/mall/shop/delete?id=${entity.id}" class="btnDel">删除</a>
						</sec:authorize>
						<sec:authorize ifAllGranted="ROLE_MALL_SHOP_EDIT">
							<a title="编辑商铺信息" target="navTab" rel="mall_shop_edit" href="${ctx}/mall/shop/edit?id=${entity.id}" class="btnEdit">编辑</a>
						</sec:authorize>
						<a title="查看商铺信息" target="navTab" rel="mall_shop_view" href="${ctx}/mall/shop/view?id=${entity.id}" class="btnView">查看</a>
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
