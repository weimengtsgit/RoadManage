<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="菜单名称"  value="" useBody="true">
			<i class="${sysMenu.icon}"></i> ${sysMenu.menuDesc}
			</form:field>
		
			<form:field  label="菜单类型"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="menuType" enumKey="${sysMenu.menuType}" />
			</form:field>
			
		
			<form:field  name="menuName"  label="菜单URL"  value="${sysMenu.menuName}" type="textarea" attrs="rows='5'"  ></form:field>
		
			<form:field type="p" label="菜单序列"  value="${sysMenu.menuSeq}" ></form:field>
		
			<form:field  label="是否可用"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="isOrNot" enumKey="${sysMenu.enabled}" />
			</form:field>
			
		
			<form:field  label="是否可见"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="isOrNot" enumKey="${sysMenu.visible}" />
			</form:field>
			
		
			<form:field  label="是否IFRAME"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="isOrNot" enumKey="${sysMenu.external}" />
			</form:field>
			
		
			<form:field  label="打开目标"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="target" enumKey="${sysMenu.target}" />
			</form:field>
			
		
		
			<form:field type="p" label="简介"  value="${sysMenu.summary}" ></form:field>
		
			<form:field  label="上级菜单"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/system/sysMenu/view?id=${sysMenu.parentId.id}"  data-handler="MODAL" data-title="终端信息">${sysMenu.parentId.menuDesc}</a>
			</form:field>
			
		</div>
	</form>
