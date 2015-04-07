<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="所属商铺"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/view?id=${queueCard.shop.id}"  data-handler="MODAL" data-title="信息">${queueCard.shop.name}</a>
			</form:field>
		
			<form:field type="p" label="卡号"  value="${queueCard.cardNo}" ></form:field>
		
			<form:field  label="卡类型"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="queue_card_type" enumKey="${queueCard.cardType}" />
			</form:field>
			
		
			<form:field  label="顾客"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/customer/customer/view?id=${queueCard.customer.id}"  data-handler="MODAL" data-title="信息">${queueCard.customer.mobile}</a>
			</form:field>
		
			<form:field type="p" label="姓名"  value="${queueCard.name}" ></form:field>
		
			<form:field type="p" label="电话"  value="${queueCard.phone}" ></form:field>
		
			<form:field  label="开始排号时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${queueCard.startTime}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field  label="结束排号时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${queueCard.endTime}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field  label="状态"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="QueueCard_status" enumKey="${queueCard.status}" />
			</form:field>
			
		
			<form:field type="p" label="提醒次数"  value="${queueCard.callTimes}" ></form:field>
			
		</div>
	</form>
