<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/sysconf/sysConfType/save?navTabId=sysconf_sysConfType_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${sysConfType.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>配置名称：</dt>
				<dd><input class="required" id="confName" name="confName" type="text" value="${sysConfType.confName}" size="30"  maxlength=30 /></dd>
			</dl>
			<dl>
				<dt>配置Key：</dt>
				<dd><input class="required" id="confKey" name="confKey" <c:if test="${sysConfType.confKey!= null }">readonly="readonly"</c:if> type="text" value="${sysConfType.confKey}" size="30"  maxlength=30 /></dd>
			</dl>
		<div class="divider"></div>
			<dl class="nowrap">
				<dt>配置描述：</dt>
				<dd>
					<textarea class="" id="confDes" name="confDes" cols="91" rows="5" width="480">${sysConfType.confDes}</textarea>
				</dd>
			</dl>
		
			<div class="divider"></div>
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
