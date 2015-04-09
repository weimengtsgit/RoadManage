<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
	<div class="row">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet box grey">
						<div class="portlet-title">
							<div class="caption"><i class="fa fa-list"></i>登录日志</div>
							
							
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
									<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_logIp"  placeholder="登录IP">
								</div>
								<div class="form-group pull-right">
									<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_logUser.name"  placeholder="用户">
								</div>
						</form>
						<table class="table table-condensed table-bordered table-hover" id="data-table-syslog-1">
								<thead>
									<tr>
										<th>用户</th>
										<th>登录IP</th>
										<th>登录类型</th>
										<th>登录结果</th>
										<th>登录时间</th>
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
	 
	_GLOBAL.pushEnum('logType',<tag:enum  enumName="logType" tagType="json" />);
	_GLOBAL.pushEnum('logResultType',<tag:enum  enumName="logResultType" tagType="json" />);
	
	 TableAjax.init('data-table-syslog-1',{
		 "sAjaxSource": _GLOBAL.ctx+"/system/sysLog/listJSON",
		 "aaSorting": [
				[4, "desc" ]
				],
		 "aoColumns": [
		              
		               { 
		            	   "mData": "logUser.name",
		            	   "sDefaultContent": ""    
		               },
		               { "mData": "logIp" },
		               { "mData": "logType"  ,
		            	   mRender:function(data){
		            		   return _GLOBAL.getEnum('logType',data);
		            	   }
		               },
		               { "mData": "logResultType"  ,
		            	   mRender:function(data){
		            		   return _GLOBAL.getEnum('logResultType',data);
		            	   }
		               },
		               { "mData": "logTime" ,
		            	   "mRender": Common.formatDateTime
		               },
		               { "mData": "id",
		            	 'bSortable': false,
		            	 "sWidth": "20px",
		            	 "mRender": function ( data, type, full ) {
		            		 	 
	                              return '<a href="'+_GLOBAL.ctx+'/system/sysLog/view?id='+data+'" class="btn  btn-xs blue dblclick" data-handler="MODAL" modal-size=500><i class="fa fa-info-circle"></i></a>';
	               	            }
		               }
		             ]
		           
	 });
	 
	

});


</script>