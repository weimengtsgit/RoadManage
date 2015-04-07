<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="发送者"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="customer_Message_sender" enumKey="${message.sender}" />
			</form:field>
			
		
			<form:field  label="消息业务类型"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="customer_Message_type" enumKey="${message.type}" />
			</form:field>
			
		
			<form:field  label="操作用户"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/system/sysUser/view?id=${message.user.id}"  data-handler="MODAL" data-title="信息">${message.user.username}</a>
			</form:field>
		
			<form:field type="p" label="shopId"  value="${message.shopId}" ></form:field>
		
			<form:field type="p" label="mallId"  value="${message.mallId}" ></form:field>
		
			<form:field  label="客户"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/view?id=${message.customer.id}"  data-handler="MODAL" data-title="信息">${message.customer.mobile}</a>
			</form:field>
		
			<form:field  name="title"  label="标题"  value="${message.title}" type="textarea" attrs="rows='5'"  ></form:field>
		
			<form:field  name="msgContent"  label="内容"  value="${message.msgContent}" type="textarea" attrs="rows='5'"  ></form:field>
		
			<form:field  label="发送时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${message.sendTime}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field  label="阅读时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${message.readTime}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field  label="是否已读"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="customer_Message_isRead" enumKey="${message.isRead}" />
			</form:field>
			
			
		</div>
	</form>
