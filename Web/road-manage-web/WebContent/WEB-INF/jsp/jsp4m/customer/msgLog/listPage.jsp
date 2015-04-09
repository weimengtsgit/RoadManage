<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/customer/msgLog/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_CUSTOMER_MSGLOG_" ></c:set>
<c:set scope="page" var="dataTitle" value="短信发送记录" ></c:set>
<c:set scope="page" var="tableId" value="data-table-customer-msgLog-1" ></c:set>
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
								<div class="form-group pull-right">
									<tag:enum name="filter_EQT_sender"  attrs="placeholder='发送者'" cssClass="form-control form-control-inline input-small select2me"  enumName="customer_Message_sender" tagType="edit" />
								</div>
							
	
								<div class="form-group pull-right">
									<tag:enum name="filter_EQT_type"  attrs="placeholder='消息业务类型'" cssClass="form-control form-control-inline input-small select2me"  enumName="customer_Message_type" tagType="edit" />
								</div>
							
			
			
									
								<div class="form-group pull-right">
									<input placeholder='客户'  class="form-control form-control-inline input-small  select2 " name="filter_EQI_customer.id" type="hidden"  result-field="mobile"   lookup-url="${ctx }/customer/customer/listJSON" filter="filter_LIKES_mobile" />
								</div>
							
									
								<div class="form-group pull-right">
									<input placeholder='操作用户'  class="form-control form-control-inline input-small  select2 " name="filter_EQI_user.id" type="hidden"  result-field="username"   lookup-url="${ctx }/system/sysUser/listJSON" filter="filter_LIKES_username" />
								</div>
							
	
								<div class="form-group pull-right">
									<input type="text" class="form-control form-control-inline input-small " name="filter_LIKES_mobile"  placeholder="手机号">
								</div>
							
	
								<div class="form-group pull-right">
									<input type="text" class="form-control form-control-inline input-small " name="filter_LIKES_msgContent"  placeholder="短信内容">
								</div>
							
	

							
	
<!-- 								<div class="form-group pull-right"> -->
<%-- 									<tag:enum name="filter_EQT_status"  attrs="placeholder='发送状态'" cssClass="form-control form-control-inline input-small select2me"  enumName="successful" tagType="edit" /> --%>
<!-- 								</div> -->
							
	
<!-- 								<div class="form-group pull-right"> -->
<!-- 									<input type="text" class="form-control form-control-inline input-small " name="filter_LIKES_result"  placeholder="发送结果代码"> -->
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
			{sTitle:'发送者',mData: "sender" ,uxEnum:'customer_Message_sender'},
			{sTitle:'消息业务类型',mData: "type" ,uxEnum:'customer_Message_type'},		
// 			{sTitle:'null',  mData: "shopId",uxLongText:true},				
// 			{sTitle:'null',  mData: "mallId",uxLongText:true},		
			{sTitle:'客户',
			  mData: "customer" ,
		 	  mRender:function(data){
		 		  if(data && data.id){
		 		  	  return '<a class="btn  blue-stripe btn-xs" href="${ctx}/view?id='+data.id+'"  data-handler="MODAL" data-title="客户">'+data.mobile+'</a>'
		 		  }else{
		 			  return data;
		 		  }
		 	  }
		    },
// 			{sTitle:'操作用户',
// 			  mData: "user" ,
// 		 	  mRender:function(data){
// 		 		  if(data && data.id){
// 		 		  	  return '<a class="btn  blue-stripe btn-xs" href="${ctx}/system/sysUser/view?id='+data.id+'"  data-handler="MODAL" data-title="操作用户">'+data.username+'</a>'
// 		 		  }else{
// 		 			  return data;
// 		 		  }
// 		 	  }
// 		    },		
			{sTitle:'手机号',  mData: "mobile",uxLongText:true},				
			{sTitle:'短信内容',  mData: "msgContent",uxLongText:true},		
			{sTitle:'发送时间',  mData: "sendTime" , mRender: Common.formatDate},			
			{sTitle:'发送状态',mData: "status" ,uxEnum:'successful'},		
// 			{sTitle:'发送结果代码',  mData: "result",uxLongText:true},		        
          {uxCogs:[
	          {name:"查看"}
// 	          <sec:authorize ifAllGranted="${rolePrev }EDIT">
// 	          ,{name:"修改"}
// 	          </sec:authorize>
// 	          <sec:authorize ifAllGranted="${rolePrev }DELETE"> 
// 	          ,{name:"删除"}
// 	          </sec:authorize>
          ]}
        ]
	           
 });
});
</script>
