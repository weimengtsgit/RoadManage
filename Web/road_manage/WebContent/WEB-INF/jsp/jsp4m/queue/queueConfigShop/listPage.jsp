<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/queue/queueConfigShop/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_QUEUE_QUEUECONFIGSHOP_" ></c:set>
<c:set scope="page" var="dataTitle" value="商铺排队设置" ></c:set>
<c:set scope="page" var="tableId" value="data-table-queue-queueConfigShop-1" ></c:set>
<div class="row">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet box grey">
						<div class="portlet-title">
							<div class="caption"><i class="fa fa-table"></i>${dataTitle }列表</div>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a>
								<a href="javascript:;" class="reload"></a>
							</div>
							
							<div class="actions">
<%-- 								<sec:authorize ifAllGranted="${rolePrev }NEW"> --%>
<%-- 									<a href="${urlPrev }new" class="btn btn-sm blue "  data-handler="INLINE" data-title="${dataTitle }" data-form=true> --%>
<!-- 										<i class="fa fa-pencil"></i> 新增 -->
<!-- 									</a> -->
<%-- 								</sec:authorize> --%>
<%-- 								<sec:authorize ifAllGranted="${rolePrev }DELETE"> --%>
<%-- 									<a href="${urlPrev }delete" class="btn btn-sm red "  data-handler="CONFIRM" data-set="#${tableId } .checkboxes"> --%>
<!-- 										<i class="fa fa-trash-o"></i> 删除 -->
<!-- 									</a> -->
<%-- 								</sec:authorize> --%>
							</div>
						</div>
						<div class="portlet-body">
						<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
								
								<a href="#" class="btn search default pull-right " ><i class="fa fa-search"></i></a>								
<!-- 								<div class="form-group pull-right"> -->
<%-- 									<input placeholder='所属商场'  class="form-control form-control-inline input-medium  select2 " name="filter_EQI_mall.id" type="hidden"  result-field="name"   lookup-url="${ctx }/mall/mall/listJSON" filter="filter_LIKES_name" /> --%>
<!-- 								</div> -->
							
									
								<div class="form-group pull-right">
									<input placeholder='商铺'  class="form-control form-control-inline input-medium  select2 " name="filter_EQI_shop.id" type="hidden"  result-field="name"   lookup-url="${ctx }/mall/shop/listJSON" filter="filter_LIKES_name" />
								</div>
							
			
			
	
<!-- 								<div class="form-group pull-right"> -->
<%-- 									<tag:enum name="filter_EQT_isCall"  attrs="placeholder='排位提醒开关 '" cssClass="form-control form-control-inline input-small select2me"  enumName="isOrNot" tagType="edit" /> --%>
<!-- 								</div> -->
							
	
<!-- 								<div class="form-group pull-right"> -->
<%-- 									<tag:enum name="filter_EQT_callType"  attrs="placeholder='提醒方式'" cssClass="form-control form-control-inline input-small select2me"  enumName="QueueConfigShop_callType" tagType="edit" /> --%>
<!-- 								</div> -->
							
	
<!-- 								<div class="form-group pull-right"> -->
<%-- 									<tag:enum name="filter_EQT_status"  attrs="placeholder='状态'" cssClass="form-control form-control-inline input-small select2me"  enumName="QueueConfigShop_status" tagType="edit" /> --%>
<!-- 								</div> -->
							
	 					
						</form>
						<table class="table table-condensed table-bordered table-hover " id="${tableId }">
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
	//look-up 查询条件 会员 
	Select2Ex.handleForm4select2({target:$("#form_${tableId }")});	

 TableAjax.init('${tableId}',{
	 sAjaxSource: "${urlPrev }listJSON",
	 aaSorting: [[1, "desc" ]], // 需要自定义
	 uxUrlPrev:"${urlPrev }",
	 uxDataTitle:"${dataTitle }",
	 uxCheckable:true,
	 uxCloseScroll:true,
	 uxDrapable:false,
	 aoColumns: [
// 			{sTitle:'商场',
// 			  mData: "mall" ,
// 		 	  mRender:function(data){
// 		 		  if(data && data.id){
// 		 		  	  return '<a class="btn  blue-stripe btn-xs" href="${ctx}/mall/mall/view?id='+data.id+'"  data-handler="MODAL" data-title="所属商场">'+data.name+'</a>'
// 		 		  }else{
// 		 			  return data;
// 		 		  }
// 		 	  }
// 		    },
			{sTitle:'商铺',
			  mData: "shop" ,
		 	  mRender:function(data){
		 		  if(data && data.id){
		 		  	  return '<a class="btn  blue-stripe btn-xs" href="${ctx}/mall/shop/view?id='+data.id+'"  data-handler="MODAL" data-title="商铺">'+data.name+'</a>'
		 		  }else{
		 			  return data;
		 		  }
		 	  }
		    },		
			{sTitle:'排队卡类型',  mData: "type",uxEnum:'queue_card_type'},				
			{sTitle:'排位间隔（分钟）',  mData: "interval"},		
			{sTitle:'排位提醒开关 ',mData: "isCall" ,uxEnum:'isOrNot',uxFastSet:true},
			{sTitle:'提醒方式',mData: "callType" ,uxEnum:'call_type',uxFastSet:true},
			{sTitle:'状态',mData: "status" ,uxEnum:'QueueConfigShop_status',uxFastSet:true},        
          {uxCogs:[
	          {name:"查看"}
	          <sec:authorize ifAllGranted="${rolePrev }EDIT">
	          ,{name:"修改"}
	          </sec:authorize>
// 	          <sec:authorize ifAllGranted="${rolePrev }DELETE"> 
// 	          ,{name:"删除"}
// 	          </sec:authorize>
          ]}
        ]
	           
 });
});
</script>
