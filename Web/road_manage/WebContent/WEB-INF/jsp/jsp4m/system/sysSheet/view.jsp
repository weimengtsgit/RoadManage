<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="基础表名"  value="${sysSheet.tableName}" ></form:field>
		
			<form:field  label="分表周期"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="sheetCycle" enumKey="${sysSheet.cycle}" />
			</form:field>
			
		
			<form:field  label="起始时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${sysSheet.startTime}" pattern="yyyy-MM-dd"/>
			</form:field>
			
		</div>
	</form>
