<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<%@ page import="java.util.Date"%>
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
	<link href="${ctx}/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/assets/plugins/jquery-grumble/css/grumble.min.css" rel="stylesheet" type="text/css"/>
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN THEME STYLES --> 
	<link href="${ctx}/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/assets/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/assets/css/themes/light.css" rel="stylesheet" type="text/css" id="style_color"/>
	
	<!-- END THEME STYLES -->
	<link rel="shortcut icon" href="${ctx}/favicon.ico" />
	<!-- BEGIN PAGE LEVEL STYLES --> 
	<link href="${ctx}/assets/css/pages/login-soft.css" rel="stylesheet" type="text/css"/>
	<!-- END PAGE LEVEL SCRIPTS -->
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
	<!-- BEGIN LOGO -->
	
	<div class="logo">
		<img src="${ctx}${sysbaseConfig_logo_uri}"   />
<%-- 		<%=sysName %> --%>
	</div>
	<!-- END LOGO -->
	<!-- BEGIN LOGIN -->
	<div class="content">
		<!-- BEGIN LOGIN FORM -->
		<form class="login-form" action="${ctx }/j_spring_security_check" method="post">
			<h3 class="form-title">用户登录</h3>
		
			<%
				if (request.getParameter("login_error") != null) {
			%>
			<c:if test="${not empty sessionScope.msg}">
			<div class="alert alert-danger">
				<button class="close" data-close="alert"></button>
				<span>${msg}</span>
			</div>
			</c:if>
			<%
				}
			%>
			
			<div class="form-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">用户名</label>
				<div class="input-icon">
					<i class="fa fa-user"></i>
					<input class="form-control placeholder-no-fix" type="text" id="j_username" autocomplete="off" placeholder="用户名" name="j_username"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">密码</label>
				<div class="input-icon">
					<i class="fa fa-lock"></i>
					<input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" name="j_password"/>
				</div>
			</div>
			<c:if test="<%=flag %>">
			<div class="form-group" style="height: 30px;">
				<label class="control-label visible-ie8 visible-ie9">验证码</label>
				<div class="input-icon" style="width:220px;float:left;">
					<i class="fa fa-lock"></i>
					<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="验证码" name="j_code" id="j_code" />
				</div>
				<div style="cursor:pointer;float:left;" title="看不清，换一张" id="j_code_div">
					<img id="verifyCode" src="${ctx}/verifycode?=<%=new Date() %>" width="80px" height="34px" onclick="doCodeClick()"></img>
				</div>
				
			</div>
			</c:if>
			<div class="form-actions">
				<button type="submit" class="btn blue pull-right">
				登录 <i class="m-icon-swapright m-icon-white"></i>
				</button>            
			</div>
			
			<div class="create-account">
				<p>
					想获得更好的用户体验 ?&nbsp; 
					<a href="chrome_installer.exe" id="get-chrome" style="color: #4d90fe">试试谷歌浏览器</a>
				</p>
			</div>
		</form>
		<!-- END LOGIN FORM -->        
		
	</div>
	<!-- END LOGIN -->
	<!-- BEGIN COPYRIGHT -->
	<div class="copyright">
		<%=footerMsg %>
	</div>
	<!-- END COPYRIGHT -->
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<!-- BEGIN CORE PLUGINS -->   
	<!--[if lt IE 9]>
	<script src="${ctx}/assets/plugins/respond.min.js"></script>
	<script src="${ctx}/assets/plugins/excanvas.min.js"></script> 
	<![endif]-->   
	<script src="${ctx}/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	<script src="${ctx}/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${ctx}/assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
	<script src="${ctx}/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
	<script src="${ctx}/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>  
	<script src="${ctx}/assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
	<script src="${ctx}/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script src="${ctx}/assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
	<script src="${ctx}/assets/plugins/jquery-validation/localization/messages_zh.js" type="text/javascript"></script>
	<script src="${ctx}/assets/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
	<script src="${ctx}/assets/plugins/jquery-grumble/jquery.grumble.min.js?v=6"></script> 
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<!-- END PAGE LEVEL SCRIPTS --> 
	<script>
	var Login = function () {

		var handleLogin = function() {
			$('.login-form').validate({
		            errorElement: 'span', //default input error message container
		            errorClass: 'help-block', // default input error message class
		            focusInvalid: false, // do not focus the last invalid input
		            rules: {
		                j_username: {
		                    required: true
		                },
		                j_password: {
		                    required: true
		                }
		                <c:if test="<%=flag %>">
		                ,j_code: {
		                    required: true
		                }
		                </c:if>
		            },

		         

		            invalidHandler: function (event, validator) { //display error alert on form submit   
		                $('.alert-danger', $('.login-form')).show();
		            },

		            highlight: function (element) { // hightlight error inputs
		                
		            	$(element)
		                    .closest('.form-group').addClass('has-error'); // set error class to the control group
		            },

		            success: function (label) {
		                label.closest('.form-group').removeClass('has-error');
		                label.remove();
		            },

		            errorPlacement: function (error, element) {
		            	if($(element).attr("name")=="j_code"){
		            		
			                error.insertAfter($("#j_code_div"));
		            	}else{
			                error.insertAfter(element.closest('.input-icon'));
		            		
		            	}
		            },

		            submitHandler: function (form) {
		                form.submit();
		            }
		        });

		        $('.login-form input').keypress(function (e) {
		            if (e.which == 13) {
		                if ($('.login-form').validate().form()) {
		                    $('.login-form').submit();
		                }
		                return false;
		            }
		        });
		}


	    return {
	        //main function to initiate the module
	        init: function () {
	        	
	            handleLogin();
// 		       	$.backstretch([
// 			        "${ctx}/assets/img/bg/1.jpg",
// 			        "${ctx}/assets/img/bg/2.jpg",
// 			        "${ctx}/assets/img/bg/3.jpg",
// 			        "${ctx}/assets/img/bg/4.jpg"
// 			        ], {
// 			          fade: 1000,
// 			          duration: 8000
// 			    });
		       	$('#j_username').focus();
	        }

	    };

	}();
		jQuery(document).ready(function() {     
			  Login.init();
			  var isIE6 = !! navigator.userAgent.match(/MSIE 6.0/);
		        var isIE7 = !! navigator.userAgent.match(/MSIE 7.0/);
		        var isIE8 = !! navigator.userAgent.match(/MSIE 8.0/);
		        var isIE9 = !! navigator.userAgent.match(/MSIE 9.0/);
		        var isIE10 = !! navigator.userAgent.match(/MSIE 10.0/);
		        var isIE11 = !! navigator.userAgent.match(/MSIE 11.0/);
		        
		        if(isIE6 || isIE7 || isIE8 || isIE9){
					  $('#get-chrome').grumble({
			      		text: '想获得更好的用户体验 ?', 
			      		angle: 85, 
			      		distance: 100, 
			      		showAfter: 500 
			      	});
		        }
		});
		function doCodeClick(){
			var verifyCode=document.getElementById('verifyCode');
			verifyCode.setAttribute('src','${ctx}/verifycode?='+ new Date());
		}
		
        
        	
        
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>