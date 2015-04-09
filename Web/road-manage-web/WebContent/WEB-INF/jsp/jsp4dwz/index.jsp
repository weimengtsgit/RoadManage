<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Object obj = session.getAttribute("curUser");
	if(obj == null){
%>
	<script type="text/javascript">
		window.location.href="${ctx}/j_spring_security_logout";
	</script>
<%
	}
%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title><%=sysName%></title>
<%@ include file="/WEB-INF/jsp/commons/meta.jsp"%>



</head>
<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<!-- <div class="logo">标志</div> -->
				<ul style="float: left;margin-top: 16px;margin-left: 8px;" >
					<a href="${ctx}/sys/main/index4m ">
					<div style="font-size: 26px;font-family: 'Microsoft Yahei',arial,宋体,sans-serif;font-weight:bold;color: #333;"><%=sysName%></div>
					</a>
				</ul>
				<ul class="nav">
					<li><a class="ghbutton user" href="${ctx}/system/sysUser/editInfo" target="dialog" mask="true" width="470" height="230" title="修改密码">${sessionScope.curUserName}<c:if test="${not empty curUserRole}">【${curUserRole }】</c:if></a></li>
					<li><a id="syslogout" class="ghbutton arrow right" href="#" onclick="logout();" title="退出系统">退出</a></li>
					
				</ul>
<!-- 				<ul class="themeList" id="themeList" style="float: right;"> -->
<%-- 					<li><a id="_sys_help_current_menu_id" href="${ctx}/helpdoc/helpDoc/viewHelpDocMain?id=0" target="_blank" ><span>用户手册</span></a></li>					 --%>
<%-- 					<li><a href="${ctx}/dwz-user-guide.chm" target="_self" ><span>dwzApI下载</span></a></li>					 --%>
<%-- 					<li><a href="${ctx}/zTreev3.4/api/API_cn.html" target="_blank" ><span>zTreeApI</span></a></li>					 --%>
<%-- 					<li><a href="${ctx}/zTreev3.4/demo/cn/index.html" target="_blank" ><span>zTree示例</span></a></li>					 --%>
<%-- 					<li><a href="${ctx}/dwz-ria/index.html" target="_blank" ><span>dwz示例</span></a></li>					 --%>
<%-- 					<li><a href="${ctx}/jQueryAPI_1.7.1_CN.chm" target="_self" ><span>jQueryApI下载</span></a></li>					 --%>
<!-- 				</ul> -->
			</div>
			
		</div>
		
		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse" style="text-align: center;">
					<div class="toggleCollapse"><div></div></div>
					<span style="color: #15428B;">
					</span>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse">
					<a href="#" onclick="changeHomePage();">
					<h2>首页</h2>
					</a>
				<div>收缩</div>
				</div>
				
				
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">首页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li id="_home_page_li_id"><a href="javascript:;" >我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox" style="height: 100%;overflow-y: auto;" id="_main_navTab">
					<div class="page unitBox" id="_main_home_page">
						<iframe id="_main_home_page_iframe" src="${ctx}/commons/homePage"  style="width:100%;" frameborder="no" border="0" marginwidth="0" marginheight="0"></iframe>
					</div>
				</div>
			</div>
		</div>

	</div>

	<div id="footer"><div style="float: left;padding-left: 10px;">登录时间【${sessionScope.logTime}】IP【${sessionScope.logIp}】</div><div style="float:right;padding-right: 25px"><%=footerMsg%></div></div>
	<script type="text/javascript">

$(function(){
	DWZ.init("${ctx}/dwz/dwz.frag.xml", {
		loginUrl:"login.jsp", loginTitle:"登录",	// 弹出登录对话框
//		loginUrl:"login.html",	// 跳到登录页面
		statusCode:{ok:200, error:300, timeout:301}, //【可选】
		pageInfo:{pageNum:"pageNo", numPerPage:"pageSize", orderField:"fieldName", orderDirection:"compositorType"}, //【可选】
		debug:false,	// 调试模式 【true|false】
		callback:function(){
			//$("#themeList").theme({themeBase:"${ctx}/dwz/themes"});
			//setTimeout(function() {$("#navMenu .selected a").trigger("click");}, 10);
			initEnv();
			$.get("${ctx}/sys/main/getNav", function(data){
				 $("#sidebar").append(data);
				 initEnv();
			});
			
		}
	});
	
	//若浏览器版本为ie6时，退出样式中的图片不显示
	if($.browser.msie && ($.browser.version=="6.0") && !$.support.style){
		$('#syslogout').attr("class", "");
	}
	
	//初始化首页
	$("#_main_navTab").resize(function() {
		var ih = $(this).height();
		$("#_main_home_page_iframe").height(ih-2);
	});
});

function logout() {
	alertMsg.confirm("确实要退出系统?",{
		okCall:function(){
			window.location.href="${ctx}/j_spring_security_logout";
			return false;
		}
	});
}

function changeHomePage(){
	
	$("#_home_page_li_id > a").click();
	
}
</script>
</body>
</html>