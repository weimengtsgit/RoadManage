<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
		<input type="hidden" name="id" value="${sysOperLog.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>用户：</dt>
				<dd>
				<c:if test="${not empty sysOperLog.operUser.name}">
				<a class="ghbutton search right" href="${ctx}/system/sysUser/view?id=${sysOperLog.operUser.id}" target="dialog" mask="true" title="查看用户详情">${sysOperLog.operUser.name}</a>
				</c:if>
				</dd>
			</dl>
		
			<dl>
				<dt>操作动作：</dt>
				<dd><input id="operAction" readonly="readonly" name="operAction" type="text" value="${sysOperLog.operAction}" size="30"  /></dd>
			</dl>
		
			<dl>
				<dt>操作模块：</dt>
				<dd><input id="operModule" readonly="readonly" name="operModule" type="text" value="${sysOperLog.operModule}" size="30"  /></dd>
			</dl>
		
			<dl>
				<dt>操作结果：</dt>
				<dd><input id="operResult" readonly="readonly" name="operResult" type="text" value="${sysOperLog.operResult}" size="30"  /></dd>
			</dl>
		
			<dl>
				<dt>用户IP：</dt>
				<dd><input id="ip" readonly="readonly" name="ip" type="text" value="${sysOperLog.ip}" size="30"  /></dd>
			</dl>
		
			<dl class="nowrap">
				<dt>操作内容：</dt>
				<dd><textarea readonly="readonly" id="operContent" cols="91" rows="5" width="480">${sysOperLog.operContent}</textarea></dd>
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
