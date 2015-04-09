<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/mall/shopClass/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_MALL_SHOPCLASS_" ></c:set>
<c:set scope="page" var="dataTitle" value="商铺类别" ></c:set>
<c:set scope="page" var="tableId" value="data-table-mall-shopClass-1" ></c:set>
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
						<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
								
								<a href="#" class="btn search default pull-right " ><i class="fa fa-search"></i></a>
								<div class="form-group pull-right">
									<tag:enum name="filter_EQI_level"  attrs="placeholder='分类级别'" cssClass="form-control form-control-inline input-small select2me"  enumName="shopClass_level" tagType="edit" />
								</div>
							
									
								<div class="form-group pull-right">
									<input placeholder='父类别'  class="form-control form-control-inline input-small  select2 " name="filter_EQI_parentType.id" type="hidden"  result-field="name"   lookup-url="${ctx}/mall/shopClass/listJSON?filter_EQI_level=1" filter="filter_LIKES_name" />
								</div>
							
	
								<div class="form-group pull-right">
									<input type="text" class="form-control form-control-inline input-small " name="filter_LIKES_name"  placeholder="类别名称">
								</div>
							
	
								<div class="form-group pull-right">
									<input type="text" class="form-control form-control-inline input-small " name="filter_LIKES_des"  placeholder="类别描述">
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
			{sTitle:'分类级别',mData: "level" ,uxEnum:'shopClass_level'},
			{sTitle:'父类别',
			  mData: "parentType" ,
		 	  mRender:function(data){
		 		  if(data && data.id){
		 		  	  return '<a class="btn  blue-stripe btn-xs" href="${ctx}/mall/shopClass/view?id='+data.id+'"  data-handler="MODAL" data-title="父类别">'+data.name+'</a>'
		 		  }else{
		 			  return data;
		 		  }
		 	  }
		    },		
			{sTitle:'类别名称',  mData: "name",uxLongText:true},				
			{sTitle:'类别描述',  mData: "des",uxLongText:true},				
			{sTitle:'排序',  mData: "sort",uxLongText:true},		        
          {uxCogs:[
	          {name:"查看"}
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
