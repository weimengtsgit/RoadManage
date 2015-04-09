<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<style type="text/css">
.ztree li span.button.add {margin-left:60px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
</style>

<!-- BEGIN FORM-->
	<form id="system_sysRole_form_1" method="post" action="${ctx}/system/sysRole/save" class="form-horizontal">
	<!-- BEGIN FORM BODY-->
		<div class="form-body">
		<input type="hidden" id="_system_sysrole_edit_tree_sysRole_id" name="id" value="${sysRole.id}" />
		<input type="hidden" id="_system_sysrole_edit_tree_selected_id" name="ids" value="" />
		<div class="row ">
			<div class="col-md-12 ">
				<div class="form-group">
					<label  class="col-md-2 control-label">角色名称：</label>
					<div class="col-md-6">
						<input class="form-control"  name="roleName" type="text" value="${sysRole.roleName}" size="30"  maxlength=30 />
					</div>
				</div>
			</div>
		</div>
		
		<div class="row ">
			<div class="col-md-12 ">
				<div class="form-group">
					<label  class="col-md-2 control-label">角色描述：</label>
					<div class="col-md-6">
						
						<input class="form-control"  name="roleDesc" type="text" value="${sysRole.roleDesc}" size="30"  maxlength=30 />
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12 ">
				<div class="form-group">
					<label  class="col-md-2 control-label">角色类型：</label>
					<div class="col-md-8">
						<form:roletype name="roleType" value="${sysRole.roleType}"></form:roletype>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 ">
				<div class="form-group">
					<label  class="col-md-2 control-label">角色授权信息：</label>
					<div class="col-md-8">
						<ul id="_system_sysrole_edit_tree" class="ztree well"></ul>					
					</div>
				</div>
			</div>
		</div>
</div>
	<div class="form-actions right">
		<button type="button" class="btn default remove">取消</button>
		<button type="submit" class="btn blue"><i class="fa fa-check"></i> 确认</button>
	</div>
	</form>
<!-- END FORM BODY-->
		
<!-- END FORM -->

<script type="text/javascript">
jQuery(document).ready(function() {
	FormSamples.init({
		formId:'system_sysRole_form_1'
	});
});
$.ajax({  
    async:false,  
    cache:false,  
    type: 'POST',  
    dataType : "json", 
    data:{roleId:${sysRole==null?-1:sysRole.id}},
    url: "${ctx}/system/sysRole/getMenuTree",//请求的action路径  
    error: function () {//请求失败处理函数  
        alert('请求失败');  
    },  
    success:function(data){ //请求成功后处理函数。    
    	var setting = {
    			check: {
    				enable: true,
    				chkboxType :{"Y" : "ps", "N" : "s"}
    			},
    			data: {
    				simpleData: {
    					enable: true
    				}
    			},
    			callback: {
    				onCheck:function (event, treeId, treeNode){
    					var treeObj = $.fn.zTree.getZTreeObj(treeId);
    					var ids=",";
    					var checkedNodes = treeObj.getCheckedNodes(true);
    				    for(var i=0;i<checkedNodes.length;i++ ){
    				    	//alert(checkedNodes[i]);
    				    	ids+=checkedNodes[i].id+",";
    				    }
    				    
    				    //alert(ids);
    				    $('#_system_sysrole_edit_tree_selected_id').val(ids);
    				}
    			}

    		};
		
    	$.fn.zTree.init($("#_system_sysrole_edit_tree"),setting, eval(data));
    	//alert(1);
    }
});  
</script>
