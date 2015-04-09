<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/system/sysRole/save?navTabId=system_sysRole_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${sysRole.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>角色名称：</dt>
				<dd><input id="roleName" readonly="readonly" name="roleName" type="text" value="${sysRole.roleName}" size="30" maxlength="80" /></dd>
			</dl>
		
			<dl>
				<dt>角色描述：</dt>
				<dd><input id="roleDesc" readonly="readonly" name="roleDesc" type="text" value="${sysRole.roleDesc}" size="30" maxlength="80" /></dd>
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
				<ul id="_system_sysrole_view_tree" class="ztree"></ul>
			</div>
				
			</div>
			<div class="tabsFooter">
				<div class="tabsFooterContent"></div>
			</div>
		</div>
			
		</div>
		<div class="formBar">
			<ul>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div>
				</li>
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
    data:{roleId:${sysRole.id}},
    url: "${ctx}/system/sysRole/getMenuTree",//请求的action路径  
    error: function () {//请求失败处理函数  
        alert('请求失败');  
    },  
    success:function(data){ //请求成功后处理函数。    
    	var setting = {
    			check: {
    				enable: true
    			},
    			data: {
    				simpleData: {
    					enable: true
    				}
    			},callback: {
    				beforeCheck: function(){
    					return false;
    				}
    			}


    		};
		
    	$.fn.zTree.init($("#_system_sysrole_view_tree"),setting, eval(data));
    	//alert(1);
    }
});  
</script>
