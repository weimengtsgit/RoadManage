<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/mall/mallPromotion/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_MALL_MALLPROMOTION_" ></c:set>
<c:set scope="page" var="dataTitle" value="商场活动" ></c:set>
<c:set scope="page" var="tableId" value="data-table-mall-mallPromotion-1" ></c:set>
	<div class="row">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet box grey">
						<div class="portlet-title">
							<div class="caption"><i class="fa fa-list"></i>商场活动列表</div>
							
							
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
									<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_intro"  placeholder="活动简介">
								</div>
								<div class="form-group pull-right">
									<tag:enum name="filter_EQT_status"  attrs="placeholder='活动状态'" cssClass="form-control form-control-inline input-medium select2me"  enumName="promotionStatus" tagType="edit" />
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
	 
	 TableAjax.init('${tableId }',{
		 sAjaxSource: "${urlPrev }listJSON",
	 	 aaSorting: [[8, "desc" ]], // 需要自定义
		 uxUrlPrev:"${urlPrev }",
		 uxDataTitle:"${dataTitle }",
		 uxCheckable:true,
		 uxCloseScroll:true,
		 uxDrapable:true,
		 "aoColumns": [
		              
		               { sTitle:'活动图片',
		            	  "mData": "image" ,
		            	 'bSortable': false,
		            	 "sWidth": "80px",
			           	 "mRender": function ( data, type, full ) {
		                            		  return '<img width="22" height="22"  src="${sysbaseConfig_image_url_prefix }/'+data+'" alt="" />';
		               	             }
			           },
		               {
			        	   sTitle:'活动简介',
			        	   "mData": "intro"
		               },
		               {
			        	   sTitle:'被关注数',
			        	   "mData": "mfocusCount"
		               },
		               {
			        	   sTitle:'被赞总数',
			        	   "mData": "praiseCount"
		               },
		               {
			        	   sTitle:'被浏览数',
			        	   "mData": "showCount"
		               },
// 			           { 
// 			        		   sTitle:'所属商场',
// 			        	   "mData": "mall" ,
// 		            	   'bSortable': false,
// 			            	  mRender:function(data){
// 			            		  return '<a class="btn  blue-stripe btn-xs" href="'+_GLOBAL.ctx+'/mall/mall/view?id='+data.id+'"  data-handler="MODAL" data-title="商场信息">'+data.name+'</a>'
// 			            	  }
// 			               },
		               { sTitle:'展示时间',
						"mData": "beginTime" ,
						"sWidth": "130px",
		            	"mRender": function(data,type,full){
		            		return Common.formatDate(full.beginTime)+"/"+Common.formatDate(full.endTime);
		            	}
		               },
		               { sTitle:'状态',
		            	   "mData": "status" ,
		            	   "sWidth": "30px",
		            	   mRender:function(data){
		            		   return _GLOBAL.getEnum('promotionStatus',data);
		            	   }
		               },
		               {
			        	   sTitle:'排序',
			        	   "mData": "sort"
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