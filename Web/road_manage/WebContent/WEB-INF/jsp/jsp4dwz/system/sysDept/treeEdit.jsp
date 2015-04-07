<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<style type="text/css">
.ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
.font{ padding-bottom:3; margin-left:20px; margin-top:20px; font-size:14px; line-height:100%; font-family:Arial, sans-serif;}
</style>
<div class="font">部门管理</div>
<div class="divider">divider</div>
<div id="target_edit_tree" class="pageFormContent" layoutH="66" style="float:left; width:200px; overflow: auto;">
<div class="content_wrap" style="margin-left:5px;">
	<div class="zTreeDemoBackground left">
		<ul id="_system_dept_edit_tree" class="ztree"></ul>
	</div>
</div>
</div>
<div id="target_edit_page" class="pageContent" style="border-left-width:1px; border-left-style:dotted;border-left-color: #99bbe8;">
	<form method="post" action="${ctx}/system/sysDept/treeSave?ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, treeAjaxDone);">
		<input type="hidden" id="_system_dept_edit_tree_id" name="id" value="" />
		<input id="_system_dept_edit_tree_pid" type="hidden" class="" name="parentId.id" value=""/>
		<div class="pageFormContent" layoutH="101">
		
			<dl>
				<dt>部门名称：</dt>
				<dd><input class="required regcheck" id="_system_dept_edit_tree_deptName" name="deptName" type="text" value="" size="30"  maxlength=32 /></dd>
			</dl>
			<div class="divider"></div>
			
			<dl>
				<dt>部门编号：</dt>
				<dd><input class="required regcheck" id="_system_dept_edit_tree_deptNum" name="deptNum" type="text" value="" size="30"  maxlength=8 /></dd>
			</dl>
			<div class="divider"></div>
		
			<dl>
				<dt>部门地址：</dt>
				<dd><input class="deptAddr regcheck" id="_system_dept_edit_tree_deptAddr" name="deptAddr" type="text" value="" size="30"  maxlength=64 /></dd>
			</dl>
		
			<div class="divider"></div>

			<dl class="nowrap">
				<dt>部门描述：</dt>
				<dd>
					<textarea class="" id="_system_dept_edit_tree_deptDesc" name="deptDesc" cols="65" rows="4" maxlength="25"></textarea>
				</dd>
			</dl>
		
			<div class="divider"></div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="reset">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
<script type="text/javascript">
<!--

$('#target_edit_page').hide();

//----------编辑---------

function onExpand(event, treeId, treeNode) {
	$('#target_edit_tree').scrollLeft(800);
}

function addHoverDom(treeId, treeNode) {
	var sObj = $("#" + treeNode.tId + "_span");
	sObj.css("float","left");
	if (treeNode.editNameFlag || $("#addBtn_"+treeNode.id).length>0) return;
	var aeStr = "<span class='button add' id='addBtn_" + treeNode.id
		+ "' title='添加子部门'></span><span class='button edit' id='editBtn_" + treeNode.id
		+ "' title='修改部门'></span>";
	
	var addStr = "<span class='button add' id='addBtn_" + treeNode.id
	+ "' title='添加子部门'></span>";
	
	if(treeNode.id == '-1'){
		sObj.after(addStr);
	}else{
		sObj.after(aeStr);
	}
	
	$('#target_edit_tree').scrollLeft(800);
	
	var addbtn = $("#addBtn_"+treeNode.id);
	if (addbtn) addbtn.bind("click", function(){
		$('#target_edit_page').show();
		if(treeNode.id != '-1'){
			$("input[id^='_system_dept_edit_tree_']").val('');
			$("textarea[id^='_system_dept_edit_tree_']").val('');
			
			$('#_system_dept_edit_tree_pid').val(treeNode.id);
		}
	});
	
	var editbtn = $("#editBtn_"+treeNode.id);
	if(editbtn) editbtn.bind("click", function(){
		$('#_system_dept_edit_tree_id').val(treeNode.id);
		$('#_system_dept_edit_tree_pid').val(treeNode.pId);
		$('#_system_dept_edit_tree_deptName').val(treeNode.name);
		$('#_system_dept_edit_tree_deptNum').val(treeNode.deptNum);
		$('#_system_dept_edit_tree_deptAddr').val(treeNode.deptAddr);
		$('#_system_dept_edit_tree_deptDesc').text(treeNode.deptDesc);
		$('#target_edit_page').show();
	});
};

function removeHoverDom(treeId, treeNode) {
	$("#addBtn_"+treeNode.id).unbind().remove();
	$("#editBtn_"+treeNode.id).unbind().remove();
};

function beforeRemove(treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("_system_dept_edit_tree");
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
		    data: encodeURI('id='+nodeId),
		    url: "${ctx}/system/sysDept/delete",//请求的action路径  
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
    url: "${ctx}/system/sysDept/getTree",//请求的action路径  
    error: function () {//请求失败处理函数  
        alert('请求失败');  
    },  
    success:function(data){ //请求成功后处理函数。    
    	var setting = {
   			view: {
   				addHoverDom: addHoverDom,
				removeHoverDom: removeHoverDom,
				/* addDiyDom: addDiyDom, */
   				selectedMulti: false
   			},
    		edit: {
  				enable: true,
  				showRemoveBtn: showRemoveBtn,
  				showRenameBtn: false,
  				removeTitle: '删除节点',
  			},
   			data: {
   				simpleData: {
   					enable: true
   				}
   			},
  			callback: {
  				onExpand: onExpand,
				beforeRemove: beforeRemove,
				onRemove: onRemove
			}
  		};
    $.fn.zTree.init($("#_system_dept_edit_tree"),setting,  eval(data));
    }
});  

function treeAjaxDone(json){
	
	DWZ.ajaxDone(json);
	if (json.statusCode == DWZ.statusCode.ok){
		$("input[id^='_system_dept_edit_tree_']").val('');
		$("textarea[id^='_system_dept_edit_tree_']").val('');
		$('#target_edit_page').hide();
		$.ajax({  
		    async:false,  
		    cache:false,  
		    type: 'POST',  
		    dataType : "json", 
		    url: "${ctx}/system/sysDept/getTree",//请求的action路径  
		    error: function () {//请求失败处理函数  
		        alert('请求失败');  
		    },  
		    success:function(data){ //请求成功后处理函数。    
		    	var setting = {
		   			view: {
		   				addHoverDom: addHoverDom,
						removeHoverDom: removeHoverDom,
						/* addDiyDom: addDiyDom, */
		   				selectedMulti: false
		   			},
		    		edit: {
		  				enable: true,
		  				showRemoveBtn: showRemoveBtn,
		  				showRenameBtn: false,
		  				removeTitle: '删除节点',
		  			},
		   			data: {
		   				simpleData: {
		   					enable: true
		   				}
		   			},
		  			callback: {
		  				onExpand: onExpand,
						beforeRemove: beforeRemove,
						onRemove: onRemove
					}
		  		};
		    	$.fn.zTree.init($("#_system_dept_edit_tree"),setting,  eval(data));
		    	if(json.navTabId != "-1"){
		    		var zTree = $.fn.zTree.getZTreeObj("_system_dept_edit_tree");
			    	var node = zTree.getNodeByParam("id", json.navTabId);
		    		zTree.expandNode(node, true, null, null, false);
		    	}
		    	
		    }
		});  
	}
}
//-->
</script>