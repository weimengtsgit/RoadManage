<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
	<div class="row">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet box grey">
						<div class="portlet-title">
							<div class="caption"><i class="fa fa-table"></i>用户列表</div>
							
							
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
									<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_mobile"  placeholder="手机号">
								</div>
								
						</form>
						<table class="table table-condensed table-bordered table-hover" id="data-table-customer-customer-1">
								
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
	 
	_GLOBAL.pushEnum('sex',<tag:enum  enumName="sex" tagType="json" />);
	 TableAjax.init('data-table-customer-customer-1',{
		 "sAjaxSource": _GLOBAL.ctx+"/customer/customer/listJSON",
		 "aaSorting": [
						[5, "desc" ]
						],
		 "aoColumns": [
		               { sTitle:"手机号",mData: "mobile"
		            	      
		               },
		               { sTitle:"微信号",mData: "weixin"    
		               },
		               { sTitle:"QQ号",mData: "qq"
		               },
		               { sTitle:"年龄",mData: "age" 
		               },
		               { sTitle:"性别",mData: "sex",
		            	   mRender:function(data){
		            		   return _GLOBAL.getEnum('sex',data);
		            	   }
		               },
		               { sTitle:"注册时间",mData: "createTime" ,"mRender": Common.formatDate},
		               { "mData": "id",
			            	 'bSortable': false,
			            	 "mRender": function ( data, type, full ) {
		                              return '<a href="'+_GLOBAL.ctx+'/customer/customer/view?id='+data+'" class="btn  btn-xs blue dblclick" data-handler="MODAL"><i class="fa fa-info-circle"></i></a>';
		               	            }
			            }
		             ]
		           
	 });
	 
	

});


</script>