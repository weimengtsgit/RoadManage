<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>

<!-- BEGIN DASHBOARD STATS -->
<div class="row">
	<div class="col-md-6">
		<div class="dashboard-stat blue">
			<div class="visual">
				<i class="fa fa-user"></i>
			</div>
			<div class="details">
				<div id="total" class="number">0</div>
				<div id="total_up_span" class="desc"></div>
			</div>
			<a class="more" href="#"> 会员总数<i
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
				<div id="today" class="number">0</div>
				<div id="today_up_span" class="desc"></div>
			</div>
			<a class="more" href="#"> 今日新增<i
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
	var total = 0;
	var today = 0;
	var chart_options = {
		chart : {
			type : 'spline',
			renderTo : 'daily-chart'
		},
		title : {
			text : '新增会员数'
		},
		xAxis : {
			type : 'category',
			tickInterval : 1
		},
		yAxis : {
			title : {
				text : '会员数'
			},
			min : 0
		},
		series : [ {
			name : '新增会员数'
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
			url : "${ctx}/stat/statShopMember/fresh",
			success : function(obj) {
				if (obj) {
					$('#total').text(obj.total);
					totalPv = obj.totalPv;
					$('#today').text(obj.today);
					today = obj.today;
				}
				setTimeout("fresh()", 3000);
			}
		});

		chart();
	}

	function fresh() {
		$.ajax({
			type : "POST",
			url : "${ctx}/stat/statShopMember/fresh",
			success : function(obj) {
				if (obj) {
					$('#total').text(obj.total);
					$('#total_up_span').text('+' + (obj.total - total));
					total = obj.total;
					$('#today').text(obj.today);
					$('#today_up_span').text('+' + (obj.today - today));
					today = obj.today;
				}
			}
		});
	}

	function chart() {
		$.ajax({
			type : "POST",
			url : "${ctx}/stat/statShopMember/chart",
			success : function(obj) {
				if (obj) {
					$('#startDate').val(obj.startDate);
					$('#endDate').val(obj.endDate);
					chart_options.series[0].data = obj.member;
					new Highcharts.Chart(chart_options);
				}
			}
		});
	}

	$(function() {
		init();
	});
</script>