<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/helpdoc/helpDoc/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
	
	   		<div class="unit">
	   			<label>文档标题：</label>
	   			<input type="text" name="filter_LIKES_docTitle" value="${pageData.filtraMap.LIKES_docTitle}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>文档内容：</label>
	   			<input type="text" name="filter_LIKES_docContent" value="${pageData.filtraMap.LIKES_docContent}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>文档描述：</label>
	   			<input type="text" name="filter_LIKES_docDesc" value="${pageData.filtraMap.LIKES_docDesc}"/>
			</div>
			<div class="divider">divider</div>
	   		
			<div class="unit">
				<label>所属菜单：</label>
				<input id="helpdoc_sysMenu_menuDesc_list" type="hidden" name="sysMenu.id" value='' />
				<input type="text" name="filter_LIKES_sysMenu.menuDesc" value='${pageData.filtraMap["LIKES_sysMenu.menuDesc"]}' suggestFields="menuDesc" suggestUrl="${ctx}/system/sysMenu/lookupJson" lookupGroup="sysMenu" />
				<a class="btnLook" href="${ctx}/system/sysMenu/lookupList" lookupGroup="sysMenu">查找带回</a>
			</div>
			<div class="divider">divider</div>
	   
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">开始查询</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="reset">清空重输</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
