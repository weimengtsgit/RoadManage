<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/helpdoc/helpDoc/save?navTabId=helpdoc_helpDoc_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${helpDoc.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>文档标题：</dt>
				<dd><input class="required" id="docTitle" name="docTitle" type="text" value="${helpDoc.docTitle}" size="30"  maxlength=30 /></dd>
			</dl>
		
			<dl>
				<dt>所属菜单：</dt>
				<input id="helpdoc_sysMenu_menuDesc_input" type="hidden" class="required" name="sysMenu.id" value="${helpDoc.sysMenu.id}"/>
				<input type="text" class="required" size="24" name="sysMenu.menuDesc" value="${helpDoc.sysMenu.menuDesc}" suggestFields="menuDesc" suggestUrl="${ctx}/system/sysMenu/lookupJson" lookupGroup="sysMenu"  onchange="if(!this.value) document.getElementById('helpdoc_sysMenu_menuDesc_input').value=''" />
				<a class="btnLook" href="${ctx}/system/sysMenu/lookupList" lookupGroup="sysMenu">查找带回</a>		
			</dl>
			
		
			<dl class="nowrap">
				<dt>文档内容：</dt>
				<dd>
					<textarea class="required editor" id="helpdoc_helpDoc_input_docContent" name="docContent" cols="140" rows="16" width="900">${helpDoc.docContent}</textarea>
				</dd>
			</dl>
		
			<dl class="nowrap">
				<dt>文档描述：</dt>
				<dd>
					<textarea class="" id="docDesc" name="docDesc" cols="140" rows="5" width="900">${helpDoc.docDesc}</textarea>
				</dd>
			</dl>
		
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
		<script type="text/javascript">
		$('#helpdoc_helpDoc_input_docContent').xheditor({html5Upload : false,upLinkUrl:"${ctx}/attachment/attachment/upload?immediate=1",upLinkExt:"zip,rar,txt",upImgUrl:"${ctx}/attachment/attachment/upload?immediate=1",upImgExt:"jpg,jpeg,gif,png",upFlashUrl:"${ctx}/attachment/attachment/upload?immediate=1",upFlashExt:"swf",upMediaUrl:"${ctx}/attachment/attachment/upload?immediate=1",upMediaExt:"avi"});
		</script>
	</form>
</div>
