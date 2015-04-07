<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<%
	String viewTreeId="view_tree_id_"+System.currentTimeMillis();
	request.setAttribute("viewTreeId", viewTreeId);
%>
<form class="form-horizontal">
	<div class="form-body">
		<form:field name="" label="角色名称" value="${sysRole.roleName}" type="p" cssClass="form-control"   lwidth="2" fwidth="6" ></form:field>
		<form:field name="" label="角色描述" value="${sysRole.roleDesc}" type="p" cssClass="form-control"  lwidth="2" fwidth="6" ></form:field>
		<form:field name="" label="角色类型" value="" useBody="true"  lwidth="2" fwidth="6" >
			<p class="form-control"><tag:enum tagType="view" enumName="userType" enumKey="${sysRole.roleType}" /></p>
		</form:field>
		<form:field name="" label="角色授权信息" value="" useBody="true"  lwidth="2" fwidth="8">
			<ul id="${viewTreeId}" class="ztree well"></ul>
		</form:field>
		
</div>
</form>

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
		
    	$.fn.zTree.init($("#${viewTreeId}"),setting, eval(data));
    	//alert(1);
    }
});  
</script>
