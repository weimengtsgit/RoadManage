<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/mall/apDevice/save?navTabId=mall_apDevice_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${apDevice.id}" />
		<div class="pageFormContent" layoutH="56">
			<c:if test="${curUser.userType == 2 }">
				<input id="mall_mall_name_input" type="hidden" class="" name="mall.id" value="1"/>
			</c:if>
			<c:if test="${curUser.userType != 2 }">
				<dl>
					<dt>商场：</dt>
					<dd>
						<input id="mall_mall_name_input" type="hidden" class="" name="mall.id" value="${apDevice.mall.id}"/>
						<input type="text" class="" size="24" name="mall.name" value="${apDevice.mall.name}" suggestFields="name" suggestUrl="${ctx}/mall/mall/lookupJson" lookupGroup="mall"  onchange="if(!this.value) document.getElementById('mall_mall_name_input').value=''" />
						<a class="btnLook" href="${ctx}/mall/mall/lookupList" lookupGroup="mall">查找带回</a>
						<span class="info"></span>		
					</dd>
				</dl>
			</c:if>
		
			<dl>
				<dt>AP MAC：</dt>
				<dd>
					<input class="required mac" id="mac" name="mac" type="text" value="${apDevice.mac}" size="30"  maxlength=30  />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>设备位置：</dt>
				<dd>
					<input class="" id="location" name="location" type="text" value="${apDevice.location}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>设备IP：</dt>
				<dd>
					<input class="ip" id="ip" name="ip" type="text" value="${apDevice.ip}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>创建时间：</dt>
				
				<dd>
					<input id="createTime" name="createTime" type="text" class="date " dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${apDevice.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" d>
					<a class="inputDateButton" href="javascript:;">选择</a>
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>设备出厂SN：</dt>
				<dd>
					<input class="" id="sn" name="sn" type="text" value="${apDevice.sn}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl class="nowrap">
				<dt>设备详细描述：</dt>
				<dd>
					<textarea class="" id="description" name="description" cols="91" rows="5" width="480">${apDevice.description}</textarea>
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
