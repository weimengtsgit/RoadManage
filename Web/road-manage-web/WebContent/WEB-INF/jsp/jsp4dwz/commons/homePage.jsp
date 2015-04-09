<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!DOCTYPE html >
<html>
<head>
<title><%=sysName%></title>
<%@ include file="/WEB-INF/jsp/commons/meta_report.jsp"%>
<%
	Object obj = session.getAttribute("curUser");
	if (obj == null) {
%>
<script type="text/javascript
	top.window.location.href = "${ctx}/j_spring_security_logout";

	</script>
<%
	}
%>


<style type="text/css">

.b_pro_status div.b_pro_block {
	background: white;
	float: left;
	height: 152px;
	margin: 0px 11px 0 0;
	padding: 0 0 0 15px;
	width: 20%;
}

.b_pro_status div.b_pro_block_bg div {
	padding: 0 20px;
	margin: 10px 0;
	text-align: center;
	font-family: 微软雅黑 !important;
}

.b_pro_status div.b_pro_block div.b_pro_block_bg {
	height: 100%;
	width: 100%;
}

.b_pro_status div.b_pro_block h3.b_pro_title {
	padding: 5px 0 0px 0;
	text-align: center;
	color: #6d6e6e;
	font-size: 16px;
	font-family: 微软雅黑 !important;
}

.b_pro_status div.b_pro_block hr {
	height: 1px;
	width: 90%;
	margin: 0 auto;
	color: #CCCCCC;
}

.b_pro_status div.b_pro_block span.b_pro_date {
	padding: 7px 5px 0 0;
	float: left;
	color: #7E7C81;
	font-family: 微软雅黑 !important;
}

.b_pro_status div.b_pro_block span.b_pro_number {
	color: #efa928;
	font-size: 30px;
	margin-left: -20px;
}

.b_pro_status div.b_pro_block.item-1 {
	margin-left: 10px;
}

/* 报表样式 */
.b_chart {
	padding: 15px 0 0 0;
	position: relative;
}


.clear {
	clear: both;
	height:20px;
	border-bottom:1px solid #ccc;
}
</style>
</head>
<body style="overflow: hidden;">

	<!-- 显示信息 -->
	<div class="b_pro_status" >
		<div class="b_pro_block item-1">
			<div class="b_pro_block_bg">
				<h3 class="b_pro_title">数据总量</h3>
				<hr size="1" />
				<div>
					<span class="b_pro_date">昨日</span> <span class="b_pro_number" id="yesterdayAmount">0</span>
				</div>
				<div>
					<span class="b_pro_date">今日</span> <span class="b_pro_number" id="amount">0</span>
				</div>
			</div>
		</div>
		<div class="b_pro_block item-2">
			<div class="b_pro_block_bg">
				<h3 class="b_pro_title">中标总量</h3>
				<hr size="1" />
				<div>
					<span class="b_pro_date">昨日</span> <span class="b_pro_number" id="yesterdayMistrustAmount">0</span>
				</div>
				<div>
					<span class="b_pro_date">今日</span> <span class="b_pro_number" id="mistrustAmount">0</span>
				</div>
			</div>
		</div>
		<div class="b_pro_block item-3">
			<div class="b_pro_block_bg">
				<h3 class="b_pro_title">违规总量</h3>
				<hr size="1" />
				<div>
					<span class="b_pro_date">昨日</span> <span class="b_pro_number" id="yesterdayIllegalAmount">0</span>
				</div>
				<div>
					<span class="b_pro_date">今日</span> <span class="b_pro_number" id="illegalAmount">0</span>
				</div>
			</div>
		</div>
		<div class="b_pro_block item-4">
			<div class="b_pro_block_bg">
				<h3 class="b_pro_title">数据历史总量</h3>
				<hr size="1" />
				<div style="margin-top: 25px;">
					<span class="b_pro_number" style="margin: 0;" id="historyAmount">0</span>
				</div>
			</div>
		</div>

		<div class="clear"></div>
		
		<!-- 报表信息 -->
		<div class="b_chart">
			<div id="daily-installations-chart2" style="width: 48%; height: 100%;float: left;"></div>
			<div id="daily-installations-chart" style="width: 48%;height: 100%; float: left;"></div>
		</div>
	</div>
</body>


<script type="text/javascript">
	$(function() {
		
		$.ajax({
		   type: "POST",
		   url: "${ctx}/report/lazyReport",
		   success: function(obj){
			   if(obj){
					   $('#yesterdayAmount').text(obj.yesterdayAmount);
					   $('#amount').text(obj.amount);
					   $('#yesterdayMistrustAmount').text(obj.yesterdayMistrustAmount);
					   $('#mistrustAmount').text(obj.mistrustAmount);
					   $('#yesterdayIllegalAmount').text(obj.yesterdayIllegalAmount);
					   $('#illegalAmount').text(obj.illegalAmount);
					   $('#historyAmount').text(obj.historyAmount);
			   }
		   }
		});
		
		var chart_options_1 = {
			chart : {
				renderTo : 'daily-installations-chart',
				type : 'spline'
			},
			title : {
				text : '彩信数据走势图',
				x : -20,
				style : {
					//fontSize: '16px'
				}
			},
			subtitle : {
				text : '年份:${fn:substring(curDate, 0, 4)}',
				x : -20
			},
			xAxis : {
				categories : [],
				labels : {
					/* rotation : 45,
					fontStyle : 'italic', */
					formatter : function(){
						return this.value.substring(5);
					}
				}
			},
			yAxis : {
				title : {
					text : '数据 (条)'
				},
				min : 0
			},
			tooltip : {
				formatter : function() {
					return '<b>' + this.series.name + '</b><br/>' + this.x
							+ ': ' + this.y + '条';
				}
			},
			series : [1,2]
		};
		
		var chart_options_2 = {
			chart : {
				renderTo : 'daily-installations-chart2'
			},
			title : {
				text : '彩信类别分布图',
				x : -20,
				style : {
					/* fontSize: '16px' */
				}
			},
			subtitle : {
				text : '日期: ${curDate}',
				x : -20
			},
			tooltip: {
        	    pointFormat: '{point.percentage}%</b>',
            	percentageDecimals: 1
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true
                    },
                    showInLegend: true
                }
            },
			series : [{
						type: 'pie',
						data: [0.2,0.8]
					 }]
		};
		
		$.ajax({
		   type: "POST",
		   url: "${ctx}/commons/findAmount",
		   success: function(msg){
// 			   var obj = jQuery.parseJSON(msg);
// 			   if(obj){
// 				   chart_options_1.xAxis.categories={};
// 				   chart_options_1.series={};
				   chart1 = new Highcharts.Chart(chart_options_1);
// 			   }
		   }
		});
		
		$.ajax({
		   type: "POST",
		   url: "${ctx}/commons/findTypeAmount",
		   success: function(msg){
			  
					chart2 = new Highcharts.Chart(chart_options_2);
			   
		   }
		});
	});

	$(window).resize(function() {
		var ih = $(this).height();
		$(".b_chart").height(ih-180);
	});
</script>
</html>