<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="配置类型"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/view?id=${sysConfIitem.confType.id}"  data-handler="MODAL" data-title="终端信息">${sysConfIitem.confType.confName}</a>
			</form:field>
		
			<form:field type="p" label="配置项名称"  value="${sysConfIitem.itemName}" ></form:field>
		
			<form:field type="p" label="配置项key"  value="${sysConfIitem.itemKey}" ></form:field>
		
			<form:field type="p" label="配置项值"  value="${sysConfIitem.itemValue}" ></form:field>
		
			<form:field  label="值类型"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="sys_conf_value_type" enumKey="${sysConfIitem.valueType}" />
			</form:field>
			
		
			<form:field  label="值枚举类型"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/system/sysEnum/view?id=${sysConfIitem.enumType.id}"  data-handler="MODAL" data-title="终端信息">${sysConfIitem.enumType.enumDesc}</a>
			</form:field>
		
			<form:field  name="des"  label="配置项描述"  value="${sysConfIitem.des}" type="textarea" attrs="rows='5'"  ></form:field>
			
		</div>
	</form>
