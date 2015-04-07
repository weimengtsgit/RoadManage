<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="${ctx}/dwz/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="${ctx}/dwz/ztree/jquery.ztree.all-3.4.min.js" type="text/javascript"></script>
<link href="${ctx}/dwz/ztree/zTreeStyle.css" rel="stylesheet" type="text/css" media="screen"/>
<style type="text/css">
.ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
.divider { clear:both; display:block; overflow:hidden; text-indent:-1000px; width:auto; height:1px; padding:4px 0 0 0; margin-bottom:5px; border-style:dotted; border-width:0 0 1px 0;}
.font{ padding-bottom:3; margin-left:20px; margin-top:20px; font-size:14px; line-height:100%; font-family:Arial, sans-serif;}
</style>
</head>
<body>
<div class="content_wrap" style="margin-left:20px;">
	<div class="zTreeDemoBackground left">
		<ul id="_system_menu_edit_tree" class="ztree"></ul>
	</div>
</div>

<script>

function dropPrev(treeId, nodes, targetNode) {
	var pNode = targetNode.getParentNode();
	if (pNode && pNode.dropInner === false) {
		return false;
	} else {
		for (var i=0,l=curDragNodes.length; i<l; i++) {
			var curPNode = curDragNodes[i].getParentNode();
			if (curPNode && curPNode !== targetNode.getParentNode() && curPNode.childOuter === false) {
				return false;
			}
		}
	}
	return true;
}
function dropInner(treeId, nodes, targetNode) {
	if (targetNode && targetNode.dropInner === false) {
		return false;
	} else {
		for (var i=0,l=curDragNodes.length; i<l; i++) {
			if (!targetNode && curDragNodes[i].dropRoot === false) {
				return false;
			} else if (curDragNodes[i].parentTId && curDragNodes[i].getParentNode() !== targetNode && curDragNodes[i].getParentNode().childOuter === false) {
				return false;
			}
		}
	}
	return true;
}
function dropNext(treeId, nodes, targetNode) {
	var pNode = targetNode.getParentNode();
	if (pNode && pNode.dropInner === false) {
		return false;
	} else {
		for (var i=0,l=curDragNodes.length; i<l; i++) {
			var curPNode = curDragNodes[i].getParentNode();
			if (curPNode && curPNode !== targetNode.getParentNode() && curPNode.childOuter === false) {
				return false;
			}
		}
	}
	return true;
}

function beforeDrag(treeId, treeNodes) {
	for (var i=0,l=treeNodes.length; i<l; i++) {
		if (treeNodes[i].drag === false) {
			curDragNodes = null;
			return false;
		} else if (treeNodes[i].parentTId && treeNodes[i].getParentNode().childDrag === false) {
			curDragNodes = null;
			return false;
		}
	}
	curDragNodes = treeNodes;
	return true;
}
function beforeDragOpen(treeId, treeNode) {
	autoExpandNode = treeNode;
	return true;
}
function beforeDrop(treeId, treeNodes, targetNode, moveType, isCopy) {//链接不能不在目录下
	if(targetNode != null && (targetNode.id == -1 || targetNode.pId == -1)){
		return false;
	}
	return true;
}

function onDrop(event, treeId, treeNodes, targetNode, moveType, isCopy) {//捕获节点拖拽操作结束的事件回调函数
	
	var moveNode = treeNodes[0];
	var parentNode = null;
	
	if(moveType == 'inner'){
		parentNode = targetNode;
	}else if(moveType == 'prev' || moveType == 'next'){
		parentNode = targetNode.getParentNode();
	}
	
	var parentNodeId = parentNode.id;
	var nodes = parentNode.children;
	var data = "{\"parentId\":"+parentNodeId+",\"moveId\":"+moveNode.id;
	var childrenStr = "";
	for(var i=0;i<nodes.length;i++){
		var curNode = nodes[i];
		
		var curNodeName = curNode.name;
		var curNodeId = curNode.id;
		var curNodeSeq = i;
		if(!childrenStr){
			childrenStr = "{\"nodeId\":"+curNodeId+",\"nodeSeq\":"+curNodeSeq+"}";
		}else{
			childrenStr = childrenStr + ",{\"nodeId\":"+curNodeId+",\"nodeSeq\":"+curNodeSeq+"}";
		}
	}
	
	data = data + ",\"childrens\":[" + childrenStr + "]"+"}";
	
	$.ajax({  
	    async:false,  
	    cache:false,  
	    type: 'POST',  
	    dataType : "json", 
	    data: encodeURI('data='+data),
	    url: "${ctx}/system/sysMenu/orderTree",//请求的action路径  
	    error: function () {//请求失败处理函数  
	        alert('请求失败');  
	    },  
	    success:function(data){
	    }
	});
	
}
//----------编辑---------
function addHoverDom(treeId, treeNode) {
	if(treeNode.type && treeNode.type == '1'){
		var sObj = $("#" + treeNode.tId + "_span");
		if (treeNode.editNameFlag || $("#addBtn_"+treeNode.id).length>0) return;
		var addStr = "<span class='button add' id='addBtn_" + treeNode.id
			+ "' title='添加节点' onfocus='this.blur();'></span>";
		sObj.after(addStr);
		var btn = $("#addBtn_"+treeNode.id);
		if (btn) btn.bind("click", function(){
			var zTree = $.fn.zTree.getZTreeObj("_system_menu_edit_tree");
			var tn = zTree.addNodes(treeNode, {pId:treeNode.id,type:"1",isParent:true,name:"请填写菜单名称"});
			zTree.editName(tn[0]);
			return false;
		});
	}
};
function removeHoverDom(treeId, treeNode) {
	$("#addBtn_"+treeNode.id).unbind().remove();
};

