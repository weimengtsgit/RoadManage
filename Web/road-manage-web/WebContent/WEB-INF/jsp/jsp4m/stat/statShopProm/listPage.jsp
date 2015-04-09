<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/stat/statShopProm/"></c:set>
<c:set scope="page" var="dataTitle" value="优惠统计"></c:set>
<c:set scope="page" var="tableId" value="data-table-statShopProm-1"></c:set>
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
<!-- BEGIN DASHBOARD STATS -->
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN SAMPLE TABLE PORTLET-->
		<div class="portlet box grey">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-info"></i><span id="intro">优惠内容</span>
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"></a> <a href="javascript:;"
						class="reload"></a>
				</div>
			</div>
			<div class="portlet-body">
				<div class="row">
					<div class="col-md-6">
						<div class="dashboard-stat blue">
							<div class="visual">
								<i class="fa fa-user"></i>
							</div>
							<div class="details">
								<div id="receivedRate" class="number"></div>
								<div id="receivedRate_up_span" class="desc"></div>
							</div>
							<a class="more" href="#"> 优惠发放率<i
								class="m-icon-swapright m-icon-white"></i>
							</a>
						</div>
					</div>
					<div class="col-md-6">
						<div class="dashboard-stat green">
							<div class="visual">
								<i class="fa  fa-user"></i>
							</div>
							<div class="details">
								<div id="consumedRate" class="number"></div>
								<div id="consumedRate_up_span" class="desc"></div>
							</div>
							<a class="more" href="#"> 优惠使用率<i
								class="m-icon-swapright m-icon-white"></i>
							</a>
						</div>
					</div>
				</div>
				<!-- END DASHBOARD STATS -->
				<div class="row">

					<div class="col-md-12">
						<!-- BEGIN  CHART-1 PORTLET-->
						<div class="portlet box blue">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-bar-chart-o"></i>趋势图
								</div>
								<div class="tools">
									<a href="javascript:;" class="collapse"></a>
								</div>
							</div>
							<div class="portlet-body">
								<div class="row">
									<div class="col-md-12">
										<form class="form-inline" role="form" onsubmit="return false;">
											<a href="#" class="btn search default pull-right "><i
												class="fa fa-search"></i></a>
											<div
												class="input-group input-large date-picker input-daterange pull-right"
												data-date-format="yyyy-mm-dd">

												<input id="startDate" required="true" type="text"
													class="form-control" name="startDate"> <span
													class="input-group-addon"> <i
													class="glyphicon glyphicon-resize-horizontal"></i>
												</span> <input id="endDate" required="true" type="text"
													class="form-control" name="endDate">
											</div>
										</form>
									</div>
								</div>
								<div id="daily-chart" class="chart"></div>
							</div>
						</div>
						<!-- END  CHART PORTLET-->
					</div>

				</div>

				<!-- END PAGE CONTENT -->
			</div>
		</div>
		<!-- END SAMPLE TABLE PORTLET-->
	</div>
</div>

<script>
	var chart_options = {
		chart : {
			type : 'spline',
			renderTo : 'daily-chart'
		},
		title : {
			text : '优惠使用数'
		},
		xAxis : {
			type : 'category',
			tickInterval : 1
		},
		yAxis : {
			title : {
				text : '使用数'
			},
			min : 0
		},
		series : [ {
			name : '优惠使用数'
		} ]
	};

	function Percentage(num, total) {
		return (Math.round(num / total * 10000) / 100);// 小数点后两位百分比

	}

	function freshById(promId) {
		$.ajax({
			type : "POST",
			url : "${urlPrev }freshById",
			data : {
				id : promId
			},
			success : function(obj) {
				if (obj) {
					$('#intro').text('优惠内容:' + obj.intro);
					$('#receivedRate').text(
							Percentage(obj.received, obj.showCount) + '%');
					$('#consumedRate').text(
							Percentage(obj.consumed, obj.received) + '%');
				}
			}
		});

		chartById(promId);
	}

	function chartById(promId) {
		$.ajax({
			type : "POST",
			url : "${urlPrev }chartById",
			data : {
				id : promId
			},
			success : function(obj) {
				if (obj) {
					$('#startDate').val(obj.startDate);
					$('#endDate').val(obj.endDate);
					chart_options.series[0].data = obj.chart;
					new Highcharts.Chart(chart_options);
				}
			}
		});
	}

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
														sTitle : '优惠名',
														mData : "intro"
													},
													{
														sTitle : '状态',
														mData : "status",
														mRender : function(
																data, type,
																full) {
															if (data == 1) {
																return '优惠进行中';
															} else {
																return '优惠已结束';
															}
														}
													},
													{
														sTitle : '今日领用数',
														mData : "todayReceived",
														bSortable : false
													},
													{
														sTitle : '今日使用数',
														mData : "todayConsumed",
														bSortable : false
													},
													{
														sTitle : '领用总数',
														mData : "received",
														bSortable : false
													},
													{
														sTitle : '使用总数',
														mData : "consumed",
														bSortable : false
													},
													{
														sTitle : "趋势统计",
														mData : "id",
														bSortable : false,
														mRender : function(
																data, type,
																full) {
															return '<a href="javascript:freshById('
																	+ data
																	+ ');" class="btn  btn-xs blue dblclick"><i class="fa fa-info-circle"></i></a>';
														}
													} ]
										});
					});
</script>
