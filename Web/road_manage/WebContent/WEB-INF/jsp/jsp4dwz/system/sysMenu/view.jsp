<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
		<input type="hidden" name="id" value="${sysMenu.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>菜单类型：</dt>
				<dd><tag:enum tagType="view"   enumName="menuType" enumKey="${sysMenu.menuType}" /></dd>
			</dl>
		
			<dl>
				<dt>菜单序列：</dt>
				<dd><input id="menuSeq" readonly="readonly" name="menuSeq" type="text" value="${sysMenu.menuSeq}" size="30"  /></dd>
			</dl>
		
			<dl>
				<dt>是否IFRAME：</dt>
				<dd><tag:enum tagType="view"   enumName="isOrNot" enumKey="${sysMenu.external}" /></dd>
			</dl>
		
			<dl>
				<dt>打开目标：</dt>
				<dd><tag:enum tagType="view"   enumName="target" enumKey="${sysMenu.target}" /></dd>
			</dl>
		
			<dl>
				<dt>上级菜单：</dt>
				<dd>
				<c:if test="${not empty sysMenu.parentId.menuDesc}">
				<a class="ghbutton search right" href="${ctx}/system/sysMenu/view?id=${sysMenu.parentId.id}" target="dialog" mask="true" title="查看上级菜单详情">${sysMenu.parentId.menuDesc}</a>
				</c:if>
				</dd>
			</dl>
		
			<dl class="nowrap">
				<dt>菜单名称：</dt>
				<dd><textarea readonly="readonly" id="menuDesc" cols="91" rows="5" width="480">${sysMenu.menuDesc}</textarea></dd>
			</dl>
		
			<dl class="nowrap">
				<dt>菜单URL：</dt>
				<dd><textarea readonly="readonly" id="menuName" cols="91" rows="5" width="480">${sysMenu.menuName}</textarea></dd>
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