function beforeRemove(treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("_system_menu_edit_tree");
	zTree.selectNode(treeNode);
	return confirm("确认删除 -- " + treeNode.name + " 吗？");
}
function onRemove(e, treeId, treeNode) {
	var nodeId = treeNode.id;
	if(nodeId){
		$.ajax({  
		    async:false,  
		    cache:false,  
		    type: 'POST',  
		    dataType : "json", 
		    data: encodeURI('nodeId='+nodeId),
		    url: "${ctx}/system/sysMenu/deleteTree",//请求的action路径  
		    error: function () {//请求失败处理函数  
		        alert('请求失败');  
		    },  
		    success:function(data){
		    }
		});
	}
	
}
function beforeRename(treeId, treeNode, newName) {
	if (newName.length == 0) {
		alert("名称不能为空.");
		var zTree = $.fn.zTree.getZTreeObj("_system_menu_edit_tree");
		setTimeout(function(){zTree.editName(treeNode)}, 10);
		return false;
	}else if(newName.length > 128){
		alert("名称不能大于128个字符.");
	}
	return true;
}
function onRename(e, treeId, treeNode) {
	var nodeId = treeNode.id;
	var nodeName = treeNode.name;
	if(!nodeId){//添加
		
		var parentNode = treeNode.getParentNode();
		var parentNodeId = parentNode.id;
		var nodes = parentNode.children;
		var nodeSeq = null;
		if(nodes.length == 1){
			nodeSeq = 0;
		}else if(nodes.length > 1){
			var oldLastNode = nodes[nodes.length-2];
			nodeSeq = oldLastNode.seq+1;
		}
		$.ajax({  
		    async:false,  
		    cache:false,  
		    type: 'POST',  
		    dataType : "json", 
		    data: encodeURI('nodeDesc='+nodeName+'&nodeSeq='+nodeSeq+'&parentNodeId='+parentNodeId),
		    url: "${ctx}/system/sysMenu/addTree",//请求的action路径  
		    error: function () {//请求失败处理函数  
		        alert('请求失败');  
		    },  
		    success:function(data){
		    	treeNode.id=data;
		    }
		});
	}else{//修改
		$.ajax({  
		    async:false,  
		    cache:false,  
		    type: 'POST',  
		    dataType : "json", 
		    data: encodeURI('nodeId='+nodeId+'&nodeDesc='+nodeName),
		    url: "${ctx}/system/sysMenu/editTree",//请求的action路径  
		    error: function () {//请求失败处理函数  
		        alert('请求失败');  
		    },  
		    success:function(data){
		    }
		});
	}
}

function showRemoveBtn(treeId, treeNode){
	
	if(treeNode.id == -1){//根目录
		return false;
	}
	
	if(treeNode.type && (treeNode.type == '1')){//目录
		if(treeNode.children){
			return false;
		}
	}else if(treeNode.type && treeNode.type != '1') {
		return false;
	}
	return true;
}

function showRenameBtn(treeId, treeNode){
	if(treeNode.id == -1){//根目录
		return false;
	}
	return true;
}

$.ajax({  
    async:false,  
    cache:false,  
    type: 'POST',  
    dataType : "json", 
    url: "${ctx}/system/sysMenu/getTree",//请求的action路径  
    error: function () {//请求失败处理函数  
        alert('请求失败');  
    },  
    success:function(data){ //请求成功后处理函数。    
    	var setting = {
   			view: {
   				addHoverDom: addHoverDom,
				removeHoverDom: removeHoverDom,
   				selectedMulti: false
   			},
    		edit: {
    			drag: {
    				autoExpandTrigger: true,
    				prev: dropPrev,
					inner: dropInner,
					next: dropNext
    			},
  				enable: true,
  				showRemoveBtn: showRemoveBtn,
  				showRenameBtn: showRenameBtn,
  				removeTitle: '删除节点',
  				renameTitle: '编辑节点名称'
  			},
   			data: {
   				simpleData: {
   					enable: true
   				}
   			},
  			callback: {
				beforeDrag: beforeDrag,
				beforeDrop: beforeDrop,
				beforeDragOpen: beforeDragOpen,
				onDrop: onDrop,
				beforeRemove: beforeRemove,
				beforeRename: beforeRename,
				onRemove: onRemove,
				onRename: onRename
			}
  		};
    $.fn.zTree.init($("#_system_menu_edit_tree"),setting,  eval(data));
    }
});  
</script>
</body>