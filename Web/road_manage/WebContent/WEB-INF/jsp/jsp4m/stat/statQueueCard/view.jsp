<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>

<!-- BEGIN DASHBOARD STATS -->
<div class="row">
	<div class="col-md-4">
		<div class="dashboard-stat blue">
			<div class="visual">
				<i class="fa fa-user"></i>
			</div>
			<div class="details">
				<div id="todayReceived" class="number">0</div>
				<div id="todayReceived_up_span" class="desc"></div>
			</div>
			<a class="more" href="#"> 今日领号数<i
				class="m-icon-swapright m-icon-white"></i>
			</a>
		</div>
	</div>
	<div class="col-md-4">
		<div class="dashboard-stat green">
			<div class="visual">
				<i class="fa  fa-user"></i>
			</div>
			<div class="details">
				<div id="todayUsed" class="number">0</div>
				<div id="todayUsed_up_span" class="desc"></div>
			</div>
			<a class="more" href="#"> 今日使用数<i
				class="m-icon-swapright m-icon-white"></i>
			</a>
		</div>
	</div>
	<div class="col-md-4">
		<div class="dashboard-stat purple">
			<div class="visual">
				<i class="fa   fa-user"></i>
			</div>
			<div class="details">
				<div id="todayUsedRate" class="number">0</div>
				<div class="desc"></div>
			</div>
			<a class="more" href="#"> 今日成单率<i
				class="m-icon-swapright m-icon-white"></i>
			</a>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-4">
		<div class="dashboard-stat blue">
			<div class="visual">
				<i class="fa fa-user"></i>
			</div>
			<div class="details">
				<div id="yesterdayReceived" class="number">0</div>
				<div id="yesterdayReceived_up_span" class="desc"></div>
			</div>
			<a class="more" href="#"> 昨日领号数<i
				class="m-icon-swapright m-icon-white"></i>
			</a>
		</div>
	</div>
	<div class="col-md-4">
		<div class="dashboard-stat green">
			<div class="visual">
				<i class="fa  fa-user"></i>
			</div>
			<div class="details">
				<div id="yesterdayUsed" class="number">0</div>
				<div id="yesterdayUsed_up_span" class="desc"></div>
			</div>
			<a class="more" href="#"> 昨日使用数<i
				class="m-icon-swapright m-icon-white"></i>
			</a>
		</div>
	</div>
	<div class="col-md-4">
		<div class="dashboard-stat purple">
			<div class="visual">
				<i class="fa   fa-user"></i>
			</div>
			<div class="details">
				<div id="yesterdayUsedRate" class="number">0</div>
				<div class="desc"></div>
			</div>
			<a class="more" href="#"> 昨日成单率<i
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

<script type="text/javascript">
	var todayReceived = 0;
	var todayUsed = 0;
	var chart_options = {
		chart : {
			type : 'spline',
			renderTo : 'daily-chart'
		},
		title : {
			text : '成单数'
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
			name : '成单数'
		} ]
	};
	function Percentage(num, total) {
		return (Math.round(num / total * 10000) / 100);// 小数点后两位百分比

	}
	function init() {
		$
				.ajax({
					type : "POST",
					url : "${ctx}/stat/statQueueCard/init",
					success : function(obj) {
						if (obj) {
							$('#todayReceived').text(obj.todayReceived);
							todayReceived = obj.todayReceived;
							$('#todayUsed').text(obj.todayUsed);
							todayUsed = obj.todayUsed;
							$('#todayUsedRate')
									.text(
											Percentage(obj.todayUsed,
													obj.todayReceived)
													+ '%');
							$('#yesterdayReceived').text(obj.yesterdayReceived);
							$('#yesterdayUsed').text(obj.yesterdayUsed);
							$('#yesterdayUsedRate').text(
									Percentage(obj.yesterdayUsed,
											obj.yesterdayReceived)
											+ '%');
						}
						setTimeout("fresh()", 3000);
					}
				});

		chart();
	}

	function fresh() {
		$
				.ajax({
					type : "POST",
					url : "${ctx}/stat/statQueueCard/fresh",
					success : function(obj) {
						if (obj) {
							$('#todayReceived').text(obj.todayReceived);
							$('#todayReceived_up_span').text(
									'+' + (obj.todayReceived - todayReceived));
							todayReceived = obj.todayReceived;
							$('#todayUsed').text(obj.todayUsed);
							$('#todayUsed_up_span').text(
									'+' + (obj.todayUsed - todayUsed));
							todayUsed = obj.todayUsed;
							$('#todayUsedRate')
									.text(
											Percentage(obj.todayUsed,
													obj.todayReceived)
													+ '%');
						}
					}
				});
	}

	function chart() {
		$.ajax({
			type : "POST",
			url : "${ctx}/stat/statQueueCard/chart",
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

	$(function() {
		init();
	});
</script>