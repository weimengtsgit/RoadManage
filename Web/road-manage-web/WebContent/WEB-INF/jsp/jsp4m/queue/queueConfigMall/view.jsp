<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="所属商场"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/mall/mall/view?id=${queueConfigMall.mall.id}"  data-handler="MODAL" data-title="终端信息">${queueConfigMall.mall.name}</a>
			</form:field>
		
			<form:field type="p" label="最多同时领取排卡的数量"  value="${queueConfigMall.maxQueueCard}" ></form:field>
			
		</div>
	</form>
