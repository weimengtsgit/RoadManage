<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>

<!-- BEGIN DASHBOARD STATS -->
<div class="row">
		<div class="col-md-3">
			<div class="dashboard-stat blue">
				<div class="visual">
					<i class="fa fa-bar-chart-o"></i>
				</div>
				<div class="details">
					<div id="mall_pv_today" class="number">
						
					</div>
					<div id="mall_pv_up_span"  class="desc">                           
						
					</div>
				</div>
				               
				<a class="more" href="${ctx}/customer/statShow/listPage" data-handler="MODAL" >
				今日宣传页展示数 <i class="m-icon-swapright m-icon-white"></i>
				</a>                 
			</div>
		</div>
		<div class="col-md-3">
			<div class="dashboard-stat green">
				<div class="visual">
					<i class="fa  fa-globe"></i>
				</div>
				<div class="details">
					<div id="mall_uv_today" class="number"></div>
					<div id="mall_uv_up_span" class="desc"></div>
				</div>
				<a class="more" href="${ctx}/customer/statShow/listPage" data-handler="MODAL">
				今日无线网络客流量 <i class="m-icon-swapright m-icon-white"></i>
				</a>                 
			</div>
		</div>
		<div class="col-md-3">
			<div class="dashboard-stat purple">
				<div class="visual">
					<i class="fa   fa-user"></i>
				</div>
				<div class="details">
					<div id="mall_new_user_today" class="number"></div>
					<div id="mall_user_all" class="desc"></div>
				</div>
				<a class="more" href="${ctx}/customer/customer/listPage" data-handler="MODAL">
				今日注册用户数/用户总数 <i class="m-icon-swapright m-icon-white"></i>
				</a>                 
			</div>
		</div>
		<div class="col-md-3">
			<div class="dashboard-stat yellow">
				<div class="visual">
					<i class="fa fa-mobile-phone"></i>
				</div>
				<div class="details">
					<div id="mall_term_online" class="number"></div>
					<div id="mall_term_all" class="desc"></div>
				</div>
				<a class="more" href="${ctx }/customer/terminal/listPage" data-handler="MODAL">
				在线终端数/终端总数 <i class="m-icon-swapright m-icon-white"></i>
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
				<div class="caption"><i class="fa fa-bar-chart-o"></i>在线用户趋势</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"></a>
				</div>
			</div>
			<div class="portlet-body">
				<div id="chart_online" class="chart"></div>
			</div>
		</div>
		<!-- END  CHART PORTLET-->
	</div>
	<div class="col-md-12">
		<!-- BEGIN  CHART-1 PORTLET-->
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption"><i class="fa fa-bar-chart-o"></i>宣传页访问量/客流量趋势</div>
				<div class="tools">
					
					<a href="javascript:;" class="collapse"></a>
				</div>

			</div>
			<div class="portlet-body">
				<div id="chart_pv_uv" class="chart"></div>
			</div>
		</div>
		<!-- END  CHART PORTLET-->
	</div>
	
</div>
<script src="${ctx }/assets/scripts/index.js" type="text/javascript"></script>
<script>
jQuery(document).ready(function() {    
	   Index.initMiniCharts();
});

</script>
