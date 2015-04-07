<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_system_sysMenu_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/system/sysMenu/save" class="form-horizontal" >
		<div class="form-body">
			<input type="hidden" name="id" value="${sysMenu.id}" />
			<form:field name="menuDesc" attrs="required" label="菜单名称"  value="${sysMenu.menuDesc}" ></form:field>
		
			<form:field  label="菜单类型"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="menuType" attrs="required"  enumName="menuType" inputType="radio"   enumKey="${sysMenu.menuType}"/>
			</form:field>
			
		
			<form:field name="menuName"  label="菜单URL"  value="${sysMenu.menuName}" type="textarea"  ></form:field>
		
			<form:field name="menuSeq" attrs="" label="菜单序列"  value="${sysMenu.menuSeq}" ></form:field>
		
			<form:field  label="是否可用"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="enabled" attrs=""  enumName="isOrNot" inputType="radio"   enumKey="${sysMenu.enabled}"/>
			</form:field>
			
		
			<form:field  label="是否可见"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="visible" attrs=""  enumName="isOrNot" inputType="radio"   enumKey="${sysMenu.visible}"/>
			</form:field>
			
		
			<form:field  label="是否IFRAME"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="external" attrs=""  enumName="isOrNot" inputType="radio"  defaultValue="0"  enumKey="${sysMenu.external}"/>
			</form:field>
			
		
<%-- 			<form:field  label="打开目标"  useBody="true"  > --%>
<%-- 				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="target" attrs=""  enumName="target" inputType="radio"   enumKey="${sysMenu.target}"/> --%>
<%-- 			</form:field> --%>
			
		
			<form:field name="icon" label="图标"  value="${sysMenu.icon}" useBody="true" >
				<div class="input-group">
						<input type="hidden" name="icon" class="form-control" value="${sysMenu.icon}"> 
						<span class="form-control"><i class="${sysMenu.icon==null?'fa fa-question':sysMenu.icon}"></i></span>                                  
						<span class="input-group-addon">
						<a href="${ctx }/pages/fa-icons.jsp"  data-handler="MODAL" data-title="图标集合"><i class="fa fa-flag"></i></a>
						</span>
				</div>
			</form:field>
		
			<form:field name="summary" attrs="" label="简介"  value="${sysMenu.summary}" ></form:field>
		
			<form:field  label="上级菜单"  useBody="true" >
				<input class="form-control select2" name="parentId.id" type="hidden"   value="${sysMenu.parentId.id}" display-value="${sysMenu.parentId.menuDesc}" result-field="menuDesc"   lookup-url="${ctx}/system/sysMenu/listJSON" filter="filter_LIKES_menuDesc" />
			</form:field>
			
			
		</div>
		<div class="form-actions right">
			<button type="button" class="btn default remove">取消</button>
			<button type="submit" class="btn blue"><i class="fa fa-check"></i> 确认</button>
		</div>
	</form>
		
<script type="text/javascript">

jQuery(document).ready(function() {
	FormSamples.init({
		formId:'${formId }'
	});
	
});
</script>