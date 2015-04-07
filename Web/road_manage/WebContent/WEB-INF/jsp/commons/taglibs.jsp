<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.ever4j.utils.SessionUtil"%>
<%@page import="org.ever4j.system.entity.SysUser"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="y" uri="/ever4j-tags" %>
<%@ taglib prefix="tag" uri="/enum.tld" %>
<%@ taglib prefix="form" tagdir="/WEB-INF/tags" %>

<%
	String sysName = application.getAttribute("sysbaseConfig_sysName")==null?"TEST-PROJECT":(String)application.getAttribute("sysbaseConfig_sysName");
	String footerMsg = application.getAttribute("sysbaseConfig_footerMsg")==null?"Copyright © 2012  All Rights Reserved.":(String)application.getAttribute("sysbaseConfig_footerMsg");
	String pageSize = application.getAttribute("sysbaseConfig_pageSize")==null?"10":(String)application.getAttribute("sysbaseConfig_pageSize");
	String verifycodeShow = application.getAttribute("sysbaseConfig_verifycodeShow")==null?"2":(String)application.getAttribute("sysbaseConfig_verifycodeShow");
	boolean	flag = verifycodeShow.equals("1")?true:false;
    request.setAttribute("ctx", request.getContextPath());
    
    
    // 如果当前用户为商场/商铺管理员，则将sysName设置为商场名称
//     SysUser curUser = SessionUtil.getCurrentUser();
//     if(curUser.getMall()!=null && StringUtils.isNotBlank( curUser.getMall().getName())){
//     	sysName = curUser.getMall().getName();
//     }
%>