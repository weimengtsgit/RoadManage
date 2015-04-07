<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="发送者"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="customer_Message_sender" enumKey="${msgLog.sender}" />
			</form:field>
			
		
			<form:field  label="消息业务类型"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="customer_Message_type" enumKey="${msgLog.type}" />
			</form:field>
			
		
			<form:field type="p" label="shopId"  value="${msgLog.shopId}" ></form:field>
		
			<form:field type="p" label="mallId"  value="${msgLog.mallId}" ></form:field>
		
			<form:field  label="客户"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/view?id=${msgLog.customer.id}"  data-handler="MODAL" data-title="信息">${msgLog.customer.mobile}</a>
			</form:field>
		
			<form:field  label="操作用户"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/system/sysUser/view?id=${msgLog.user.id}"  data-handler="MODAL" data-title="信息">${msgLog.user.username}</a>
			</form:field>
		
			<form:field type="p" label="手机号"  value="${msgLog.mobile}" ></form:field>
		
			<form:field  name="msgContent"  label="短信内容"  value="${msgLog.msgContent}" type="textarea" attrs="rows='5'"  ></form:field>
		
			<form:field  label="发送时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${msgLog.sendTime}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field  label="发送状态"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="successful" enumKey="${msgLog.status}" />
			</form:field>
			
		
			<form:field  name="result"  label="发送结果代码"  value="${msgLog.result}" type="textarea" attrs="rows='5'"  ></form:field>
			
		</div>
	</form>
