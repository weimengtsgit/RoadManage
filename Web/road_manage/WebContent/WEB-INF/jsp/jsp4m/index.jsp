<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
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
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title><%=sysName%></title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<meta name="MobileOptimized" content="320">
	<!-- BEGIN GLOBAL MANDATORY STYLES -->          
	<link href="${ctx}/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<!-- END GLOBAL MANDATORY STYLES -->
	
	
<%-- 	<link href="${ctx}/assets/plugins/intro.js-0.6.0/introjs.css" rel="stylesheet" type="text/css"/> --%>
	<!-- BEGIN THEME STYLES --> 
	<link href="${ctx}/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/assets/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/assets/css/themes/light.css" rel="stylesheet" type="text/css" id="style_color"/>
	<!-- END THEME STYLES -->
	<link href="${ctx}/assets/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/assets/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
	
	<link href="${ctx}/assets/plugins/select2/select2_metro.css" rel="stylesheet" />
	<link href="${ctx}/assets/plugins/bootstrap-toastr/toastr.min.css" rel="stylesheet"  type="text/css" />
	<link href="${ctx}/assets/plugins/bootstrap-fileupload/bootstrap-fileupload.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/assets/plugins/bootstrap-switch/static/stylesheets/bootstrap-switch-metro.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/assets/plugins/bootstrap-colorpicker/css/colorpicker.css" rel="stylesheet" type="text/css" />
	
	<link href="${ctx}/assets/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" />
	<link href="${ctx}/assets/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/assets/plugins/data-tables/DT_bootstrap.css" rel="stylesheet" />
	<link href="${ctx}/assets/css/pages/pricing-tables.css" rel="stylesheet" type="text/css"/>
	
	<link href="${ctx}/zTreev3.4/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" media="screen"/>
	
	<link href="${ctx}/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/assets/css/custom.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/assets/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/assets/plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" />
	<link href="${ctx}/assets/plugins/bootstrap-timepicker/compiled/timepicker.css" rel="stylesheet" />
	<link href="${ctx}/assets/plugins/bootstrap-datetimepicker/css/datetimepicker.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/favicon.ico" rel="shortcut icon"/>

<script>
	//* hide all elements & show preloader
	document.documentElement.className += ' hideall';
</script>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed" >
	<!-- BEGIN LODING LAYER -->   
	<div id="loading_layer" style="display:none"><img src="${ctx }/assets/img/loading.gif"  alt="" /></div>
	<!-- END LODING LAYER -->   
	
	<!-- BEGIN HEADER -->   
	<div  class="header navbar navbar-inverse navbar-fixed-top">
		<!-- BEGIN TOP NAVIGATION BAR -->
		<div class="header-inner">
			<!-- BEGIN LOGO -->  
			<a class="navbar-brand" href="###" data-handler="MESSAGE"   data-title="IGOOOO" data-content="欢迎使用">
			<img src="${ctx}${sysbaseConfig_logo_uri}"  class="img-responsive" />
			</a>
