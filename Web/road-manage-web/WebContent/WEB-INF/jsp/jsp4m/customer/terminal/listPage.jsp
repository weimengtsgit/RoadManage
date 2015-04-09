<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
	<div class="row">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet box grey">
						<div class="portlet-title">
							<div class="caption"><i class="fa fa-table"></i>终端列表</div>
							
							
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
									<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_mac"  placeholder="终端mac">
								</div>
								
						</form>
						<table class="table table-condensed table-bordered table-hover" id="data-table-terminal-1">
								<thead>
									<tr>
										<th>终端MAC</th>
										<th>终端类型</th>
										<th>最近使用时间</th>
										<th>访问次数</th>
										<th>在线状态</th>
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
	 
	_GLOBAL.pushEnum('com_terminal_type',<tag:enum  enumName="com_terminal_type" tagType="json" />);
	_GLOBAL.pushEnum('com_terminal_status',<tag:enum  enumName="com_terminal_status" tagType="json" />);
	_GLOBAL.pushEnum('com_terminal_online',<tag:enum  enumName="com_terminal_online" tagType="json" />);

	TableAjax.init('data-table-terminal-1',{
		 "sAjaxSource": _GLOBAL.ctx+"/customer/terminal/listJSON",
		 "aaSorting": [[2, "desc" ]],
		 "aoColumns": [
		              
		               { "mData": "mac" },
		               { "mData": "type" ,"sWidth": "100px",
		            	   mRender:function(data){
		            		   return _GLOBAL.getEnum('com_terminal_type',data);
		            	   }
		               },
		               { "mData": "lastAccessTime" , "sWidth": "150px",
		            	   "mRender": Common.formatDateTime
		               },
		               { "mData": "accessPortalTimes", "sWidth": "100px"},
		               { "mData": "online" ,
		            	   "sWidth": "20px",
		            	   mRender:function(data){
		            		   return _GLOBAL.getEnum('com_terminal_online',data);
		            	   }
		               },
		               { "mData": "id",
		            	 'bSortable': false,
		            	 "sWidth": "20px",
		            	 "mRender": function ( data, type, full ) {
		            		 	 
	                              return '<a href="'+_GLOBAL.ctx+'/customer/terminal/view?id='+data+'" class="btn  btn-xs blue dblclick" data-handler="MODAL"><i class="fa fa-info-circle"></i></a>';
// 	                                     '<a href="'+_GLOBAL.ctx+'/customer/terminal/delete?id='+data+'" class="btn  btn-xs red" data-handler="CONFIRM"><i class="fa fa-trash-o"></i> </a> ';
	               	            }
		               }
		             ]
		           
	 });
	 
	

});


</script>