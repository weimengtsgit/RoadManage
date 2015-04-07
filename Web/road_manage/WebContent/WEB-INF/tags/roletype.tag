<%@tag pageEncoding="UTF-8"%>

<%@ attribute name="name" type="java.lang.String" required="true" %>
<%@ attribute name="value" type="java.lang.String" required="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="radio-list">
	<label class="radio-inline">
	<input type="radio" <c:if test="${empty value || value==3}">checked=""</c:if> value="3"  name="${name }"> 商户管理员
	</label>
	<c:if test="${curUser.userType==1 ||curUser.userType==2}">
		<label class="radio-inline">
		<input type="radio" <c:if test="${value==2}">checked=""</c:if> value="2"  name="${name }"> 商场管理员
		</label>
	</c:if>
	<c:if test="${curUser.userType==1}">
		<label class="radio-inline">
		<input type="radio" <c:if test="${value==1}">checked=""</c:if> value="1"  name="${name }"> 超级管理员
		</label> 
	</c:if>
</div>