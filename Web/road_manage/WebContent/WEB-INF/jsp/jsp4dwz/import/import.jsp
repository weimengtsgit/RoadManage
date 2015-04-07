<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<h2 class="contentTitle">请选择需要导入的文件</h2>
<form name="saveForm" action="${ctx}${uri}?navTabId=${navTabId}&callbackType=closeCurrent&ajax=1" method="post" enctype="multipart/form-data" class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone)">
<div class="pageContent">
	<div class="pageFormContent" layoutH="97">
		<dl>
			<dt>文件：</dt><dd><input type="file" name="upload" class="required" size="30" value=""/></dd>
		</dl>
	</div>
	<div class="formBar">
		<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">导入</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</div>
</form>
