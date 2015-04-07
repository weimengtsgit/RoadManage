<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<style type="text/css">
.ztree li span.button.add {margin-left:60px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
	</style>
<div class="pageContent">
	<form method="post"
		action="${ctx}/system/sysRole/save?navTabId=system_sysRole_list&callbackType=closeCurrent&ajax=1"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" id="_system_sysrole_edit_tree_sysRole_id" name="id" value="${sysRole.id}" />
		<input type="hidden" id="_system_sysrole_edit_tree_selected_id" name="ids" value="" />
		<div class="pageFormContent" layoutH="56">

			<dl>
				<dt>角色名称：</dt>
				<dd>
					<input class="required" id="roleName" name="roleName" type="text"
						value="${sysRole.roleName}" size="30" maxlength=32 />
				</dd>
			</dl>
			<dl>
				<dt>角色类型：</dt><!-- cssClass="required"  -->
				<dd>
				<c:if test="${curUser.userType==1 }">
					<input type="radio" name="roleType" value="3" id="roleType3" checked="checked">
					<label for="roleType3" style="float: none;">商铺</label>
					<input type="radio" name="roleType" value="2" id="roleType2">
					<label for="roleType2" style="float: none;">商场</label>
					<input type="radio" name="roleType" value="1" id="roleType1">
					<label for="roleType1" style="float: none;">超级管理员</label>
				</c:if>
				<c:if test="${curUser.userType==2 }">
					<input type="radio" name="roleType" value="3" id="roleType3" checked="checked">
					<label for="roleType3" style="float: none;">商铺管理员</label>
					<input type="radio" name="roleType" value="2" id="roleType2">
					<label for="roleType2" style="float: none;">商场管理员</label>
				</c:if>
				<c:if test="${curUser.userType==3 }">
					<input type="radio" name="roleType" value="3" id="roleType3" checked="checked">
					<label for="roleType3" style="float: none;">商铺管理员</label>
				</c:if>
				</dd>
			</dl>
			<div class="divider"></div>
			<dl>
				<dt>角色描述：</dt>
				<dd>
					<input class="" id="roleDesc" name="roleDesc" type="text"
						value="${sysRole.roleDesc}" size="30" maxlength=64 />
				</dd>
			</dl>
			<div class="divider"></div>



			
			
		<div class="tabs">
			<div class="tabsHeader">
				<div class="tabsHeaderContent">
					<ul>
						<li><a href="javascript:;"><span>角色授权信息</span>
						</a>
						</li>
						
					</ul>
				</div>
			</div>
			<div class="tabsContent" >
			<div class="zTreeDemoBackground left">
				<ul id="_system_sysrole_edit_tree" class="ztree"></ul>
			</div>
				
			</div>
			<div class="tabsFooter">
				<div class="tabsFooterContent"></div>
			</div>
		</div>
			
		</div>



		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">保存</button>
						</div>
					</div>
				</li>
				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div></li>
			</ul>
		</div>
	</form>
	
</div>

<script>
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
