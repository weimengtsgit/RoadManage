<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/mall/shopPromotion/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_MALL_SHOPPROMOTION_" ></c:set>
<c:set scope="page" var="dataTitle" value="商铺优惠" ></c:set>
<c:set scope="page" var="tableId" value="data-table-mall-shopPromotion-1" ></c:set>
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
								<sec:authorize ifAllGranted="${rolePrev }SUBMITAUDIT">
									<a href="${urlPrev}submitAudit" class="btn btn-sm green "  data-handler="CONFIRM" data-title="确实要提交审核吗？提交审核后将不能修改！" data-set="#${tableId } .checkboxes">
										<i class="fa fa-check"></i> 提交审核
									</a>
								</sec:authorize>
							</div>
						</div>
						<div class="portlet-body">
						
						
						<form class="form-inline" role="form" onsubmit="return false;">
								
								<a href="#" class="btn search default pull-right " ><i class="fa fa-search"></i></a>
								<div class="form-group pull-right">
									<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_intro"  placeholder="优惠简介">
								</div>
								<div class="form-group pull-right">
									<tag:enum name="filter_EQT_status"  attrs="placeholder='优惠状态'" cssClass="form-control form-control-inline input-medium select2me"  enumName="promotionStatus" tagType="edit" />
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
 TableAjax.init('${tableId}',{
	 sAjaxSource: "${urlPrev }listJSON",
	 aaSorting: [[10, "desc" ]], // 需要自定义
	 uxUrlPrev:"${urlPrev }",
	 uxDataTitle:"${dataTitle }",
	 uxCheckable:true,
	 uxCloseScroll:true,
	 uxDrapable:true,
	 aoColumns: [
   		  {sTitle:'图片', mData: "image" , uxImg:true},
          {sTitle:'优惠简介', mData: "intro" ,uxLongText:true},
          {sTitle:'所属商铺',
       	      mData: "shop" ,
           	  mRender:function(data){
           		  return '<a class="btn  blue-stripe btn-xs" href="'+_GLOBAL.ctx+'/mall/shop/view?id='+data.id+'"  data-handler="MODAL" data-title="商铺信息">'+data.name+'</a>'
           	  }
           },
           {
        	   sTitle:'关注数',
        	   "mData": "mfocusCount"
           },
           {
        	   sTitle:'赞总数',
        	   "mData": "praiseCount"
           },
           {
        	   sTitle:'浏览数',
        	   "mData": "showCount"
           },
           { sTitle:'展示时间',
				"mData": "beginTime" ,
				"sWidth": "130px",uxLongText:true,
           	"mRender": function(data,type,full){
           		return Common.formatDate(full.beginTime)+" / "+Common.formatDate(full.endTime);
           	}
              },
          {sTitle:'审核状态',mData: "auditStatus" ,uxEnum:'shopAuditStatus'},
          {sTitle:'状态',mData: "status" ,uxEnum:'promotionStatus',uxFastSetUri:'setStatus'},
          {
       	   sTitle:'排序',
       	   "mData": "sort"
          },
          {uxCogs:[
	          {name:"查看"}
	          <sec:authorize ifAllGranted="${rolePrev }EDIT">
	          ,{name:"修改",isShow:function(data,type,full){
// 	        	  if(full.auditStatus==0 || full.auditStatus==3 ){
//         			  return true;
//         		  }else{
//         			  return false;
//         		  }
				return true;
	          }}
	          </sec:authorize>
	          <sec:authorize ifAllGranted="${rolePrev }DELETE"> 
	          ,{name:"删除"}
	          </sec:authorize>
	          <sec:authorize ifAllGranted="${rolePrev }AUDIT">
	          ,{
	        	  name:"审核",
	        	  uri:"audit",
	        	  dataHandler:"INLINE",
	        	  iclass:'fa fa-check primary',
	        	  isShow:function(data,type,full){
	        		  if(full.auditStatus==1){
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