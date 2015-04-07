<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>危险信息提醒</title>
</head>
<body>
	<div style="padding-left: 30px; padding-top: 30px;">
		<c:choose>
			<c:when test="${flag }">
				${message},如果继续访问请<a href="http://${url}" target="_self">点击</a>
			</c:when>
			<c:otherwise>
				参数异常
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>