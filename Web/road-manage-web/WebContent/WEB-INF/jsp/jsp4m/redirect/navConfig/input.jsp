<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/redirect/navConfig/save?navTabId=redirect_navConfig_list&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${navConfig.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl class="nowrap">
				<dt>导航URL：</dt>
				<dd>
					<input class="" id="redirectUrl" name="redirectUrl" type="text" value="${navConfig.redirectUrl}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			<div class="divider"></div>
		
			<dl class="nowrap">
				<dt>描述：</dt>
				<dd>
					<textarea class="" id="navdesc" name="navdesc" cols="91" rows="5" width="480">${navConfig.navdesc}</textarea>
					<span class="info"></span>	
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
