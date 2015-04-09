<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/system/sysOperLog/save?navTabId=system_sysOperLog_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${sysOperLog.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>用户：</dt>
				<input id="system_operUser_name_input" type="hidden" class="required" name="operUser.id" value="${sysOperLog.operUser.id}"/>
				<input type="text" class="required" size="24" name="operUser.name" value="${sysOperLog.operUser.name}" suggestFields="name" suggestUrl="${ctx}/system/sysUser/lookupJson" lookupGroup="operUser"  onchange="if(!this.value) document.getElementById('system_operUser_name_input').value=''" />
				<a class="btnLook" href="${ctx}/system/sysUser/lookupList" lookupGroup="operUser">查找带回</a>		
			</dl>
			
		
			<dl>
				<dt>操作动作：</dt>
				<dd><input class="" id="operAction" name="operAction" type="text" value="${sysOperLog.operAction}" size="30"  maxlength=30 /></dd>
			</dl>
		
			<dl>
				<dt>操作模块：</dt>
				<dd><input class="" id="operModule" name="operModule" type="text" value="${sysOperLog.operModule}" size="30"  maxlength=30 /></dd>
			</dl>
		
			<dl>
				<dt>操作结果：</dt>
				<dd><input class="" id="operResult" name="operResult" type="text" value="${sysOperLog.operResult}" size="30"  maxlength=30 /></dd>
			</dl>
		
			<dl>
				<dt>用户IP：</dt>
				<dd><input class="required" id="ip" name="ip" type="text" value="${sysOperLog.ip}" size="30"  maxlength=30 /></dd>
			</dl>
		
			<dl class="nowrap">
				<dt>操作内容：</dt>
				<dd>
					<textarea class="" id="operContent" name="operContent" cols="91" rows="5" width="480">${sysOperLog.operContent}</textarea>
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
