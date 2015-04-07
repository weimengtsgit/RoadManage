<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form class="form-horizontal" role="form">
<div class="form-body">

	<h5 class="form-section">注册信息</h5>
	<div class="row">
		<form:field type="p" label="手机号" value="<span class='badge badge-${customer.mobile==null?'default':'primary'}'>${customer.mobile==null?'无':customer.mobile}</span>"  totalWidth="6"></form:field>
		<form:field type="p" label="微信号" value="<span class='badge badge-${customer.weixin==null?'default':'primary'}'>${customer.weixin==null?'无':customer.weixin}</span>"  totalWidth="6"></form:field>
	</div>
	<div class="row">
		<form:field type="p" label="QQ号" value="<span class='badge badge-${customer.qq==null?'default':'primary'}'>${customer.qq==null?'无':customer.qq}</span>"  totalWidth="6"></form:field>
		<form:field type="p" label="VIP号" value="<span class='badge badge-${customer.vip==null?'default':'primary'}'>${customer.vip==null?'无':customer.vip}</span>"  totalWidth="6"></form:field>
	</div>
	<div class="row">
		<form:field type="p" label="注册时间" useBody="true"  totalWidth="6">
		<p class="form-control-static">
		<fmt:formatDate value="${customer.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>
		</p>
		</form:field>
	</div>
	<h5 class="form-section">个人信息</h5>
	<div class="row">
		<form:field type="p" label="年龄" value="<span class='badge badge-${customer.age==null?'default':'primary'}'>${customer.age==null?'无':customer.age}</span>"  totalWidth="6"></form:field>
		<form:field type="p" label="性别" useBody="true" totalWidth="6">
		<p class="form-control-static">
		<tag:enum tagType="view"   enumName="sex" enumKey="${customer.sex}" />
		</p>
		</form:field>
	</div>
	<div class="row">
		<form:field type="textarea" label="兴趣爱好" value="${customer.interest}"  totalWidth="6"></form:field>
		<form:field type="p" label="车牌号" value="<span class='badge badge-${customer.carNum==null?'default':'primary'}'>${customer.carNum==null?'无':customer.carNum}</span>"  totalWidth="6"></form:field>
	</div>
	<h5 class="form-section">动态信息</h5>
	<div class="row">
		<form:field type="p" label="最近一次使用终端" useBody="true"  totalWidth="6">
		<p class="form-control-static">
		<c:if test="${not empty customer.lastUseTerm.mac}">
			<a class="btn blue-stripe btn-xs" href="${ctx}/customer/terminal/view?id=${customer.lastUseTerm.id}"  data-handler="MODAL" data-title="终端信息">${customer.lastUseTerm.mac}</a>
		</c:if>
		</p>
		</form:field>
		<form:field type="p" label="账户余额" value="<span class='badge badge-primary'>${customer.acctBalance}</span>"  totalWidth="6"></form:field>
	</div>
</div>
</form>
			
		