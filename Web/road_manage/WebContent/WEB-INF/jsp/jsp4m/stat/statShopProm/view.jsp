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
				<div id="received" class="number">0</div>
				<div id="received_up_span" class="desc"></div>
			</div>
			<a class="more" href="#"> 今日领取优惠券<i
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
				<div id="consumed" class="number">0</div>
				<div id="consumed_up_span" class="desc"></div>
			</div>
			<a class="more" href="#"> 今日使用优惠券<i
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
				<div id="consumeRate" class="number">0</div>
				<div class="desc"></div>
			</div>
			<a class="more" href="#"> 优惠成单率<i
				class="m-icon-swapright m-icon-white"></i>
			</a>
		</div>
	</div>
</div>
<!-- END DASHBOARD STATS -->

<script type="text/javascript">
	var received = 0;
	var consumed = 0;
	function Percentage(num, total) {
		return (Math.round(num / total * 10000) / 100);// 小数点后两位百分比

	}
	function init() {
		$.ajax({
			type : "POST",
			url : "${ctx}/stat/statShopProm/fresh",
			success : function(obj) {
				if (obj) {
					$('#received').text(obj.received);
					received = obj.received;
					$('#consumed').text(obj.consumed);
					consumed = obj.consumed;
					$('#consumeRate').text(
							Percentage(obj.totalConsumed, obj.totalReceived)
									+ '%');
				}
				setTimeout("fresh()", 3000);
			}
		});
	}

	function fresh() {
		$.ajax({
			type : "POST",
			url : "${ctx}/stat/statShopProm/fresh",
			success : function(obj) {
				if (obj) {
					$('#received').text(obj.received);
					$('#received_up_span')
							.text('+' + (obj.received - received));
					received = obj.received;
					$('#consumed').text(obj.consumed);
					$('#consumed_up_span')
							.text('+' + (obj.consumed - consumed));
					consumed = obj.consumed;
					$('#consumeRate').text(
							Percentage(obj.totalConsumed, obj.totalReceived)
									+ '%');
				}
			}
		});
	}

	$(function() {
		init();
	});
</script>