<!-- 			<a class="navbar-brand text-logo" href="###" data-handler="MESSAGE"   data-title="dearcom.com " data-content="欢迎使用" > -->
<%-- 			<%=sysName %> --%>
<!-- 			</a> -->
			<!-- END LOGO -->
			
			<!-- BEGIN RESPONSIVE MENU TOGGLER --> 
			<a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			<img src="${ctx}/assets/img/menu-toggler.png" alt="" />
			</a> 
			<!-- END RESPONSIVE MENU TOGGLER -->
			<!-- BEGIN TOP NAVIGATION MENU -->
			<ul class="nav navbar-nav pull-right">
				<!-- BEGIN USER LOGIN DROPDOWN -->
				<li class="dropdown user" >
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true" data-step="1" data-intro="这里可以修改登录密码，全屏显示，退出系统。" data-position='left'>
					<span class="username">${sessionScope.curUserName}</span>
					<i class="fa fa-angle-down"></i>
					</a>
					<ul class="dropdown-menu">
						<li><a href="${ctx}/system/sysUser/editInfo" data-handler="MODAL" modal-size="400px"><i class="fa fa-key"></i> 修改密码</a></li>
						<li><a href="javascript:;" id="trigger_fullscreen"><i class="fa fa-move"></i> 全屏显示</a></li>
						<li><a href="#" id="trigger_logout"><i class="fa  fa-sign-out"></i> 退出系统</a></li>	
					</ul>
				</li>
				<!-- END USER LOGIN DROPDOWN -->
			</ul>
			<!-- END TOP NAVIGATION MENU -->
		</div>
		<!-- END TOP NAVIGATION BAR -->
	</div>
	<!-- END HEADER -->
	<div class="clearfix"></div>
	<!-- BEGIN CONTAINER -->   
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<div class="page-sidebar navbar-collapse collapse">
			<!-- BEGIN SIDEBAR MENU -->        
			<ul class="page-sidebar-menu" id="_main_page_sidebar_menu">
				<li>
				<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					<div class="sidebar-toggler hidden-phone" style="margin-bottom:10px;" data-step="2" data-intro="这里可以隐藏或展开菜单栏。" data-position='right'></div>
				<!-- END SIDEBAR TOGGLER BUTTON -->
				</li>
				
				<li class="start" >
					<a class="ajaxify " href="${ctx }/commons/homePage"   data-container="body" data-placement="right" data-original-title="展示实时数据、统计信息等。">
					<i class="fa fa-home"></i> 
					<span class="title">首页</span>
					<span class="selected"></span>
					</a>
				</li>
			</ul>
			<!-- END SIDEBAR MENU -->
		</div>
		<!-- END SIDEBAR -->
		<!-- BEGIN PAGE -->
		<div class="page-content">
			<!-- BEGIN PUBLIC ELEMENTS -->
			
			<!-- END PUBLIC ELEMENTS -->
			<!-- BEGIN STYLE CUSTOMIZER -->
			<div class="theme-panel hidden-xs hidden-sm">
				<div class="toggler" data-step="3" data-intro="这里可以设置页面布局及色彩。" data-position='left'></div>
				<div class="toggler-close"></div>
				<div class="theme-options">
					<div class="theme-option theme-colors clearfix">
						<span>主题颜色</span>
						<ul>
							<li class="color-black  color-default" data-style="default"></li>
							<li class="color-blue" data-style="blue"></li>
							<li class="color-brown" data-style="brown"></li>
							<li class="color-purple" data-style="purple"></li>
							<li class="color-grey" data-style="grey"></li>
							<li class="color-white current color-light" data-style="light"></li>
						</ul>
					</div>
					<div class="theme-option">
						<span> 布局</span>
						<select class="layout-option form-control input-small">
							<option value="fluid" selected="selected">自适应</option>
							<option value="boxed">固定</option>
						</select>
					</div>
					<div class="theme-option">
						<span>页眉</span>
						<select class="header-option form-control input-small">
							<option value="fixed" selected="selected">固定</option>
							<option value="default">自适应</option>
						</select>
					</div>
					<div class="theme-option">
						<span>功能菜单</span>
						<select class="sidebar-option form-control input-small">
							<option value="fixed" selected="selected">固定</option>
							<option value="default" >自适应</option>
						</select>
					</div>
					<div class="theme-option">
						<span>页脚</span>
						<select class="footer-option form-control input-small">
							<option value="fixed">固定</option>
							<option value="default" selected="selected">自适应</option>
						</select>
					</div>
				</div>
			</div>
			<!-- END BEGIN STYLE CUSTOMIZER -->           
			<!-- BEGIN PAGE HEADER-->
			<div class="row hidden-print">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h4 class="page-title">
						首页
					</h4>
					<!-- END PAGE TITLE & BREADCRUMB-->
					<li class="divider"></li>
				</div>
			</div>
			<!-- END PAGE HEADER-->
			
			<!-- BEGIN PAGE CONTENT-->
			<div class="page-content-body">
				<!-- HERE WILL BE LOADED AN AJAX CONTENT -->
			</div>
			<div class="page-content-body-iframe">
				<!-- HERE WILL BE LOADED AN AJAX CONTENT -->
			</div>
			<!-- END PAGE CONTENT-->
		</div>
		<!-- END PAGE -->    
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<div class="footer">
		<div class="footer-inner">
			<%=footerMsg%>
		</div>
	</div>
	
	
	<!-- END FOOTER -->
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<!-- BEGIN CORE PLUGINS -->   
	<!--[if lt IE 9]>
	<script src="${ctx}/assets/plugins/respond.min.js"></script>
	<script src="${ctx}/assets/plugins/excanvas.min.js"></script> 
	<![endif]-->   
	<script src="${ctx}/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
	<script src="${ctx}/assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>      
	<script src="${ctx}/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${ctx}/assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
	<script src="${ctx}/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
	<script src="${ctx}/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>  
	<script src="${ctx}/assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
	<script src="${ctx}/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
	<script src="${ctx}/assets/plugins/jquery.scrollUp.min.js" type="text/javascript"></script>
	<script src="${ctx}/assets/plugins/bootbox/bootbox.js" type="text/javascript"></script>
	<script src="${ctx}/assets/plugins/jquery.iframe-auto-height.plugin.js" type="text/javascript"></script>
	
	<!-- END CORE PLUGINS -->
	<script src="${ctx}/assets/plugins/select2/select2.min.js" type="text/javascript"></script>
	<script src="${ctx}/assets/plugins/select2/select2_locale_zh-CN.js" type="text/javascript"></script>
	<script src="${ctx}/assets/plugins/data-tables/jquery.dataTables.js" type="text/javascript" ></script>
	<script src="${ctx}/assets/plugins/data-tables/DT_bootstrap.js" type="text/javascript" ></script>
	<script src="${ctx}/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script src="${ctx}/assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script src="${ctx}/assets/plugins/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script src="${ctx}/assets/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script src="${ctx}/assets/plugins/bootstrap-toastr/toastr.min.js"></script> 

	<script src="${ctx}/assets/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.js" type="text/javascript"></script>
	<script src="${ctx}/assets/plugins/bootstrap-fileupload/bootstrap-fileupload.js"></script>
	<script src="${ctx}/assets/plugins/jquery-validation/dist/jquery.validate.js"></script>
	<script src="${ctx}/assets/plugins/jquery-validation/dist/additional-methods.min.js"></script>
	<script src="${ctx}/assets/plugins/jquery-validation/jquery.metadata.js"></script>
	<script src="${ctx}/assets/scripts/form-validation.js"></script>
	
	<script src="${ctx}/assets/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript" ></script>
	<script src="${ctx}/assets/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript" ></script>
	<script src="${ctx}/assets/plugins/dragsort-0.5.1/jquery.dragsort-0.5.1.js"></script> 

	<script src="${ctx}/assets/plugins/bootstrap-switch/static/js/bootstrap-switch.min.js" type="text/javascript" ></script>
<%-- 	<script src="${ctx}/assets/plugins/intro.js-0.6.0/intro.js" type="text/javascript" ></script> --%>
	<script src="${ctx}/highcharts/js/highcharts.js" type="text/javascript"></script>
	<script src="${ctx}/assets/scripts/table-ajax.js"></script>   
	<script src="${ctx}/assets/scripts/form-samples.js"></script>
	<script src="${ctx}/assets/scripts/customSelect2.js"></script>
	<script src="${ctx}/assets/scripts/app.js"></script>  
	<script src="${ctx}/assets/scripts/global.js"></script>  
	<script src="${ctx}/assets/scripts/common.js"></script> 
	<script src="${ctx}/zTreev3.4/js/jquery.ztree.all-3.4.min.js" type="text/javascript"></script> 
	    
	<script>
		jQuery(document).ready(function() {
		    _GLOBAL.init("${ctx}","${sysbaseConfig_image_url_prefix }");
			
			App.init();
		});
		
		
	</script>
	<!-- END JAVASCRIPTS -->

</body>
<!-- END BODY -->
</html>