<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/queue/queueCard/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_QUEUE_QUEUECARD_" ></c:set>
<c:set scope="page" var="dataTitle" value="排号卡" ></c:set>
<c:set scope="page" var="tableId" value="data-table-queue-queueCard-1" ></c:set>

						<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
								
<!-- 								<a href="#" class="btn search default pull-right " ><i class="fa fa-search"></i></a>								 -->
<!-- 								<div class="form-group pull-right"> -->
<%-- 									<input placeholder='所属商铺'  class="form-control form-control-inline input-small  select2 " name="filter_EQI_shop.id" type="hidden"  result-field="name"   lookup-url="${ctx }/listJSON" filter="filter_LIKES_name" /> --%>
<!-- 								</div> -->
							
			
	
<!-- 								<div class="form-group pull-right"> -->
<%-- 									<tag:enum name="filter_EQI_cardType"  attrs="placeholder='卡类型'" cssClass="form-control form-control-inline input-small select2me"  enumName="queue_card_type" tagType="edit" /> --%>
<!-- 								</div> -->
							
									
<!-- 								<div class="form-group pull-right"> -->
<%-- 									<input placeholder='顾客'  class="form-control form-control-inline input-small  select2 " name="filter_EQI_customer.id" type="hidden"  result-field="mobile"   lookup-url="${ctx }/customer/customer/listJSON" filter="filter_LIKES_mobile" /> --%>
<!-- 								</div> -->
							
	
<!-- 								<div class="form-group pull-right"> -->
<!-- 									<input type="text" class="form-control form-control-inline input-small " name="filter_LIKES_name"  placeholder="姓名"> -->
<!-- 								</div> -->
							
	
<!-- 								<div class="form-group pull-right"> -->
<!-- 									<input type="text" class="form-control form-control-inline input-small " name="filter_LIKES_phone"  placeholder="电话"> -->
<!-- 								</div> -->
							
	

							
	

							
	
<!-- 								<div class="form-group pull-right"> -->
<%-- 									<tag:enum name="filter_EQT_status"  attrs="placeholder='状态'" cssClass="form-control form-control-inline input-small select2me"  enumName="QueueCard_status" tagType="edit" /> --%>
<!-- 								</div> -->
							
			
	 					<input  type="hidden" name="filter_EQI_shop.id" value='${s}' />
	 					<input  type="hidden" name="filter_EQI_cardType" value='${t}' />
	 					<input  type="hidden" name="filter_EQT_status" value='0' />
						</form>
						<table class="table table-condensed table-bordered table-hover " id="${tableId }">
						</table>
						
<script>
$(document).ready(function() {
	//look-up 查询条件 会员 
	Select2Ex.handleForm4select2({target:$("#form_${tableId }")});	

 TableAjax.init('${tableId}',{
	 sAjaxSource: "${urlPrev }listJSON",
	 aaSorting: [[0, "asc" ]], // 需要自定义
	 uxUrlPrev:"${urlPrev }",
	 uxDataTitle:"${dataTitle }",
	 uxCheckable:false,
	 iDisplayLength: 100,
	 uxCloseScroll:true,
	 uxDrapable:false,
	 aoColumns: [
// 			{sTitle:'所属商铺',
// 			  mData: "shop" ,
// 		 	  mRender:function(data){
// 		 		  if(data && data.id){
// 		 		  	  return '<a class="btn  blue-stripe btn-xs" href="${ctx}/view?id='+data.id+'"  data-handler="MODAL" data-title="所属商铺">'+data.name+'</a>'
// 		 		  }else{
// 		 			  return data;
// 		 		  }
// 		 	  }
// 		    },		
			{sTitle:'排号',  mData: "cardNo",uxLongText:true},		
// 			{sTitle:'卡类型',mData: "cardType" ,uxEnum:'queue_card_type'},
// 			{sTitle:'顾客',
// 			  mData: "customer" ,
// 		 	  mRender:function(data){
// 		 		  if(data && data.id){
// 		 		  	  return '<a class="btn  blue-stripe btn-xs" href="${ctx}/customer/customer/view?id='+data.id+'"  data-handler="MODAL" data-title="顾客">'+data.mobile+'</a>'
// 		 		  }else{
// 		 			  return data;
// 		 		  }
// 		 	  }
// 		    },		
			{sTitle:'称呼',  mData: "name",uxLongText:true},				
// 			{sTitle:'电话',  mData: "phone",uxLongText:true},		
// 			{sTitle:'开始排号时间',  mData: "startTime" , mRender: Common.formatDate},			
// 			{sTitle:'结束排号时间',  mData: "endTime" , mRender: Common.formatDate},			
// 			{sTitle:'状态',mData: "status" ,uxEnum:'QueueCard_status'},		
// 			{sTitle:'提醒次数',  mData: "callTimes",uxLongText:true},		        
//           {uxCogs:[
// 	          {name:"查看"}
// 	          <sec:authorize ifAllGranted="${rolePrev }EDIT">
// 	          ,{name:"修改"}
// 	          </sec:authorize>
// 	          <sec:authorize ifAllGranted="${rolePrev }DELETE"> 
// 	          ,{name:"删除"}
// 	          </sec:authorize>
//           ]}
			{ "mData": "phone",sTitle:'电话',
			   'bSortable': false,
			    "mRender": function ( data, type, full ) {
		          return '<a href="${ctx }/customer/message/toSendMsg?customerId='+full.customer.id+'&phone='+data+'" class="btn  btn-xs blue " data-handler="MODAL" data-title="发送信息"><i class="fa fa-mobile"></i> '+data+' <i class="m-icon-swapright m-icon-white"></i></a>';
		         }
		    }
        ]
	           
 });
});
</script>
