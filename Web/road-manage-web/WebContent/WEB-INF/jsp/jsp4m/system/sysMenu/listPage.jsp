<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/system/sysMenu/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SYSTEM_SYSMENU_" ></c:set>
<c:set scope="page" var="dataTitle" value="菜单" ></c:set>
<c:set scope="page" var="tableId" value="data-table-system-sysMenu-1" ></c:set>
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
									<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_menuDesc"  placeholder="菜单名称">
								</div>
							
	
								<div class="form-group pull-right">
									<tag:enum name="filter_EQS_menuType"  attrs="placeholder='菜单类型'" cssClass="form-control form-control-inline input-small select2me"  enumName="menuType" tagType="edit" />
								</div>
							
	
								<div class="form-group pull-right">
									<tag:enum name="filter_EQS_enabled"  attrs="placeholder='是否可用'" cssClass="form-control form-control-inline input-small select2me"  enumName="isOrNot" tagType="edit" />
								</div>
							
	
								<div class="form-group pull-right">
									<tag:enum name="filter_EQS_visible"  attrs="placeholder='是否可见'" cssClass="form-control form-control-inline input-small select2me"  enumName="isOrNot" tagType="edit" />
								</div>
							
	
								<div class="form-group pull-right">
									<tag:enum name="filter_EQI_external"  attrs="placeholder='是否IFRAME'" cssClass="form-control form-control-inline input-small select2me"  enumName="isOrNot" tagType="edit" />
								</div>
							
	
<!-- 								<div class="form-group pull-right"> -->
<%-- 									<tag:enum name="filter_EQS_target"  attrs="placeholder='打开目标'" cssClass="form-control form-control-inline input-small select2me"  enumName="target" tagType="edit" /> --%>
<!-- 								</div> -->
							
	
<!-- 								<div class="form-group pull-right"> -->
<!-- 									<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_icon"  placeholder="图标"> -->
<!-- 								</div> -->
							
	
<!-- 								<div class="form-group pull-right"> -->
<!-- 									<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_summary"  placeholder="简介"> -->
<!-- 								</div> -->
							
									
<!-- 								<div class="form-group pull-right"> -->
<%-- 									<input placeholder='上级菜单'  class="form-control form-control-inline input-medium  select2 " name="filter_EQI_parentId.id" type="hidden"  result-field="menuDesc"   lookup-url="${ctx }/system/sysMenu/listJSON" filter="filter_LIKES_menuDesc" /> --%>
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
			{sTitle:'菜单名称',  mData: "menuDesc",mRender:function(data,type,full){
				var icon = full.icon;
				if(!icon){
					icon='fa fa-question';
				}
				return "<i class='"+icon+"'></i> "+data;
			}},				
			{sTitle:'菜单类型',mData: "menuType" ,uxEnum:'menuType'},		
// 			{sTitle:'菜单URL',  mData: "menuName",uxLongText:true},				
// 			{sTitle:'菜单序列',  mData: "menuSeq"},				
// 			{sTitle:'权限名称',  mData: "authorityName",uxLongText:true},		
			{sTitle:'是否可用',mData: "enabled" ,uxEnum:'isOrNot',uxFastSet:true},
			{sTitle:'是否可见',mData: "visible" ,uxEnum:'isOrNot',uxFastSet:true},
			{sTitle:'是否IFRAME',mData: "external" ,uxEnum:'isOrNot'},
// 			{sTitle:'打开目标',mData: "target" ,uxEnum:'target'},		
// 			{sTitle:'简介',  mData: "summary",uxLongText:true},		
			{sTitle:'上级菜单',
			  mData: "parentId" ,
		 	  mRender:function(data){
		 		  if(data && data.id){
		 		  	  return '<a class="btn  blue-stripe btn-xs" href="${ctx}/system/sysMenu/view?id='+data.id+'"  data-handler="MODAL" data-title="上级菜单">'+data.menuDesc+'</a>'
		 		  }else{
		 			  return data;
		 		  }
		 	  }
		    },        
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
