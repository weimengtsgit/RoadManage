<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
	<div class="row">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet box grey">
						<div class="portlet-title">
							<div class="caption"><i class="fa fa-table"></i>页面展示记录</div>
							
							
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
									<tag:enum name="filter_EQT_accessType"  attrs="placeholder='终端软件'" cssClass="form-control form-control-inline input-medium select2me"  enumName="com_statShow_accessType" tagType="edit" />
								</div>
								
						</form>
						<table class="table table-condensed table-bordered table-hover" id="data-table-customer-statShow-1">
								
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
	 
	_GLOBAL.pushEnum('com_statShow_accessType',<tag:enum  enumName="com_statShow_accessType" tagType="json" />);
	_GLOBAL.pushEnum('com_statShow_resourceId',<tag:enum  enumName="com_statShow_resourceId" tagType="json" />);
	 TableAjax.init('data-table-customer-statShow-1',{
		 "sAjaxSource": _GLOBAL.ctx+"/customer/statShow/listJSON",
		 "aaSorting": [
						[5, "desc" ]
						],
		 "aoColumns": [
		               {   sTitle:"终端MAC",
		            	   mData: "termMac",
		            	   mRender:function(data){
		            		  return '<a class="btn  blue-stripe btn-xs" href="'+_GLOBAL.ctx+'/customer/terminal/view?termMac='+data+'"  data-handler="MODAL" data-title="终端信息">'+data+'</a>'
		            	  }
		               },
		               { sTitle:"终端IP",mData: "termIp" },
		               { sTitle:"终端软件",mData: "accessType",
		            	   mRender:function(data){
		            		   return _GLOBAL.getEnum('com_statShow_accessType',data);
		            	   }   
		               },
		               { sTitle:"AP设备MAC",mData: "apMac" },
// 		               { sTitle:"USER-AGENT",mData: "userAgent" },
		               { sTitle:"页面",mData: "resourceId",
		            	   
		            	   mRender:function(data){
		            		   return _GLOBAL.getEnum('com_statShow_resourceId',data);
		            	   }   
		               },
		               { sTitle:"时间",mData: "statTime" ,sWidth:'140px',"mRender": Common.formatDateTime},
		               { sTitle:"操作",
		            	  "mData": "id",
		            	 'bSortable': false,
		            	 "mRender": function ( data, type, full ) {
	                              return '<a href="'+_GLOBAL.ctx+'/customer/statShow/view?id='+data+'" class="btn  btn-xs blue dblclick" data-handler="MODAL" modal-size=600><i class="fa fa-info-circle"></i></a>';
	               	            }
			           }
		             ]
		           
	 });
	 
	

});


</script>