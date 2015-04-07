<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
		<input type="hidden" name="id" value="${sysConfType.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>配置名称：</dt>
				<dd><input id="confName" readonly="readonly" name="confName" type="text" value="${sysConfType.confName}" size="30"  /></dd>
			</dl>
		
			<dl class="nowrap">
				<dt>配置描述：</dt>
				<dd><textarea readonly="readonly" id="confDes" cols="91" rows="5" width="480">${sysConfType.confDes}</textarea></dd>
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
