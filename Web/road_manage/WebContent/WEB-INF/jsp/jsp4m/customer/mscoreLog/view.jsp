<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="会员"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/customer/mcard/view?id=${mscoreLog.mcard.id}"  data-handler="MODAL" data-title="终端信息">${mscoreLog.mcard.cardId}</a>
			</form:field>
		
			<form:field  label="交易类型"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="com_MscoreLog_type" enumKey="${mscoreLog.type}" />
			</form:field>
			
		
			<form:field type="p" label="交易积分"  value="${mscoreLog.score}" ></form:field>
		
			<form:field type="p" label="剩余积分"  value="${mscoreLog.totalScore}" ></form:field>
		
			<form:field  label="交易时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${mscoreLog.time}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field  name="action"  label="交易说明"  value="${mscoreLog.action}" type="textarea" attrs="rows='5'"  ></form:field>
			
		</div>
	</form>
