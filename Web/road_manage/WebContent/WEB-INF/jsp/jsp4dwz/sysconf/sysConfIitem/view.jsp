<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
		<input type="hidden" name="id" value="${sysConfIitem.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>配置类型：</dt>
				<dd>
				<c:if test="${not empty sysConfIitem.confType.confName}">
				<a class="ghbutton search right" href="${ctx}/view?id=${sysConfIitem.confType.id}" target="dialog" mask="true" title="查看配置类型详情">${sysConfIitem.confType.confName}</a>
				</c:if>
				</dd>
			</dl>
		
			<dl>
				<dt>值类型：</dt>
				<dd><tag:enum tagType="view"   enumName="sys_conf_value_type" enumKey="${sysConfIitem.valueType}" /></dd>
			</dl>
		<div class="divider"></div>
			<dl>
				<dt>配置项名称：</dt>
				<dd><input id="itemName" readonly="readonly" name="itemName" type="text" value="${sysConfIitem.itemName}" size="30"  /></dd>
			</dl>
			<dl>
				<dt>值枚举类型：</dt>
				<dd>
				<c:if test="${not empty sysConfIitem.enumType.enumDesc}">
				<a class="ghbutton search right" href="${ctx}/system/sysEnum/view?id=${sysConfIitem.enumType.id}" target="dialog" mask="true" title="查看值枚举类型详情">${sysConfIitem.enumType.enumDesc}</a>
				</c:if>
				</dd>
			</dl>
		<div class="divider"></div>
			<dl>
				<dt>配置项key：</dt>
				<dd><input id="itemKey" readonly="readonly" name="itemKey" type="text" value="${sysConfIitem.itemKey}" size="30"  /></dd>
			</dl>
		<div class="divider"></div>
		
		
		<div class="divider"></div>
		
			<dl class="nowrap">
				<dt>配置项描述：</dt>
				<dd><textarea readonly="readonly" id="des" cols="91" rows="5" width="480">${sysConfIitem.des}</textarea></dd>
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
