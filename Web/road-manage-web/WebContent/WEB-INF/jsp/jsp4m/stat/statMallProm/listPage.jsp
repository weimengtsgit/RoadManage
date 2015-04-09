<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/stat/statMallProm/"></c:set>
<c:set scope="page" var="dataTitle" value="活动统计"></c:set>
<c:set scope="page" var="tableId" value="data-table-statMallProm-1"></c:set>
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN SAMPLE TABLE PORTLET-->
		<div class="portlet box grey">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-table"></i>${dataTitle }列表</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"></a> <a href="javascript:;"
						class="reload"></a>
				</div>

				<div class="actions"></div>
			</div>
			<div class="portlet-body">
				<table class="table table-condensed table-bordered table-hover "
					id="${tableId }">
				</table>
			</div>
		</div>
		<!-- END SAMPLE TABLE PORTLET-->
	</div>
</div>
<!-- END ROW CONTENT-->


<!-- END PAGE CONTENT -->
<script>
	$(document)
			.ready(
					function() {
						TableAjax
								.init(
										'${tableId}',
										{
											sAjaxSource : "${urlPrev }listJSON",
											aaSorting : [ [ 1, "desc" ] ], // 需要自定义
											uxUrlPrev : "${urlPrev }",
											uxDataTitle : "${dataTitle }",
											uxCheckable : false,
											uxCloseScroll : true,
											uxDrapable : false,
											aoColumns : [
													{
														sTitle : '活动名',
														mData : "intro"
													},
													{
														sTitle : '状态',
														mData : "status",
														"mRender" : function(
																data, type,
																full) {
															if (data == 1) {
																return '活动进行中';
															} else {
																return '活动已结束';
															}
														}
													},
													{
														sTitle : '浏览总数',
														mData : "showCount",
														bSortable : false
													},
													{
														sTitle : '今日浏览数',
														mData : "todayPv",
														bSortable : false
													},
													{
														sTitle : '昨日浏览数',
														mData : "yesterdayPv",
														bSortable : false
													},
													{
														sTitle : '日趋势',
														mData : "up",
														bSortable : false,
														"mRender" : function(
																data, type,
																full) {
															if (data >= 0) {
																return '<img src="${ctx}/images/up16.png"><span class="up_num">'
																		+ (data == null ? 'NaN'
																				: data)
																		+ '%</span>';
															} else {
																return '<img src="${ctx}/images/down16.png"><span class="down_num">'
																		+ data
																		+ '%</span>';
															}
														}
													} ]

										});
					});
</script>
