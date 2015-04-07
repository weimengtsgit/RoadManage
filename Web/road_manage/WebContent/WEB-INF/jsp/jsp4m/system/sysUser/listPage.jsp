<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="urlPrev" value="${ctx }/system/sysUser/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SYSTEM_SYSUSER_" ></c:set>
<c:set scope="page" var="dataTitle" value="用户信息" ></c:set>
<c:set scope="page" var="tableId" value="data-table-system-sysUser-1" ></c:set>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
	<div class="row">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet box grey">
						<div class="portlet-title">
							<div class="caption"><i class="fa fa-list"></i>数据列表</div>
							
							
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
									<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_username"  placeholder="账号">
								</div>
								<div class="form-group pull-right">
									<tag:enum name="filter_EQS_userType"  attrs="placeholder='用户类型'" cssClass="form-control form-control-inline input-medium select2me"  enumName="userType" tagType="edit" />
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
		 TableAjax.init('${tableId}',{
			 sAjaxSource: "${urlPrev }listJSON",
		 	 aaSorting: [[1, "desc" ]], // 需要自定义
			 uxUrlPrev:"${urlPrev }",
			 uxDataTitle:"${dataTitle }",
			 uxCheckable:true,
			 uxCloseScroll:true,
			 uxDrapable:false,
		 	 aoColumns: [
		              
		               {sTitle:'用户名', "mData": "username" },
		               {sTitle:'昵称', "mData": "name" },
		               {sTitle:'用户类型',  "mData": "userType" ,uxEnum:'userType'},
		               { sTitle:'所属商场',
		            	   "mData": "mall.name",
		            	   "sDefaultContent": "无" 
		            	},
		               { sTitle:'所属商铺',
		            	   "mData": "shop.name",
		            	   "sDefaultContent": "无" 
		            	},
		               { sTitle:'所属角色',
		            	   "mData": "userRole.roleName",
		            	   "sDefaultContent": "无" 	
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