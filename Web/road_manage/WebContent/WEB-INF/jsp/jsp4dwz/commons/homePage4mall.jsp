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
	height: 102px;
	margin: 0px 11px 0 0;
	padding: 0 0 0 15px;
	width: 22%;
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
	color: #6d6e6e;
	font-size: 30px;
	margin-left: -20px;
}
.b_pro_status div.b_pro_block span.b_pro_number_online{
	color: #E04F12;
	font-size: 30px;
	margin-left: -20px;
}

.b_pro_status div.b_pro_block.item-1 {
	margin-left: 10px;
}
.up_num {
	font-size: 9px;
	color: #E04F12;
}
.down_num {
	font-size: 9px;
	color: green;
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
<body >
	
	<!-- 显示信息 -->
	<div class="b_pro_status" >
		<div class="b_pro_block item-1">
			<div class="b_pro_block_bg">
				<h3 class="b_pro_title">宣传页展示数</h3>
				<hr size="1" />
				<div >
					<span class="b_pro_date">今日</span> <span class="b_pro_number" id="mall_pv_today">0</span><img id="mall_pv_up_img" src="${ctx}/images/up16.png"><span id="mall_pv_up_span"  class="up_num"></span>
				</div>
			</div>
		</div>
		<div class="b_pro_block item-2">
			<div class="b_pro_block_bg" >
				<h3 class="b_pro_title">无线网络客流量</h3>
				<hr size="1" />
				<div >
					<span class="b_pro_date">今日</span> <span class="b_pro_number" id="mall_uv_today">0</span><img id="mall_uv_up_img" src="${ctx}/images/up16.png"><span id="mall_uv_up_span" class="up_num"></span>
				</div>
			</div>
		</div>
		<div class="b_pro_block item-3">
			<div class="b_pro_block_bg">
				<h3 class="b_pro_title">手机注册用户数</h3>
				<hr size="1" />
				<div>
					<span class="b_pro_date">今日</span> <span class="b_pro_number" id="mall_new_user_today">0</span><img id="mall_user_up_img" src="${ctx}/images/up16.png"><span id="mall_user_up_span" class="down_num"></span>
				</div>
				
			</div>
		</div>
		
		<div class="b_pro_block item-4">
			<div class="b_pro_block_bg">
				<h3 class="b_pro_title">在线用户数/用户总数</h3>
				<hr size="1" />
				<div >
					<span class="b_pro_number_online" style="margin: 0;" id="mall_user_online">0</span>
					<span class="b_pro_number" style="margin: 0;" >/</span>
					<span class="b_pro_number" style="margin: 0;" id="mall_user_all">0</span>
				</div>
			</div>
		</div>
				
		<div class="clear"></div>
		
		<!-- 报表信息 -->
		<div class="b_chart">
			<div id="daily-chart-uv" style="width: 48%; height: 360px;float: left;"></div>
			<div id="daily-chart-online" style="width: 48%;height: 360px; float: left;"></div>
		</div>
	</div>
</body>


<script type="text/javascript">
	function Percentage(num, total) { 
	    return (Math.round(num / total * 10000) / 100 );// 小数点后两位百分比
	   
	}
	function setUpNum(preId,t,y){
		var v = Percentage((t-y),y);
		var classname = "down_num";
		var imgsrc = "${ctx}/images/down16.png";
		if(v>=0){
			v="+"+v+"%";
			classname="up_num";
			imgsrc = "${ctx}/images/up16.png";
		}else{
			v=v+"%";
		}
		$("#"+preId+"img").attr("src",imgsrc);
		$("#"+preId+"span").attr("class",classname);
		$("#"+preId+"span").text(v);
	}
	function getCount(){
		$.ajax({
			   type: "POST",
			   url: "${ctx}/report/mallReportFresh",
			   success: function(obj){
				  
				   if(obj){
						   $('#mall_pv_today').text(obj.mall_pv_today);
						   setUpNum('mall_pv_up_',obj.mall_pv_today,obj.mall_pv_yesterday);
						   $('#mall_uv_today').text(obj.mall_uv_today);
						   setUpNum('mall_uv_up_',obj.mall_uv_today,obj.mall_uv_yesterday);
						   $('#mall_new_user_today').text(obj.mall_new_user_today);
						   setUpNum('mall_user_up_',obj.mall_new_user_today,obj.mall_new_user_yesterday);
						   $('#mall_user_all').text(obj.mall_new_user_all);
						   $('#mall_user_online').text(obj.mall_user_online);
						   
						   
				   }
				   
// 				   setTimeout("getCount()", 3000);
			   }
			});
	}
	$(function() {
		
		
		getCount();
		
		var chart_options_1 = {
				 chart: {
		                type: 'spline',
		                renderTo : 'daily-chart-uv'
		            },
		            title: {
		                text: '无线网络客流量趋势'
		            },
		            subtitle: {
		                text: '最近一周'
		            },
		            xAxis: {
		                type: 'category'
		            	,tickInterval: 2
		            },
		            yAxis: {
		                title: {
		                    text: '客流量(人数)'
		                },
		                min: 0
		            },
		           
			series : [{
                name: '客流量',
                data: [
                   
                ]
            }]
		};
		
		var chart_options_2 = {
				 chart: {
		                type: 'spline',
		                renderTo : 'daily-chart-online'
		            },
		            title: {
		                text: '在线用户趋势'
		            },
		            subtitle: {
		                text: '8:00-24:00'
		            },
		            xAxis: {
		                type: 'category',
// 		                labels:{ 
// 		                    step:4
// 		                } 
		                tickInterval: 4
		            },
		            yAxis: {
		                title: {
		                    text: '在线用户数'
		                }
		            },
		           
			series : [{
                name: '在线用户数',
                	data:[
							
		               	      ]
            }]
		};
		

		
		$.ajax({
		   type: "POST",
		   url: "${ctx}/report/mallReport",
		   success: function(obj){
			   
			   chart_options_1.series[0].data=obj.mall_last_pv;
			   chart1 = new Highcharts.Chart(chart_options_1);
			   
			   chart_options_2.series[0].data=obj.mall_online_hour;
			   chart2 = new Highcharts.Chart(chart_options_2);
		   }
		});
		
		
		
	});

	
</script>
</html>