<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
		<input type="hidden" name="id" value="${helpDoc.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>文档标题：</dt>
				<dd><input id="docTitle" readonly="readonly" name="docTitle" type="text" value="${helpDoc.docTitle}" size="30"  /></dd>
			</dl>
		
			<dl>
				<dt>所属菜单：</dt>
				<dd>
				<c:if test="${not empty helpDoc.sysMenu.menuDesc}">
				<a class="ghbutton search right" href="${ctx}/system/sysMenu/view?id=${helpDoc.sysMenu.id}" target="dialog" mask="true" title="查看所属菜单详情">${helpDoc.sysMenu.menuDesc}</a>
				</c:if>
				</dd>
			</dl>
		
			<dl class="nowrap">
				<dt>文档内容：</dt>
				<dd><textarea readonly="readonly" id="docContent" cols="91" rows="5" width="480">${helpDoc.docContent}</textarea></dd>
			</dl>
		
			<dl class="nowrap">
				<dt>文档描述：</dt>
				<dd><textarea readonly="readonly" id="docDesc" cols="91" rows="5" width="480">${helpDoc.docDesc}</textarea></dd>
			</dl>
		
			<div class="divider"></div>
		</div>
		<div class="formBar">
			<ul>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div>
				</li>
			</ul>
		</div>
</div>
