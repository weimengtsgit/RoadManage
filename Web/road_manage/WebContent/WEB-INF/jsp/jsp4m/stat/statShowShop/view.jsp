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
				<div id="totalPv" class="number">0</div>
				<div id="totalPv_up_span" class="desc"></div>
			</div>
			<a class="more" href="#"> 客流总量<i
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
				<div id="todayPv" class="number">0</div>
				<div id="todayPv_up_span" class="desc"></div>
			</div>
			<a class="more" href="#"> 今日客流<i
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
				<div id="yesterdayPv" class="number">0</div>
				<div class="desc">
					<img id="yesterdayPv_up_img" src="${ctx}/images/up16.png"><span
						id="yesterdayPv_up_span" class="up_num"></span>
				</div>
			</div>
			<a class="more" href="#"> 昨日客流<i
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
	var totalPv = 0;
	var todayPv = 0;
	var chart_options = {
		chart : {
			type : 'spline',
			renderTo : 'daily-chart'
		},
		title : {
			text : '客流量'
		},
		xAxis : {
			type : 'category',
			tickInterval : 1
		},
		yAxis : {
			title : {
				text : '客流量(人数)'
			},
			min : 0
		},
		series : [ {
			name : '客流量'
		} ]
	};
	function Percentage(num, total) {
		return (Math.round(num / total * 10000) / 100);// 小数点后两位百分比

	}
	function setUpNum(preId, t, y) {
		var v = Percentage((t - y), y);
		var classname = "down_num";
		var imgsrc = "${ctx}/images/down16.png";
		if (v < 0) {
			v = v + "%";
		} else {
			v = "+" + v + "%";
			classname = "up_num";
			imgsrc = "${ctx}/images/up16.png";
		}
		$("#" + preId + "img").attr("src", imgsrc);
		$("#" + preId + "span").attr("class", classname);
		$("#" + preId + "span").text(v);
	}
	function init() {
		$.ajax({
			type : "POST",
			url : "${ctx}/stat/statShowShop/init",
			success : function(obj) {
				if (obj) {
					$('#totalPv').text(obj.totalPv);
					totalPv = obj.totalPv;
					$('#todayPv').text(obj.todayPv);
					todayPv = obj.todayPv;
					$('#yesterdayPv').text(obj.yesterdayPv);
					setUpNum('yesterdayPv_up_', obj.yesterdayPv,
							obj.beforeYesterdayPv);
				}
				setTimeout("fresh()", 3000);
			}
		});

		chart();
	}

	function fresh() {
		$.ajax({
			type : "POST",
			url : "${ctx}/stat/statShowShop/fresh",
			success : function(obj) {
				if (obj) {
					$('#totalPv').text(obj.totalPv);
					$('#totalPv_up_span').text('+' + (obj.totalPv - totalPv));
					totalPv = obj.totalPv;
					$('#todayPv').text(obj.todayPv);
					$('#todayPv_up_span').text('+' + (obj.todayPv - todayPv));
					todayPv = obj.todayPv;
				}
			}
		});
	}

	function chart() {
		$.ajax({
			type : "POST",
			url : "${ctx}/stat/statShowShop/chart",
			success : function(obj) {
				if (obj) {
					$('#startDate').val(obj.startDate);
					$('#endDate').val(obj.endDate);
					chart_options.series[0].data = obj.pv;
					new Highcharts.Chart(chart_options);
				}
			}
		});
	}

	$(function() {
		init();
	});
</script>