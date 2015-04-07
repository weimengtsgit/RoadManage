<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<div class="row">
				<div class="col-md-12">
					<div class="portlet box grey">
						<div class="portlet-title">
							<div class="caption"><i class="fa fa-table"></i>用户上网日志</div>
							
							
							<div class="tools">
								<a href="javascript:;" class="collapse"></a>
								<a href="javascript:;" class="reload"></a>
								<a href="javascript:;" class="remove"></a>
							</div>
							
							<div class="actions">
							</div>
						</div>
						<div class="portlet-body">
						
						
						<form class="form-inline" role="form" onsubmit="return false;">
								
								
								
								<a href="#" class="btn search default pull-right " ><i class="fa fa-search"></i></a>
								<div class="form-group pull-right">
									<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_termMac"  placeholder="终端mac">
								</div>
								
						</form>
						<table class="table table-condensed table-bordered table-hover" id="data-table-userLog-1">
								<thead>
									<tr>
										<th>终端MAC</th>
										<th>认证名</th>
										<th>终端IP</th>
										<th>上线时间</th>
										<th>上网总时长(秒)</th>
										<th>上网总流量(MB)</th>
										<th>费用</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody></tbody>
						</table>
						
						</div>
					</div>
				</div>
	</div>
		

<script>
$(document).ready(function() {
	 

	 TableAjax.init('data-table-userLog-1',{
		 "sAjaxSource": _GLOBAL.ctx+"/customer/userLog/listJSON",
		 "aaSorting": [
						[3, "desc" ]
						],
		 "aoColumns": [
		              
		               { "mData": "termMac" },
		               { "mData": "authName" },
		               { "mData": "termIp" },
// 		               { "mData": "apMac" },
		               { "mData": "onlineTime" ,
		            	   "mRender": Common.formatDateTime
		               },
// 		               { "mData": "offlineTime" ,
// 		            	   "mRender": Common.formatDateTime
// 		               },
		               { "mData": "totalTime" ,"sWidth": "100px"},
		               { "mData": "totalFlow" ,"sWidth": "100px"},
		               { "mData": "totalFee" ,"sWidth": "100px"},
// 		               { "mData": "sessionId" },
		               { "mData": "id",
		            	 'bSortable': false,
		            	 "sWidth": "20px",
		            	 "mRender": function ( data, type, full ) {
		            		 	 
	                              return '<a href="'+_GLOBAL.ctx+'/customer/userLog/view?id='+data+'" class="btn  btn-xs blue dblclick" data-handler="MODAL"><i class="fa fa-info-circle"></i></a>';
	               	            }
		               }
		             ]
		           
	 });
	 
	

});


</script>