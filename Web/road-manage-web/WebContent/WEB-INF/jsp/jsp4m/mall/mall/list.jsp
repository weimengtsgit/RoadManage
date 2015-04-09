<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
			<div class="row">
				<div class="col-md-12">
				
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet box grey">
						<div class="portlet-title">
							<div class="caption"><i class="fa fa-table"></i>数据列表</div>
							
							
							
							<div class="tools">
								<a href="javascript:;" class="collapse"></a>
								<a href="javascript:;" class="reload"></a>
							</div>

							



							
						</div>
						<div class="portlet-body">
							<div class="table-scrollable">
								<table class="table table-striped table-bordered table-hover" id="sample_1">
									<thead>
										<tr>
											<th class="table-checkbox"><input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" /></th>
											<th orderField="name" class="sorting${pageData.compositor.fieldName eq 'name' ? '_'+pageData.compositor.compositorType : ''}">商场名称</th>
											<th orderField="address" class="sorting${pageData.compositor.fieldName eq 'address' ? '_'+pageData.compositor.compositorType : ''}">商场地址</th>
											<th orderField="contact" class="sorting${pageData.compositor.fieldName eq 'contact' ? '_'+pageData.compositor.compositorType : ''}">联系人</th>
											<th orderField="phone" class="sorting${pageData.compositor.fieldName eq 'phone' ? '_'+pageData.compositor.compositorType : ''}">电话</th>
											<th orderField="createTime" class="sorting${pageData.compositor.fieldName eq 'createTime' ? '_'+pageData.compositor.compositorType : ''}">创建时间</th>
											<th >操作</th>
										</tr>
									</thead>
									<tbody>
										
										<c:forEach var="entity" items="${pageData.result}" varStatus="s">
												<tr>
												<td><input name="ids" value="${entity.id }" class="checkboxes"  type="checkbox"></td>
												<td>${entity.name}</td>
												<td>${entity.address}</td>
												<td>${entity.contact}</td>
												<td>${entity.phone}</td>
												<td><fmt:formatDate value="${entity.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
												<td>
													<sec:authorize ifAllGranted="ROLE_MALL_MALL_DELETE">
														<a title="确实要删除吗？" target="ajaxTodo" href="${ctx}/mall/mall/delete?id=${entity.id}" class="btnDel">删除</a>
													</sec:authorize>
													<sec:authorize ifAllGranted="ROLE_MALL_MALL_EDIT">
														<a title="编辑商场信息" target="navTab" rel="mall_mall_edit" href="${ctx}/mall/mall/edit?id=${entity.id}" class="btnEdit">编辑</a>
													</sec:authorize>
													<a title="查看商场信息" target="navTab" rel="mall_mall_view" href="${ctx}/mall/mall/view?id=${entity.id}" class="btnView">查看</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- BEGIN PAGINATION -->
							<div class="row">
							<div class="col-md-5 col-sm-12">
							<div class="dataTables_info" id="sample_2_info">共${pageData.pagination.totalCount}条     当前第${pageData.pagination.pageNo}页</div></div>
							<div class="col-md-7 col-sm-12"><div class="dataTables_paginate paging_bootstrap">
							<ul class="pagination" style="visibility: visible;">
							<li class="prev disabled">
							<a href="#" title="Previous"><i class="fa fa-angle-left">
							</i>
							</a>
							</li>
							
							<li class="next"><a href="#" title="Next"><i class="fa fa-angle-right"></i></a></li>
							</ul>
							</div>
							</div>
							</div>
							<!-- END PAGINATION -->
							
						</div>
					</div>
					<!-- END SAMPLE TABLE PORTLET-->
					
					
				</div>
			</div>
<!-- END PAGE CONTENT --> 
<script>
TableManaged.init('sample_1');
</script>