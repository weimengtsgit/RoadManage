<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
	<div class="row">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet box grey">
						<div class="portlet-title">
							<div class="caption"><i class="fa fa-table"></i>数据列表</div>
							<div class="actions">
								<a href="javascript:;" class="btn ">
									<i class="fa fa-plug"></i>
								</a>
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a>
								<a href="javascript:;" class="reload"></a>
							</div>
						</div>
						<div class="portlet-body">
						<form class="form-inline" role="form" onsubmit="return false;">
								
								
								<a href="#" class="btn search default pull-right"><i class="fa fa-search"></i></a>
								<div class="form-group pull-right">
									<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_shopId.name"  placeholder="商铺">
								</div>
								<div class="form-group pull-right">
									<input type="text" class="form-control form-control-inline input-medium date-picker" data-date-format="yyyy-mm-dd" name="filter_EQD_date"  placeholder="日期">
								</div>
								
						</form>
						
						<table class="table table-striped table-bordered table-hover" id="data-table-reportday-1">
								<thead>
									<tr>
										<th>日期</th>
										<th>商铺</th>
										<th>宣传页展示数(PV)</th>
										<th>无线网络客流量（UV）</th>
										<th>手机注册用户数</th>
									</tr>
								</thead>
								<tbody></tbody>
						</table>
						
						</div>
					</div>
					<!-- END SAMPLE TABLE PORTLET-->
				</div>
	</div>
<!-- END PAGE CONTENT --> 
<script>
$(document).ready(function() {
	 TableAjax.init('data-table-reportday-1',{
		 "sAjaxSource": _GLOBAL.ctx+"/report/reportDay/listJSON",
		 "aoColumns": [
		               
		               { "mData": "date" ,
		            	   "mRender": function ( data, type, full ) {
	                              return new Date(data).format('yyyy-MM-dd');
	               	            }
		               },
		               { "mData": "shopId.name" },
		               { "mData": "pv" },
		               { "mData": "uv" },
		               { "mData": "newUserCount"}
		             ]
		           
	 }); 
}); 	 
	 

</script>