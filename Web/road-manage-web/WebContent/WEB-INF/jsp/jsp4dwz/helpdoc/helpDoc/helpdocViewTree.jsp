<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="${ctx}/dwz/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="${ctx}/dwz/ztree/jquery.ztree.all-3.4.min.js" type="text/javascript"></script>
<link href="${ctx}/dwz/ztree/zTreeStyle.css" rel="stylesheet" type="text/css" media="screen"/>

</head>
<body>
	<div style="te">
		<div >目录</div>
		<div class="content_wrap">
			<div class="zTreeDemoBackground left">
				<ul id="_helpdoc_elpDoc_helpDocTreeList_view" class="ztree"></ul>
			</div>
		</div>
	</div >
<script>
$.ajax({  
    async:false,  
    cache:false,  
    type: 'POST',  
    dataType : "json",
    url: "${ctx}/system/sysRole/getMenuTreeForViewHelpDoc",//请求的action路径  
    error: function () {//请求失败处理函数  
        alert('请求失败');  
    },  
    success:function(znodes){ //请求成功后处理函数。    
    	var setting = {
   			data: {
   				simpleData: {
   					enable: true
   				}
   			},
   			key:{
   				url:znodes.url
   			},
   			callback: {
   				beforeCheck: function(){
   					return false;
   				}
   			}
    	};
		
    	$.fn.zTree.init($("#_helpdoc_elpDoc_helpDocTreeList_view"),setting, eval(znodes));
    	//alert(1);
    }
});  
</script>
</body>
</html>