<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/mall/apDevice/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_MALL_APDEVICE_" ></c:set>
<c:set scope="page" var="dataTitle" value="商铺优惠信息" ></c:set>
<c:set scope="page" var="tableId" value="data-table-mall-apDevice-1" ></c:set>
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
								<sec:authorize ifAllGranted="${rolePrev }NEW">
									<a href="${urlPrev }new" class="btn btn-sm blue "  data-handler="INLINE" data-title="${dataTitle }" data-form=true>
										<i class="fa fa-pencil"></i> 新增
									</a>
								</sec:authorize>
								<sec:authorize ifAllGranted="${rolePrev }DELETE">
									<a href="${urlPrev }delete" class="btn btn-sm red "  data-handler="CONFIRM" data-set="#${tableId } .checkboxes">
										<i class="fa fa-trash-o"></i> 删除
									</a>
								</sec:authorize>
							</div>
						</div>
						<div class="portlet-body">
						
						
						<form class="form-inline" role="form" onsubmit="return false;">
								
								
								
								<a href="#" class="btn search default pull-right " ><i class="fa fa-search"></i></a>
								<div class="form-group pull-right">
									<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_mac"  placeholder="设备mac">
								</div>
								
						</form>
						<table class="table table-condensed table-bordered table-hover" id="${tableId }">
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
	 
	TableAjax.init('${tableId }',{
		 sAjaxSource: "${urlPrev }listJSON",
	 	 aaSorting: [[7, "desc" ]], // 需要自定义
		 uxUrlPrev:"${urlPrev }",
		 uxDataTitle:"${dataTitle }",
		 uxCheckable:true,
		 uxCloseScroll:true,
		 uxDrapable:false,
		 "aoColumns": [
		               {sTitle:'设备MAC', "mData": "mac" 
		               },
		               { sTitle:'所属商场',"mData": "mall" ,
		            	  mRender:function(data){
		            		  return '<a class="btn  blue-stripe btn-xs" href="'+_GLOBAL.ctx+'/mall/mall/view?id='+data.id+'"  data-handler="MODAL" data-title="商场信息">'+data.name+'</a>'
		            	  }
		               },
		               { sTitle:'位置',"mData": "location" 
		               },
		               { sTitle:'IP',"mData": "ip" 
		               },
		               { sTitle:'状态',"mData": "status" ,
		            	   mRender:function(data){
		            		   return _GLOBAL.getEnum('deviceStatus',data);
		            	   }
		               },
		               { sTitle:'出厂SN',"mData": "sn" 
		               },
		               { sTitle:'创建时间',"mData": "createTime" ,
		            	   "mRender": Common.formatDateTime
		               },
		               {uxCogs:[
			          	          {name:"查看",modalSize:'500px'}
			          	          <sec:authorize ifAllGranted="${rolePrev }EDIT">
			          	          ,{name:"修改"}
			          	          </sec:authorize>
			          	          <sec:authorize ifAllGranted="${rolePrev }DELETE"> 
			          	          ,{name:"删除"}
			          	          </sec:authorize>
			                    ]}
		             ]
		           
	 });
	 
	

});


</script>