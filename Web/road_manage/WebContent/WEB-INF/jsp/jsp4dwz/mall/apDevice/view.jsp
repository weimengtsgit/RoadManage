<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
		<input type="hidden" name="id" value="${apDevice.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>商场：</dt>
				<dd>
					<c:if test="${not empty apDevice.mall.name}">
						<a class="ghbutton search right" href="${ctx}/mall/mall/view?id=${apDevice.mall.id}" target="dialog" mask="true" title="查看商场详情">${apDevice.mall.name}</a>
					</c:if>
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>AP MAC：</dt>
				<dd>
					<input id="mac" readonly="readonly" name="mac" type="text" value="${apDevice.mac}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>设备位置：</dt>
				<dd>
					<input id="location" readonly="readonly" name="location" type="text" value="${apDevice.location}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>设备IP：</dt>
				<dd>
					<input id="ip" readonly="readonly" name="ip" type="text" value="${apDevice.ip}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>创建时间：</dt>
				
				<dd>
					<input id="createTime" readonly="readonly" name="createTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${apDevice.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>设备出厂SN：</dt>
				<dd>
					<input id="sn" readonly="readonly" name="sn" type="text" value="${apDevice.sn}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl class="nowrap">
				<dt>设备详细描述：</dt>
				<dd>
					<textarea readonly="readonly" id="description" cols="91" rows="5" width="480">${apDevice.description}</textarea>
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
