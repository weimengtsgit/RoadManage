<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
		<input type="hidden" name="id" value="${sysSheet.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>基础表名：</dt>
				<dd><input id="tableName" readonly="readonly" name="tableName" type="text" value="${sysSheet.tableName}" size="30"  /></dd>
			</dl>
		
			<dl>
				<dt>分表周期：</dt>
				<dd><tag:enum tagType="view"   enumName="sheetCycle" enumKey="${sysSheet.cycle}" /></dd>
			</dl>
		
			<dl>
				<dt>起始时间：</dt>
				
				<dd><input id="startTime" readonly="readonly" name="startTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${sysSheet.startTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" />
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
