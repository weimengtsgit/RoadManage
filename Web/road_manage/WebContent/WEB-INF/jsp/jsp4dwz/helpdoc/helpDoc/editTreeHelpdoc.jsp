<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<html>
<head>
<script src="${ctx}/dwz/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="${ctx}/dwz/xheditor/xheditor-1.1.14-zh-cn.min.js" type="text/javascript"></script>
</head>
<body>
	<div class="pageContent">
	<form method="post" action="${ctx}/helpdoc/helpDoc/save" encType="POST" >
		<input type="hidden" name="id" value="${helpDoc.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>文档标题：</dt>
				<dd><input class="required" id="docTitle" name="docTitle" type="text" value="${helpDoc.docTitle}" size="30"  maxlength=30 /></dd>
			
			</dl>
		
			<input type="hidden" name="sysMenu.id" value="${helpDoc.sysMenu.id}"/>
			<dl class="nowrap">
				<dt>文档内容：</dt>
				<dd>
					<textarea class=""  id="docContent" name="docContent" cols="100"  rows="20" >${helpDoc.docContent}</textarea>
				</dd>
			</dl>
		
			<dl class="nowrap">
				<dt>文档描述：</dt>
				<dd>
					<textarea id="docDesc" name="docDesc"  cols="100" rows="3"> ${helpDoc.docDesc}</textarea>
				</dd>
			</dl>
		
		</div>
		<center>
			<button type="submit">保存</button>
			&nbsp;
			<button type="reset">重置</button>
		</center>
	</form>
</div>
	<script type="text/javascript">

	function pageInit()

	{

	$('#docContent').xheditor({html5Upload : false,upLinkUrl:"${ctx}/attachment/attachment/upload?immediate=1",upLinkExt:"zip,rar,txt",upImgUrl:"${ctx}/attachment/attachment/upload?immediate=1",upImgExt:"jpg,jpeg,gif,png",upFlashUrl:"${ctx}/attachment/attachment/upload?immediate=1",upFlashExt:"swf",upMediaUrl:"${ctx}/attachment/attachment/upload?immediate=1",upMediaExt:"avi"});

	}
	$(pageInit);

	</script>
</body>
</html>