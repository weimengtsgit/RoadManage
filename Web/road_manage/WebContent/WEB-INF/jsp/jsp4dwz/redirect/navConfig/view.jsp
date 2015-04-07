<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
		<input type="hidden" name="id" value="${navConfig.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl class="nowrap">
				<dt>导航URL：</dt>
				<dd>
					<input id="redirectUrl" readonly="readonly" name="redirectUrl" type="text" value="${navConfig.redirectUrl}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
			<div class="divider"></div>
		
			<dl class="nowrap">
				<dt>描述：</dt>
				<dd>
					<textarea readonly="readonly" id="navdesc" cols="91" rows="5" width="480">${navConfig.navdesc}</textarea>
				</dd>
				<span class="info"></span>
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
