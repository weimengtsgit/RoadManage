<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/sysconf/sysConfIitem/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SYSCONF_SYSCONFIITEM_" ></c:set>
<c:set scope="page" var="dataTitle" value="配置项" ></c:set>
<c:set scope="page" var="tableId" value="data-table-sysconf-sysConfIitem-1" ></c:set>
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
									<a href="${urlPrev }new?pid=${pageData.filtraMap["EQI_confType.id"]}" class="btn btn-sm blue "  data-handler="INLINE" data-title="${dataTitle }" data-form=true>
										<i class="fa fa-pencil"></i> 新增
									</a>
<%-- 								</sec:authorize> --%>
<%-- 								<sec:authorize ifAllGranted="${rolePrev }DELETE"> --%>
									<a href="${urlPrev }delAll" class="btn btn-sm red "  data-handler="CONFIRM" data-set="#${tableId } .checkboxes">
										<i class="fa fa-trash-o"></i> 删除
									</a>
<%-- 								</sec:authorize> --%>
							</div>
						</div>
						<div class="portlet-body">
						<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
								
								<a href="#" class="btn search default pull-right " ><i class="fa fa-search"></i></a>								
								
							<input id="sysconf_confType_confName_list" type="hidden" name="filter_EQI_confType.id" value='${pageData.filtraMap["EQI_confType.id"]}' />
	 					
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
			
			{sTitle:'配置项名称',  mData: "itemName",uxLongText:true},				
			{sTitle:'配置项key',  mData: "itemKey",uxLongText:true},				
			{sTitle:'值类型',mData: "valueType" ,uxEnum:'sys_conf_value_type'},
			{sTitle:'值枚举类型',
			  mData: "enumType" ,
		 	  mRender:function(data){
		 		  if(data && data.id){
		 		  	  return '<a class="btn  blue-stripe btn-xs" href="${ctx}/system/sysEnum/view?id='+data.id+'"  data-handler="MODAL" data-title="值枚举类型">'+data.enumDesc+'</a>'
		 		  }else{
		 			  return data;
		 		  }
		 	  }
		    },		
			{sTitle:'配置项描述',  mData: "des",uxLongText:true},		        
          {uxCogs:[
                   {name:"查看"}
 		          <%-- 		          <sec:authorize ifAllGranted="${rolePrev }EDIT"> --%>
 		          ,{name:"修改"}
 		          <%-- 		 </sec:authorize> --%>
 		          <%--<sec:authorize ifAllGranted="${rolePrev }DELETE"> --%>
 		          ,{name:"删除"}
 		          <%--</sec:authorize>--%>
          ]}
        ]
	           
 });
});
</script>
