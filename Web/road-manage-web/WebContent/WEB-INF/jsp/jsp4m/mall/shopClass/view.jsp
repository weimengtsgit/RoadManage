<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="分类级别"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="shopClass_level" enumKey="${shopClass.level}" />
			</form:field>
			
		
			<form:field  label="父类别"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/view?id=${shopClass.parentType.id}"  data-handler="MODAL" data-title="信息">${shopClass.parentType.name}</a>
			</form:field>
		
			<form:field type="p" label="类别名称"  value="${shopClass.name}" ></form:field>
		
			<form:field type="p" label="类别描述"  value="${shopClass.des}" ></form:field>
			
		</div>
	</form>
