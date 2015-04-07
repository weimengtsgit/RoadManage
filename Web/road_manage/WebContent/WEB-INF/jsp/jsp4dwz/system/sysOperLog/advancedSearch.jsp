<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/system/sysOperLog/list" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
			
			<div class="unit">
				<label>用户：</label>
				<input id="system_operUser_name_list" type="hidden" name="operUser.id" value='' />
				<input type="text" name="filter_LIKES_operUser.name" value='${pageData.filtraMap["LIKES_operUser.name"]}' suggestFields="name" suggestUrl="${ctx}/system/sysUser/lookupJson" lookupGroup="operUser" />
				<a class="btnLook" href="${ctx}/system/sysUser/lookupList" lookupGroup="operUser">查找带回</a>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>操作动作：</label>
	   			<input type="text" name="filter_LIKES_operAction" value="${pageData.filtraMap.LIKES_operAction}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>操作模块：</label>
	   			<input type="text" name="filter_LIKES_operModule" value="${pageData.filtraMap.LIKES_operModule}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>操作结果：</label>
	   			<input type="text" name="filter_LIKES_operResult" value="${pageData.filtraMap.LIKES_operResult}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>用户IP：</label>
	   			<input type="text" name="filter_LIKES_ip" value="${pageData.filtraMap.LIKES_ip}"/>
			</div>
			<div class="divider">divider</div>
	   
	   		<div class="unit">
	   			<label>操作内容：</label>
	   			<input type="text" name="filter_LIKES_operContent" value="${pageData.filtraMap.LIKES_operContent}"/>
			</div>
			<div class="divider">divider</div>
	   
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">开始查询</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="reset">清空重输</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
