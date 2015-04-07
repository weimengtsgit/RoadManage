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
				<div id="totalPv" class="number">0</div>
				<div id="totalPv_up_span" class="desc"></div>
			</div>
			<a class="more" href="#"> 活动浏览总数<i
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
				<div id="todayPv" class="number">0</div>
				<div id="todayPv_up_span" class="desc"></div>
			</div>
			<a class="more" href="#"> 今日活动浏览<i
				class="m-icon-swapright m-icon-white"></i>
			</a>
		</div>
	</div>
</div>
<!-- END DASHBOARD STATS -->

<script type="text/javascript">
	var totalPv = 0;
	var todayPv = 0;
	function Percentage(num, total) {
		return (Math.round(num / total * 10000) / 100);// 小数点后两位百分比

	}
	function init() {
		$.ajax({
			type : "POST",
			url : "${ctx}/stat/statMallProm/fresh",
			success : function(obj) {
				if (obj) {
					$('#totalPv').text(obj.totalPv);
					totalPv = obj.totalPv;
					$('#todayPv').text(obj.todayPv);
					todayPv = obj.todayPv;
				}
				setTimeout("fresh()", 3000);
			}
		});
	}

	function fresh() {
		$.ajax({
			type : "POST",
			url : "${ctx}/stat/statMallProm/fresh",
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

	$(function() {
		init();
	});
</script>