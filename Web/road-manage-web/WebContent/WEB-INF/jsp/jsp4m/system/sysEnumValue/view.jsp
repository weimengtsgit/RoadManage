<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="枚举键"  value="${sysEnumValue.enumKey}" ></form:field>
		
			<form:field  name="enumVal"  label="枚举值"  value="${sysEnumValue.enumVal}" type="textarea" attrs="rows='5'"  ></form:field>
		
			<form:field type="p" label="枚举序列"  value="${sysEnumValue.enumSeq}" ></form:field>
		
			<form:field  label="枚举对象"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/system/sysEnum/view?id=${sysEnumValue.enumId.id}"  data-handler="MODAL" data-title="终端信息">${sysEnumValue.enumId.enumDesc}</a>
			</form:field>
			
		</div>
	</form>
