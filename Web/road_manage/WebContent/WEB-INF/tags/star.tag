<%@tag import="org.ever4j.system.entity.SysOperLog"%>
<%@tag pageEncoding="UTF-8"%>

<%@ attribute name="value" type="java.lang.Float" required="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	StringBuffer resultArray = new StringBuffer();
	if(value !=null){
		Double fullNum = Math.floor(value);
		
		boolean isHalf = false;
		if((value-fullNum)>=0.5){
			isHalf = true;
		}
		resultArray.append("<span style='color:#35aa47;'>");
		int i=0;
		for(;i<fullNum;i++){
			resultArray.append("<i class='fa fa-star'></i>");
		}
		if(isHalf){
			resultArray.append("<i class='fa fa-star-half-o'></i>");
			i++;
		}
		for(;i<6;i++){
			resultArray.append("<i class='fa fa-star-o'></i>");
		}
		resultArray.append("</span>");
	}
%>
<%=resultArray%>