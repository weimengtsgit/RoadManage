<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="会员卡号"  value="${mcard.cardId}" ></form:field>
		
			<form:field  label="会员卡类型"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="Mcard_type" enumKey="${mcard.type}" />
			</form:field>
			
		
			<form:field  label="创建时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${mcard.createTime}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label="积分"  value="${mcard.score}" ></form:field>
		
			<form:field  label="顾客"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/customer/customer/view?id=${mcard.customer.id}"  data-handler="MODAL" data-title="终端信息">${mcard.customer.mobile}</a>
			</form:field>
			
		</div>
	</form>
