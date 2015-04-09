<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<html>

  <frameset cols="20%,80%>">
	<frame src="${ctx}/helpdoc/helpDoc/helpdocTreeList" frameborder="0" noresize="noresize" name="leftFrame"  scrolling="auto"/>
	<frame src="${ctx}/helpdoc/helpDoc/editHelpDoc?sysMenuId=0" name="helpdocIframeId" scrolling="auto"/>
  </frameset>
</html>
