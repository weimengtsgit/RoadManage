<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/system/sysEnum/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SYSTEM_SYSENUM_" ></c:set>
<c:set scope="page" var="dataTitle" value="枚举实体" ></c:set>
<c:set scope="page" var="tableId" value="data-table-system-sysEnum-1" ></c:set>
<div class="note note-info">
							<h4 class="block">使用说明</h4>
							<p>
								java 获取参数值：SessionUtil.getEnumValue("enumType", "key");
								
							</p>
		</div>
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
									<a href="${urlPrev }new" class="btn btn-sm blue "  data-handler="INLINE" data-title="${dataTitle }" data-form=true>
										<i class="fa fa-pencil"></i> 新增
									</a>
<%-- 								</sec:authorize> --%>
<%-- 								<sec:authorize ifAllGranted="${rolePrev }DELETE"> --%>
									<a href="${urlPrev }delete" class="btn btn-sm red "  data-handler="CONFIRM" data-set="#${tableId } .checkboxes">
										<i class="fa fa-trash-o"></i> 删除
									</a>
<%-- 								</sec:authorize> --%>
							</div>
						</div>
						<div class="portlet-body">
						<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
								
								<a href="#" class="btn search default pull-right " ><i class="fa fa-search"></i></a>
								<div class="form-group pull-right">
									<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_enumName"  placeholder="枚举标识">
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
			{sTitle:'枚举标识',  mData: "enumName",uxLongText:true},				
			{sTitle:'枚举名称',  mData: "enumDesc",uxLongText:true},		        
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
