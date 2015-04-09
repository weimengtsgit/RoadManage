<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/customer/memberPromotion/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_CUSTOMER_MEMBERPROMOTION_" ></c:set>
<c:set scope="page" var="dataTitle" value="会员优惠" ></c:set>
<c:set scope="page" var="tableId" value="data-table-customer-memberPromotion-1" ></c:set>
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
								<sec:authorize ifAllGranted="${rolePrev }EDIT">
									<a href="${urlPrev}applyAll" class="btn btn-sm blue "  data-handler="CONFIRM" data-title="确定要使用这些优惠券吗？该操作不能回退！" data-set="#${tableId } .checkboxes">
										<i class="fa fa-check"></i> 使用优惠券
									</a>
								</sec:authorize>
							</div>
						</div>
						<div class="portlet-body">
						
						
						<form id="${tableId }_form" class="form-inline" role="form" onsubmit="return false;">
								
								<a href="#" class="btn search default pull-right " ><i class="fa fa-search"></i></a>
								<div class="form-group pull-right">
									<input placeholder='手机号'  class="form-control form-control-inline input-medium  select2 " name="filter_EQI_customer.id" type="hidden" display-value="${customer.mobile}" result-field="mobile"   lookup-url="${ctx }/customer/customer/listJSON" filter="filter_LIKES_mobile" />
								</div>
								<div class="form-group pull-right">
									<tag:enum name="filter_EQT_status"  attrs="placeholder='优惠券状态'" cssClass="form-control form-control-inline input-medium select2me"  enumName="MemberPromotion_status" tagType="edit" />
								</div>
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
	 Select2Ex.handleForm4select2({target:$("#${tableId }_form")});
 
 TableAjax.init('${tableId}',{
	 sAjaxSource: "${urlPrev }listJSON",
	 aaSorting: [[0, "asc" ]], // 需要自定义
	 uxUrlPrev:"${urlPrev }",
	 uxDataTitle:"${dataTitle }",
	 uxCheckable: true,
	 uxCloseScroll:true,
	 uxDrapable: false,
	 aoColumns: [
          {sTitle:'会员',
       	      mData: "customer" ,
           	  mRender:function(data){
           		  return '<a class="btn  blue-stripe btn-xs" href="'+_GLOBAL.ctx+'/customer/customer/view?id='+data.id+'"  data-handler="MODAL" data-title="会员信息">'+data.mobile+'</a>'
           	  }
           },
          {sTitle:'优惠信息',
       	      mData: "shopPromotion" ,
           	  mRender:function(data){
           		  return '<a class="btn  blue-stripe btn-xs" href="'+_GLOBAL.ctx+'/mall/shopPromotion/view?id='+data.id+'"  data-handler="MODAL" data-title="商铺优惠信息">'+data.intro+'</a>'
           	  }
           },
          {sTitle:'验证码',mData: "validation" },
          {sTitle:'状态',mData: "status" ,uxEnum:'MemberPromotion_status'},
          {uxCogs:[
	          {name:"查看", modalSize:'500px'}
	          <sec:authorize ifAllGranted="${rolePrev }EDIT">
	          ,{
	        	  name:"使用优惠券",
	        	  uri:"apply",
	        	  dataTitle:'确定要使用该优惠券吗？',
	        	  dataHandler:"CONFIRM",
	        	  iclass:'fa fa-check primary',
	        	  isShow:function(data,type,full){
	        		  if(full.status==0){
	        			  return true;
	        		  }else{
	        			  return false;
	        		  }
	        	  }
	           }
			  </sec:authorize>
          ]}
        ]
	           
 });
 

});
</script>