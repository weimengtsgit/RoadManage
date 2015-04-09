<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
	<div class="row">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet box grey">
						<div class="portlet-title">
							<div class="caption"><i class="fa fa-table"></i>操作日志</div>
							
							
							<div class="tools">
								<a href="javascript:;" class="collapse"></a>
								<a href="javascript:;" class="reload"></a>
							</div>
							
							<div class="actions">
							</div>
						</div>
						<div class="portlet-body">
						
						
						<form class="form-inline" role="form" onsubmit="return false;">
								<a href="#" class="btn search default pull-right " ><i class="fa fa-search"></i></a>
								<div class="form-group pull-right">
									<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_name"  placeholder="用户">
								</div>
								
						</form>
						<table class="table table-condensed table-bordered table-hover" id="data-table-sysOperLog-1">
								<thead>
									<tr>
										<th>用户</th>
										<th>操作动作</th>
										<th>操作模块</th>
										<th>操作结果</th>
										<th>用户IP</th>
										<th>操作时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody></tbody>
						</table>
						
						</div>
					</div>
					<!-- END SAMPLE TABLE PORTLET-->
				</div>
	</div>
	<!-- END ROW CONTENT-->
		

<!-- END PAGE CONTENT --> 
<script>
$(document).ready(function() {
	 

	 TableAjax.init('data-table-sysOperLog-1',{
		 "sAjaxSource": _GLOBAL.ctx+"/system/sysOperLog/listJSON",
		 "aaSorting": [
						[5, "desc" ]
						],
		 "aoColumns": [
		              
		               { 
		            	   "mData": "operUser.name",
		            	   "sDefaultContent": "无" 
		            	   
		               },
		               { "mData": "operAction" },
		               { "mData": "operModule" },
		               { "mData": "operResult" },
		               { "mData": "ip" },
		               { "mData": "createTime" ,
		            	   "mRender": Common.formatDateTime
		               },
		               { "mData": "id",
		            	 'bSortable': false,
		            	 "sWidth": "20px",
		            	 "mRender": function ( data, type, full ) {
		            		 	 
	                              return '<a href="'+_GLOBAL.ctx+'/system/sysOperLog/view?id='+data+'" class="btn  btn-xs blue dblclick" data-handler="MODAL"><i class="fa fa-info-circle"></i></a>';
	               	            }
		               }
		             ]
		           
	 });
	 
	

});


</script>