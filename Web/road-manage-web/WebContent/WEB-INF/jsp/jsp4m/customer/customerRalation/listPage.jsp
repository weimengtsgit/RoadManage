<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
	<div class="row">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet box grey">
						<div class="portlet-title">
							<div class="caption"><i class="fa fa-table"></i>数据列表</div>
							
							
							<div class="tools">
								<a href="javascript:;" class="collapse"></a>
								<a href="javascript:;" class="reload"></a>
							</div>
							
							<div class="actions">
<!-- 								<a href="###" class="btn btn-sm blue "  data-handler="MESSAGE"   data-title="IGOOOO" data-content="请联系管理员开通。"> -->
<!-- 									发送短信<i class="fa fa-comments"></i>  -->
<!-- 								</a> -->
								<a href="${ctx}/customer/msgLog/toSendMsg" class="btn btn-sm blue "  data-handler="MODAL"   data-title="发送短信" data-set="#data-table-customer-customer-ralation-1 .checkboxes">
									<i class="fa fa-comments"></i> 发送信息
								</a>
							</div>
						</div>
						<div class="portlet-body">
						
						
						<form class="form-inline" role="form" onsubmit="return false;">
								
								
								
								<a href="#" class="btn search default pull-right " ><i class="fa fa-search"></i></a>
								<div class="form-group pull-right">
									<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_customer.mobile"  placeholder="手机号">
								</div>
								
						</form>
						<table class="table table-condensed table-bordered table-hover" id="data-table-customer-customer-ralation-1">
								
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
	 TableAjax.init('data-table-customer-customer-ralation-1',{
		 "sAjaxSource": _GLOBAL.ctx+"/customer/customerRalation/listJSON",
		 "aaSorting": [[4, "desc" ]],
		 uxCheckable:true,
		 "aoColumns": [
		               { sTitle:"手机号",mData: "customer.mobile" ,sDefaultContent:"无"},
		               { sTitle:"终端MAC",mData: "terminal.mac" },
		               {
		            	   sTitle:'所属商铺',
		            	   "mData": "shop" ,
			            	  mRender:function(data){
			            		  return '<a class="btn  blue-stripe btn-xs" href="'+_GLOBAL.ctx+'/mall/shop/view?id='+data.id+'"  data-handler="MODAL" data-title="商铺信息">'+data.name+'</a>'
			            	  }
			               },
		               { sTitle:"创建时间",mData: "createTime" ,"mRender": Common.formatDate},
		               { sTitle:" ","mData": "id",
		            	 'bSortable': false,
		            	 "mRender": function ( data, type, full ) {
	                              return '<a href="'+_GLOBAL.ctx+'/customer/customerRalation/view?id='+data+'" class="btn  btn-xs blue dblclick" data-handler="MODAL" modal-size=500><i class="fa fa-info-circle"></i></a>';
	               	            }
			           }
		             ]
		           
	 });
});


</script>