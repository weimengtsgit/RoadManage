<%@tag import="org.apache.commons.lang.StringUtils"%>
<%@tag pageEncoding="UTF-8"%>

<%@ attribute name="label" type="java.lang.String" required="true" %>
<%@ attribute name="name" type="java.lang.String" required="false"%>
<%@ attribute name="value" type="java.lang.String" required="false"%>
<%@ attribute name="defaultValue" type="java.lang.String" required="false"%>

<%@ attribute name="useBody" type="java.lang.Boolean" required="false"  %>
<%@ attribute name="id" type="java.lang.String" required="false"%>
<%@ attribute name="required" type="java.lang.Boolean" required="false"%>
<%@ attribute name="type" type="java.lang.String" required="false"%>
<%@ attribute name="rows" type="java.lang.Integer" required="false"%>
<%@ attribute name="lwidth" type="java.lang.Integer" required="false"%>
<%@ attribute name="fwidth" type="java.lang.Integer" required="false"%>
<%@ attribute name="totalWidth" type="java.lang.Integer" required="false"%>
<%@ attribute name="attrs" type="java.lang.String" required="false"%>
<%@ attribute name="readOnly" type="java.lang.Boolean" required="false"%>
<%@ attribute name="cssClass" type="java.lang.String" required="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	if(rows==null){
		rows = 1;
	}
	if(attrs==null){
		attrs = "";
	}
	if(type==null){
		type="text";
	}
	
	if(lwidth==null){
		lwidth=3;
		if(totalWidth!=null){
			lwidth=4;
		}
	}

	if(fwidth==null){
		fwidth=9;
		if(totalWidth!=null){
			fwidth=8;
		}
	}
	
	if(StringUtils.isBlank(value) && StringUtils.isNotBlank(defaultValue)){
		value = defaultValue;
	}
	
	if(useBody==null){
		useBody=false;
	}
	
	StringBuilder commonFieldAttrs=new StringBuilder();;
	commonFieldAttrs.append(" name='").append(name).append("' ");
	
	if(id!=null){
		commonFieldAttrs.append(" id='").append(id).append("' ");
	}
	if(Boolean.TRUE.equals(required) || attrs.contains("required") ){
		commonFieldAttrs.append(" required ");
	}
	
	if(Boolean.TRUE.equals(readOnly)){
		commonFieldAttrs.append(" readOnly ");
	}
	
	if(attrs!=null){
		commonFieldAttrs.append(" ").append(attrs);
	}
	
	request.setAttribute("common_field_attrs", commonFieldAttrs.toString());

%>
<% if(totalWidth!=null) {%>
	<div class="col-md-<%=totalWidth%>">
<%} %>
<div class="form-group">
	<label  class="col-md-<%=lwidth %> control-label"><%=label %>:
	<%if((Boolean.TRUE.equals(required) || attrs.contains("required")) && !type.equals("p")) {%>
		<span class="required">*</span>
	<%} %>
	</label>
	<div class="col-md-<%=fwidth %>">
		<c:choose>
			<c:when test="${useBody}">
				<c:if test="${type=='p' }">
					<p class='form-control-static ${cssClass }' ${common_field_attrs } >
					<jsp:doBody/>
					</p>
				</c:if>
				<c:if test="${type!='p' }">
					<jsp:doBody/>
				</c:if>
			</c:when>
			<c:when test="${type=='textarea' }">
				<textarea class='form-control ${cssClass }' ${common_field_attrs }  rows="<%=rows %>" ><%=value %></textarea>
			</c:when>
			<c:when test="${type=='p' }">
				<p class='form-control-static ${cssClass }' ${common_field_attrs } ><%=value %></p>
			</c:when>
			<c:otherwise>
				<input class='form-control ${cssClass }' type="<%=type %>" ${common_field_attrs } value="<%=value %>"  />
			</c:otherwise>
		</c:choose>
		<c:if test="${!useBody}">
			<jsp:doBody/>
		</c:if>
	</div>
</div>
<% if(totalWidth!=null) {%>
	</div>
<%} %>
