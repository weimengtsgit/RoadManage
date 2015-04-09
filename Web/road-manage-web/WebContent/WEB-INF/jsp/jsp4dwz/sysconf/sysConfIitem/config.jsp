<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/sysconf/sysConfIitem/saveConfig?ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		
		<div class="pageFormContent" layoutH="56">
		
				<input type="hidden" class="" name="id" value="${confTypeId}"/>
			
			<dl class="nowrap">
				<dt>使用说明：</dt>
				<dd> <input value='Constant.configMap.get("参数");' size=50 readonly="readonly"></dd>
			</dl>
			<div class="divider"></div>
		<c:forEach var="entity" items="${list}" varStatus="s">
			<dl class="nowrap">
				<dt>${entity.itemName }：</dt>
			
			<!-- 枚举 -->
			<c:if test="${entity.valueType == '3' }">
				<dd><tag:enum cssStyle="width:535px;" id="itemName" defaultValue="" name="list[${s.count-1}].itemValue" enumName="${entity.enumType.enumName }" enumKey="${entity.itemValue}" /></dd>					
				<span class="info">
					*参数   ${confTypeKey}_${entity.itemKey }
				</span>
			</c:if>
			<!-- 密码 -->
			<c:if test="${entity.valueType == '4' }">
				<dd><input class="" id="itemName" name="list[${s.count-1}].itemValue" type="password" value="${entity.itemValue}" size="100"  maxlength=250 /></dd>
				<span class="info">
					*参数   ${confTypeKey}_${entity.itemKey }
				</span>
			</c:if>
			<!-- 字符串 -->
			<c:if test="${entity.valueType == '1' || entity.valueType == '2'}">
				<dd><textarea  id="itemName" name="list[${s.count-1}].itemValue"  value=""  cols=85 rows="3"  maxlength=250 >${entity.itemValue}</textarea></dd>
				<span class="info">
					*参数   ${confTypeKey}_${entity.itemKey }
				</span>
			</c:if>
				<input type="hidden" name="list[${s.count-1}].id" value="${entity.id}"/>
			</dl>
		
			<div class="divider"></div>
		</c:forEach>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
