<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/customer/mscoreLog/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_CUSTOMER_MSCORELOG_" ></c:set>
<c:set scope="page" var="dataTitle" value="会员积分日志" ></c:set>
<c:set scope="page" var="tableId" value="data-table-customer-mscoreLog-1" ></c:set>
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
									<input placeholder='会员'  class="form-control form-control-inline input-medium  select2 " name="filter_EQI_mcard.id" type="hidden"  result-field="cardId"   lookup-url="${ctx }/customer/mcard/listJSON" filter="filter_LIKES_cardId" />
								</div>
							
	
								<div class="form-group pull-right">
									<tag:enum name="filter_EQT_type"  attrs="placeholder='交易类型'" cssClass="form-control form-control-inline input-medium select2me"  enumName="com_MscoreLog_type" tagType="edit" />
								</div>
							
			
			
	

							
	
								<div class="form-group pull-right">
									<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_action"  placeholder="交易说明">
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
			{sTitle:'会员',
			  mData: "mcard" ,
		 	  mRender:function(data){
		 		  return '<a class="btn  blue-stripe btn-xs" href="${ctx}/customer/mcard/view?id='+data.id+'"  data-handler="MODAL" data-title="会员">'+data.cardId+'</a>'
		 	  }
		    },
			{sTitle:'交易类型',mData: "type" ,uxEnum:'com_MscoreLog_type'},		
			{sTitle:'交易积分',  mData: "score",uxLongText:true},				
			{sTitle:'剩余积分',  mData: "totalScore",uxLongText:true},		
			{sTitle:'交易时间',  mData: "time" , mRender: Common.formatDate},					
			{sTitle:'交易说明',  mData: "action",uxLongText:true},		        
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
