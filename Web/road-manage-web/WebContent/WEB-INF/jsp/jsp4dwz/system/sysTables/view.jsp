<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
		<input type="hidden" name="id" value="${sysTables.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>名称：</dt>
				<dd><input id="tableName" readonly="readonly" name="tableName" type="text" value="${sysTables.tableName}" size="30"  /></dd>
			</dl>
		
			<dl>
				<dt>描述：</dt>
				<dd><input id="tableDesc" readonly="readonly" name="tableDesc" type="text" value="${sysTables.tableDesc}" size="30"  /></dd>
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
