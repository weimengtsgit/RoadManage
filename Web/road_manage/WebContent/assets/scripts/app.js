/**
Core script to handle the entire theme and core functions
**/
var App = function () {
	var _dataSetName = "ids"; //　表格中多选提交时参数的name
	
	   // 默认样式配置
    var _themeDefaultConfig={
    		layout:'fluid', // fluid | boxed
    		header:'fixed', // fixed | default
    		sidebar:'fixed', // fixed | default
    		footer:'default', // fixed | default
    		color:'default',// default | blue | brown | purple | grey | light
    		fullscreen:false, // true | false
    		sidebarHide:false, // true | false 是否隐藏功能菜单
    		openFirstMenu:true // 是否展开第一个菜单目录
    };
	
	/**
	* 时间对象的格式化
	*/
	Date.prototype.format = function(format)
	{
	/*
	* format="yyyy-MM-dd hh:mm:ss";
	*/
	var o = {
	"M+" : this.getMonth() + 1,
	"d+" : this.getDate(),
	"h+" : this.getHours(),
	"m+" : this.getMinutes(),
	"s+" : this.getSeconds(),
	"q+" : Math.floor((this.getMonth() + 3) / 3),
	"S" : this.getMilliseconds()
	}

	if (/(y+)/.test(format))
	{
	format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4
	- RegExp.$1.length));
	}

	for (var k in o)
	{
	if (new RegExp("(" + k + ")").test(format))
	{
	format = format.replace(RegExp.$1, RegExp.$1.length == 1
	? o[k]
	: ("00" + o[k]).substr(("" + o[k]).length));
	}
	}
	return format;
	}
	String.prototype.endWith=function(str){
	if(str==null||str==""||this.length==0||str.length>this.length)
	  return false;
	if(this.substring(this.length-str.length)==str)
	  return true;
	else
	  return false;
	return true;
	}

	String.prototype.startWith=function(str){
	if(str==null||str==""||this.length==0||str.length>this.length)
	  return false;
	if(this.substr(0,str.length)==str)
	  return true;
	else
	  return false;
	return true;
	}
    // IE mode
    var isRTL = false;
    var isIE8 = false;
    var isIE9 = false;
    var isIE10 = false;

    var sidebarWidth = 225;
    var sidebarCollapsedWidth = 35;

    var responsiveHandlers = [];

    // theme layout color set
    var layoutColorCodes = {
        'blue': '#4b8df8',
        'red': '#e02222',
        'green': '#35aa47',
        'purple': '#852b99',
        'grey': '#555555',
        'light-grey': '#fafafa',
        'yellow': '#ffb848'
    };

    // To get the correct viewport width based on  http://andylangton.co.uk/articles/javascript/get-viewport-size-javascript/
    var _getViewPort = function () {
        var e = window, a = 'inner';
        if (!('innerWidth' in window)) {
            a = 'client';
            e = document.documentElement || document.body;
        }
        return {
            width: e[a + 'Width'],
            height: e[a + 'Height']
        }
    }

    // initializes main settings
    var handleInit = function () {

        if ($('body').css('direction') === 'rtl') {
            isRTL = true;
        }

        isIE8 = !! navigator.userAgent.match(/MSIE 8.0/);
        isIE9 = !! navigator.userAgent.match(/MSIE 9.0/);
        isIE10 = !! navigator.userAgent.match(/MSIE 10.0/);

        if (isIE10) {
            jQuery('html').addClass('ie10'); // detect IE10 version
        }
        
        if (isIE10 || isIE9 || isIE8) {
            jQuery('html').addClass('ie'); // detect IE10 version
        }

        /*
          Virtual keyboards:
          Also, note that if you're using inputs in your modal – iOS has a rendering bug which doesn't 
          update the position of fixed elements when the virtual keyboard is triggered  
        */
        var deviceAgent = navigator.userAgent.toLowerCase();
        if (deviceAgent.match(/(iphone|ipod|ipad)/)) {
            $(document).on('focus', 'input, textarea', function () {
                $('.header').hide();
                $('.footer').hide();
            });
            $(document).on('blur', 'input, textarea', function () {
                $('.header').show();
                $('.footer').show();
            });
        }
    }

    var handleSidebarState = function () {
        // remove sidebar toggler if window width smaller than 992(for tablet and phone mode)
        var viewport = _getViewPort();
        if (viewport.width < 992) {
            $('body').removeClass("page-sidebar-closed");
        }
    }

    // runs callback functions set by App.addResponsiveHandler().
    var runResponsiveHandlers = function () {
        // reinitialize other subscribed elements
        for (var i in responsiveHandlers) {
            var each = responsiveHandlers[i];
            each.call();
        }
    }

    // reinitialize the laypot on window resize
    var handleResponsive = function () {
        handleSidebarState();
        handleSidebarAndContentHeight();
        handleFixedSidebar();
        runResponsiveHandlers();
    }

    // initialize the layout on page load
    var handleResponsiveOnInit = function () {
        handleSidebarState();
        handleSidebarAndContentHeight();
    }

    // handle the layout reinitialization on window resize
    var handleResponsiveOnResize = function () {
        var resize;
        if (isIE8) {
            var currheight;
            $(window).resize(function () {
                if (currheight == document.documentElement.clientHeight) {
                    return; //quite event since only body resized not window.
                }
                if (resize) {
                    clearTimeout(resize);
                }
                resize = setTimeout(function () {
                    handleResponsive();
                }, 50); // wait 50ms until window resize finishes.                
                currheight = document.documentElement.clientHeight; // store last body client height
            });
        } else {
            $(window).resize(function () {
                if (resize) {
                    clearTimeout(resize);
                }
                resize = setTimeout(function () {
                    handleResponsive();
                }, 50); // wait 50ms until window resize finishes.
            });
        }
    }

    //* BEGIN:CORE HANDLERS *//
    // this function handles responsive layout on screen size resize or mobile device rotate.

    // Set proper height for sidebar and content. The content and sidebar height must be synced always.
    var handleSidebarAndContentHeight = function () {
        var content = $('.page-content');
        var sidebar = $('.page-sidebar');
        var body = $('body');
        var height;

        if (body.hasClass("page-footer-fixed") === true && body.hasClass("page-sidebar-fixed") === false) {
            var available_height = $(window).height() - $('.footer').outerHeight();
            if (content.height() < available_height) {
                content.attr('style', 'min-height:' + available_height + 'px !important');
            }
        } else {
            if (body.hasClass('page-sidebar-fixed')) {
                height = _calculateFixedSidebarViewportHeight();
            } else {
                height = sidebar.height() + 20;
            }
            if (height >= content.height()) {
                content.attr('style', 'min-height:' + height + 'px !important');
            }
        }
    }

    // Handle sidebar menu
    var handleSidebarMenu = function () {
        jQuery('.page-sidebar').on('click', 'li > a', function (e) {
        	 var url = $(this).attr("href");
        	// 如果url === "###" 则表示当前菜单不可用
            if(url=="###"){
            	return;
            }
            if ($(this).next().hasClass('sub-menu') == false) {
                if ($('.btn-navbar').hasClass('collapsed') == false) {
                    $('.btn-navbar').click();
                }
                return;
            }

            if ($(this).next().hasClass('sub-menu.always-open')) {
                return;
            }

            var parent = $(this).parent().parent();
            var the = $(this);

            parent.children('li.open').children('a').children('.arrow').removeClass('open');
            parent.children('li.open').children('.sub-menu').slideUp(200);
            parent.children('li.open').removeClass('open');

            var sub = jQuery(this).next();
            var slideOffeset = -200;
            var slideSpeed = 200;

            if (sub.is(":visible")) {
                jQuery('.arrow', jQuery(this)).removeClass("open");
                jQuery(this).parent().removeClass("open");
                sub.slideUp(slideSpeed, function () {
                    if ($('body').hasClass('page-sidebar-fixed') == false && $('body').hasClass('page-sidebar-closed') == false) {
                        App.scrollTo(the, slideOffeset);
                    }
                    handleSidebarAndContentHeight();
                });
            } else {
                jQuery('.arrow', jQuery(this)).addClass("open");
                jQuery(this).parent().addClass("open");
                sub.slideDown(slideSpeed, function () {
                    if ($('body').hasClass('page-sidebar-fixed') == false && $('body').hasClass('page-sidebar-closed') == false) {
                        App.scrollTo(the, slideOffeset);
                    }
                    handleSidebarAndContentHeight();
                });
            }

            e.preventDefault();
        });

        // handle ajax links
        jQuery('.page-sidebar').on('click', ' li > a.ajaxify', function (e) {
            e.preventDefault();
            App.scrollTop();
            
            var url = $(this).attr("href");
            // 如果url === "###" 则表示当前菜单不可用
            if(url=="###"){
            	return;
            }
            // 将当前按钮保存到全局变量
            _GLOBAL.lastMenu = $(this);
            
            // 如果为list 则 转换为listPage ,为了适应单独ajax请求的列表页面
            if(url.endWith('/list')){
            	url+='Page';
            }
            if(url.indexOf('/list?')!=-1){
            	url = url.replace('/list?','/listPage?');
            }
            window.location.hash = '#!' + url.replace(_GLOBAL.ctx, '');
            
            var menuContainer = jQuery('.page-sidebar ul');
            var pageContent = $('.page-content');
            var pageContentTitle = $('.page-content .page-title');
            var pageContentBody = $('.page-content .page-content-body');
            var pageContentBodyIframe = $('.page-content .page-content-body-iframe');
            menuContainer.children('li.active').removeClass('active');
            menuContainer.children('arrow.open').removeClass('open');

            $(this).parents('li').each(function () {
                $(this).addClass('active');
                $(this).children('a > span.arrow').addClass('open');
            });
            $(this).parents('li').addClass('active');
            
            
            App.blockUI(pageContent, false);
            pageContentTitle.text($(this).text());
            $.ajax({
                type: "GET",
                cache: false,
                url: url,
                dataType: "html",
                success: function (res) {
                    App.unblockUI(pageContent);
                    clearInterval(_GLOBAL.intervals['iframeInterval']);
                	pageContentBody.html(res);
                	pageContentBodyIframe.empty();
                	App.fixContentHeight(); // fix content height
                	App.initAjax(); // initialize core stuff
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    pageContentBody.html('<h4>无法加载请求页面.</h4><br/>请尝试<a href="javascript:location.reload();">刷新页面</a>以解决该问题.');
                    App.unblockUI(pageContent);
                },
                async: true
            });
        });
        // 处理iframe 
        jQuery('.page-sidebar').on('click', ' li > a.iframefy', function (e) {
        	e.preventDefault();
        	App.scrollTop();
        	
        	var url = $(this).attr("href");
        	// 如果url === "###" 则表示当前菜单不可用
        	if(url=="###"){
        		return;
        	}
        	
        	// 如果为list 则 转换为listPage ,为了适应单独ajax请求的列表页面
        	if(url.endWith('/list')){
        		url+='Page';
        	}
        	window.location.hash = '#!' + url.replace(_GLOBAL.ctx, '');
        	
        	var menuContainer = jQuery('.page-sidebar ul');
        	var pageContent = $('.page-content');
        	var pageContentTitle = $('.page-content .page-title');
        	var pageContentBody = $('.page-content .page-content-body');
        	var pageContentBodyIframe = $('.page-content .page-content-body-iframe');
        	
        	menuContainer.children('li.active').removeClass('active');
        	menuContainer.children('arrow.open').removeClass('open');
        	
        	$(this).parents('li').each(function () {
        		$(this).addClass('active');
        		$(this).children('a > span.arrow').addClass('open');
        	});
        	$(this).parents('li').addClass('active');
        	
        	
        	App.blockUI(pageContent, false);
        	pageContentTitle.text($(this).text());
        	pageContentBody.empty();
        	var iContent = pageContentBodyIframe.html('<iframe  class="page-content-body"   frameborder="0" scrolling="no" style="width: 100%"   ></iframe>');
        	// iframe高度自适应子页面
        	var iframeWin = iContent.children().first();
        	iframeWin.iframeAutoHeight();
        	iframeWin.load(function(){
        		 App.unblockUI(pageContent);
        		 var iframe = this;
        		 clearInterval(_GLOBAL.intervals['iframeInterval']);
        		_GLOBAL.intervals['iframeInterval']= setInterval(function(){
        			if(iframe.contentWindow){
        				var newHeight = iframe.contentWindow.document.body.scrollHeight;
        				iframe.style.height = newHeight + 'px';
        			}else{
        				clearInterval(_GLOBAL.intervals['iframeInterval']);
        			}
        		}, 500);
        	});
        	iframeWin.attr('src',url);
        });
    }

    // Helper function to calculate sidebar height for fixed sidebar layout.
    var _calculateFixedSidebarViewportHeight = function () {
        var sidebarHeight = $(window).height() - $('.header').height() + 1;
        if ($('body').hasClass("page-footer-fixed")) {
            sidebarHeight = sidebarHeight - $('.footer').outerHeight();
        }

        return sidebarHeight;
    }

    // Handles fixed sidebar
    var handleFixedSidebar = function () {
        var menu = $('.page-sidebar-menu');

        if (menu.parent('.slimScrollDiv').size() === 1) { // destroy existing instance before updating the height
            menu.slimScroll({
                destroy: true
            });
            menu.removeAttr('style');
            $('.page-sidebar').removeAttr('style');
        }

        if ($('.page-sidebar-fixed').size() === 0) {
            handleSidebarAndContentHeight();
            return;
        }

        var viewport = _getViewPort();
        if (viewport.width >= 992) {
            var sidebarHeight = _calculateFixedSidebarViewportHeight();

            menu.slimScroll({
                size: '7px',
                color: '#a1b2bd',
                opacity: .3,
                position: isRTL ? 'left' : 'right',
                height: sidebarHeight,
                allowPageScroll: false,
                disableFadeOut: false
            });
            handleSidebarAndContentHeight();
        }
    }

    // Handles the sidebar menu hover effect for fixed sidebar.
    var handleFixedSidebarHoverable = function () {
        if ($('body').hasClass('page-sidebar-fixed') === false) {
            return;
        }

        $('.page-sidebar').off('mouseenter').on('mouseenter', function () {
            var body = $('body');

            if ((body.hasClass('page-sidebar-closed') === false || body.hasClass('page-sidebar-fixed') === false) || $(this).hasClass('page-sidebar-hovering')) {
                return;
            }

            body.removeClass('page-sidebar-closed').addClass('page-sidebar-hover-on');
            $(this).addClass('page-sidebar-hovering');
            $(this).animate({
                width: sidebarWidth
            }, 400, '', function () {
                $(this).removeClass('page-sidebar-hovering');
            });
        });

        $('.page-sidebar').off('mouseleave').on('mouseleave', function () {
            var body = $('body');

            if ((body.hasClass('page-sidebar-hover-on') === false || body.hasClass('page-sidebar-fixed') === false) || $(this).hasClass('page-sidebar-hovering')) {
                return;
            }

            $(this).addClass('page-sidebar-hovering');
            $(this).animate({
                width: sidebarCollapsedWidth
            }, 400, '', function () {
                $('body').addClass('page-sidebar-closed').removeClass('page-sidebar-hover-on');
                $(this).removeClass('page-sidebar-hovering');
            });
        });
    }

    // Handles sidebar toggler to close/hide the sidebar.
    var handleSidebarToggler = function () {
        var viewport = _getViewPort();
        if (($.cookie('sidebar_closed') === '1' && viewport.width >= 992) || (!$.cookie('sidebar_closed') && _themeDefaultConfig.sidebarHide)) {
            $('body').addClass('page-sidebar-closed');
            runResponsiveHandlers();
        }

        // handle sidebar show/hide
        $('.page-sidebar, .header').on('click', '.sidebar-toggler', function (e) {
        	
            var body = $('body');
            var sidebar = $('.page-sidebar');

            if ((body.hasClass("page-sidebar-hover-on") && body.hasClass('page-sidebar-fixed')) || sidebar.hasClass('page-sidebar-hovering')) {
                body.removeClass('page-sidebar-hover-on');
                sidebar.css('width', '').hide().show();
                $.cookie('sidebar_closed', '0',{ expires: 365 });
                e.stopPropagation();
                $(window).resize();
                return;
            }

           

            if (body.hasClass("page-sidebar-closed")) {
                body.removeClass("page-sidebar-closed");
                if (body.hasClass('page-sidebar-fixed')) {
                    sidebar.css('width', '');
                }
                $.cookie('sidebar_closed', '0',{ expires: 365 });
            } else {
                body.addClass("page-sidebar-closed");
                $.cookie('sidebar_closed', '1',{ expires: 365 });
            }
            runResponsiveHandlers();
           
            $(window).resize();
        });

       
    }

    // Handles the horizontal menu
    var handleHorizontalMenu = function () {
        //handle hor menu search form toggler click
        $('.header').on('click', '.hor-menu .hor-menu-search-form-toggler', function (e) {
            if ($(this).hasClass('off')) {
                $(this).removeClass('off');
                $('.header .hor-menu .search-form').hide();
            } else {
                $(this).addClass('off');
                $('.header .hor-menu .search-form').show();
            }
            e.preventDefault();
        });

        //handle hor menu search button click
        $('.header').on('click', '.hor-menu .search-form .btn', function (e) {
            $('.form-search').submit();
            e.preventDefault();
        });

        //handle hor menu search form on enter press
        $('.header').on('keypress', '.hor-menu .search-form input', function (e) {
            if (e.which == 13) {
                $('.form-search').submit();
                return false;
            }
        });
    }

    // Handles the go to top button at the footer
    var handleGoTop = function () {
    	 $.scrollUp({
    	        scrollName: 'scrollUp', // Element ID
    	        topDistance: '300', // Distance from top before showing element (px)
    	        topSpeed: 300, // Speed back to top (ms)
    	        animation: 'fade', // Fade, slide, none
    	        animationInSpeed: 200, // Animation in speed (ms)
    	        animationOutSpeed: 200, // Animation out speed (ms)
    	        scrollText: '', // Text for element
    	        activeOverlay: false  // Set CSS color to display scrollUp active point, e.g '#00FFFF'
    	  });
    }
    
   


    // Handles portlet tools & actions
    var handlePortletTools = function () {
        

        jQuery('body').on('click', '.portlet > .portlet-title > .tools > a.reload', function (e) {
            e.preventDefault();
            var el = jQuery(this).closest(".portlet").children(".portlet-body");
            App.blockUI(el);
            App.unblockUI(el);
        });

        jQuery('body').on('click', '.portlet > .portlet-title > .tools > .collapse, .portlet .portlet-title > .tools > .expand', function (e) {
            e.preventDefault();
            var el = jQuery(this).closest(".portlet").children(".portlet-body");
            if (jQuery(this).hasClass("collapse")) {
                jQuery(this).removeClass("collapse").addClass("expand");
                el.slideUp(200);
            } else {
                jQuery(this).removeClass("expand").addClass("collapse");
                el.slideDown(200);
            }
        });
    }

    // Handles custom checkboxes & radios using jQuery Uniform plugin
    var handleUniform = function () {
        if (!jQuery().uniform) {
            return;
        }
        var test = $("input[type=checkbox]:not(.toggle), input[type=radio]:not(.toggle, .star)");
        if (test.size() > 0) {
            test.each(function () {
                if ($(this).parents(".checker").size() == 0) {
                    $(this).show();
                    $(this).uniform();
                }
            });
        }
    }

    // Handles Bootstrap Accordions.
    var handleAccordions = function () {
        var lastClicked;
        //add scrollable class name if you need scrollable panes
        jQuery('body').on('click', '.accordion.scrollable .accordion-toggle', function () {
            lastClicked = jQuery(this);
        }); //move to faq section

        jQuery('body').on('show.bs.collapse', '.accordion.scrollable', function () {
            jQuery('html,body').animate({
                scrollTop: lastClicked.offset().top - 150
            }, 'slow');
        });
    }

    // Handles Bootstrap Tabs.
    var handleTabs = function () {
        // fix content height on tab click
        $('body').on('shown.bs.tab', '.nav.nav-tabs', function () {
            handleSidebarAndContentHeight();
        });

        //activate tab if tab id provided in the URL
        if (location.hash) {
            var tabid = location.hash.substr(1);
            $('a[href="#' + tabid + '"]').parents('.tab-pane:hidden').each(function(){
                var tabid = $(this).attr("id");
                $('a[href="#' + tabid + '"]').click();    
            });            
            $('a[href="#' + tabid + '"]').click();
        }
    }

    // Handles Bootstrap Modals.
    var handleModals = function () {
        // fix stackable modal issue: when 2 or more modals opened, closing one of modal will remove .modal-open class. 
//        $('body').on('hide.bs.modal', function () {
//           if ($('.modal:visible').size() > 1 && $('html').hasClass('modal-open') == false) {
//              $('html').addClass('modal-open');
//           } else if ($('.modal:visible').size() <= 1) {
//              $('html').removeClass('modal-open');
//           }
//        });
            
//        $('body').on('show.bs.modal', '.modal', function () {
//            if ($(this).hasClass("modal-scroll")) {
//                $('body').addClass("modal-open-noscroll");
//            } 
//        });

//        $('body').on('hide.bs.modal', '.modal', function () {
////        	 alert($('.modal:visible').size());
//        	 if ($('.modal:visible').size() <= 1) {
////        		 alert(2);
//            	 $('body').removeClass("modal-open-noscroll");
//             }
//        });
    	
    	
//        $.fn.modal.defaults.spinner = $.fn.modalmanager.defaults.spinner = 
//            '<div class="loading-spinner" style="width: 200px; margin-left: -100px;">' +
//              '<div class="progress progress-striped active">' +
//                '<div class="progress-bar" style="width: 100%;"></div>' +
//              '</div>' +
//            '</div>';
//
//         $.fn.modalmanager.defaults.resize = true;
    }

    // Handles Bootstrap Tooltips.
    var handleTooltips = function () {
    	jQuery('.tooltips').tooltip();
    }

    // Handles Bootstrap Dropdowns
    var handleDropdowns = function () {
        /*
          For touch supported devices disable the 
          hoverable dropdowns - data-hover="dropdown"  
        */
        if (App.isTouchDevice()) {
            $('[data-hover="dropdown"]').each(function(){
                $(this).parent().off("hover");
                $(this).off("hover");
            });
        }
        /*
          Hold dropdown on click  
        */
        $('body').on('click', '.dropdown-menu.hold-on-click', function (e) {
            e.stopPropagation();
        });
    }

    // Handle Hower Dropdowns
    var handleDropdownHover = function () {
        $('[data-hover="dropdown"]').dropdownHover();
    }

    var handleAlerts = function () {
        $('body').on('click', '[data-close="alert"]', function(e){
            $(this).parent('.alert').hide();
            e.preventDefault();
        });
    }

    // Handles Bootstrap Popovers

    // last popep popover
    var lastPopedPopover;

    var handlePopovers = function () {
        jQuery('.popovers').popover();

        // close last poped popover

        $(document).on('click.bs.popover.data-api', function (e) {
            if (lastPopedPopover) {
                lastPopedPopover.popover('hide');
            }
        });
    }

    // Handles scrollable contents using jQuery SlimScroll plugin.
    var handleScrollers = function () {
        $('.scroller').each(function () {
            var height;
            if ($(this).attr("data-height")) {
                height = $(this).attr("data-height");
            } else {
                height = $(this).css('height');
            }
            $(this).slimScroll({
                size: '7px',
                color: ($(this).attr("data-handle-color")  ? $(this).attr("data-handle-color") : '#a1b2bd'),
                railColor: ($(this).attr("data-rail-color")  ? $(this).attr("data-rail-color") : '#333'),
                position: isRTL ? 'left' : 'right',
                height: height,
                alwaysVisible: ($(this).attr("data-always-visible") == "1" ? true : false),
                railVisible: ($(this).attr("data-rail-visible") == "1" ? true : false),
                disableFadeOut: true
            });
        });
    }

    // Handles Image Preview using jQuery Fancybox plugin
    var handleFancybox = function () {
        if (!jQuery.fancybox) {
            return;
        }

        if (jQuery(".fancybox-button").size() > 0) {
            jQuery(".fancybox-button").fancybox({
                groupAttr: 'data-rel',
                prevEffect: 'none',
                nextEffect: 'none',
                closeBtn: true,
                helpers: {
                    title: {
                        type: 'inside'
                    }
                }
            });
        }
    }

    // Fix input placeholder issue for IE8 and IE9
    var handleFixInputPlaceholderForIE = function () {
        //fix html5 placeholder attribute for ie7 & ie8
        if (isIE8 || isIE9) { // ie8 & ie9
            // this is html5 placeholder fix for inputs, inputs with placeholder-no-fix class will be skipped(e.g: we need this for password fields)
            jQuery('input[placeholder]:not(.placeholder-no-fix), textarea[placeholder]:not(.placeholder-no-fix)').each(function () {

                var input = jQuery(this);

                if (input.val() == '' && input.attr("placeholder") != '') {
                    input.addClass("placeholder").val(input.attr('placeholder'));
                }

                input.focus(function () {
                    if (input.val() == input.attr('placeholder')) {
                        input.val('');
                    }
                });

                input.blur(function () {
                    if (input.val() == '' || input.val() == input.attr('placeholder')) {
                        input.val(input.attr('placeholder'));
                    }
                });
            });
        }
    }

    // Handle full screen mode toggle
    var handleFullScreenMode = function() {
        // mozfullscreenerror event handler
       
        // toggle full screen
        function toggleFullScreen() {
          if (!document.fullscreenElement &&    // alternative standard method
              !document.mozFullScreenElement && !document.webkitFullscreenElement) {  // current working methods
            if (document.documentElement.requestFullscreen) {
              document.documentElement.requestFullscreen();
            } else if (document.documentElement.mozRequestFullScreen) {
              document.documentElement.mozRequestFullScreen();
            } else if (document.documentElement.webkitRequestFullscreen) {
              document.documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
            }
            $.cookie('fullscreen','1',{ expires: 365 });
          } else {
            if (document.cancelFullScreen) {
              document.cancelFullScreen();
            } else if (document.mozCancelFullScreen) {
              document.mozCancelFullScreen();
            } else if (document.webkitCancelFullScreen) {
              document.webkitCancelFullScreen();
            }
            $.cookie('fullscreen','0',{ expires: 365 });
          }
        }

        $('#trigger_fullscreen').click(function() {
            toggleFullScreen();
        });
        if(($.cookie('fullscreen') && $.cookie('fullscreen')=='1')|| !$.cookie('fullscreen') && (_themeDefaultConfig.fullscreen)){
        	
//        	bootbox.confirm("是否全屏显示？",function(result){
//        		if(result){
//        			toggleFullScreen();
//        		}else{
//        			$.cookie('fullscreen','0',{ expires: 365 });
//        		}
//        	});
        	
        	 bootbox.dialog({
                 message: "是否全屏显示？",
                 title: "系统消息",
                 buttons: {
                   danger: {
                     label: "不,谢谢",
                     className: "red",
                     callback: function() {
                    	 $.cookie('fullscreen','0',{ expires: 365 });
                     }
                   },
                   main: {
                     label: "全屏显示",
                     className: "blue",
                     callback: function() {
                    	 toggleFullScreen();
                     }
                   }
                 }
             });
        }
    }
    // Handle logout
    var handleLogout = function() {
    	// mozfullscreenerror event handler
    	
    	// toggle full screen
    	function logout() {
    		
    		bootbox.confirm("确认要退出系统吗?", function(result) {
    			if(result){
    				window.location.href=_GLOBAL.ctx+"/j_spring_security_logout";
    			}
             });
    	}
    	
    	$('#trigger_logout').click(function() {
    		logout();
    	});
    }

    // Handle Select2 Dropdowns
    var handleSelect2 = function() {
        if (jQuery().select2) {
        	try {
        		$('.select2me').select2({
        			placeholder: "请选择",
        			allowClear: true
        		});
			} catch (e) {
			}
        }
    }
    
 
    
    // Handle Theme Settings
    var handleTheme = function () {

        var panel = $('.theme-panel');
        if ($.cookie('layout-option')) {
        	$('.layout-option', panel).val($.cookie('layout-option'));
        }else{
        	if ($('body').hasClass('page-boxed') == false) {
        		$('.layout-option', panel).val(_themeDefaultConfig.layout);
        	}
        }
        if ($.cookie('sidebar-option')) {
        	$('.sidebar-option', panel).val($.cookie('sidebar-option'));
        }else{
        	$('.sidebar-option', panel).val(_themeDefaultConfig.sidebar);
        }
        if ($.cookie('footer-option')) {
        	$('.footer-option', panel).val($.cookie('footer-option'));
        }else{
        	$('.footer-option', panel).val(_themeDefaultConfig.footer);
        }
        if ($.cookie('header-option')) {
        	$('.header-option', panel).val($.cookie('header-option'));
        }else{
        	$('.header-option', panel).val(_themeDefaultConfig.header);
        }
        


        //handle theme layout
        var resetLayout = function () {
            $("body").
            removeClass("page-boxed").
            removeClass("page-footer-fixed").
            removeClass("page-sidebar-fixed").
            removeClass("page-header-fixed");

            $('.header > .header-inner').removeClass("container");

            if ($('.page-container').parent(".container").size() === 1) {
                $('.page-container').insertAfter('body > .clearfix');
            }

            if ($('.footer > .container').size() === 1) {
                $('.footer').html($('.footer > .container').html());
            } else if ($('.footer').parent(".container").size() === 1) {
                $('.footer').insertAfter('.page-container');
            }

            $('body > .container').remove();
        }

        var lastSelectedLayout = '';

        var setLayout = function () {

            var layoutOption = $('.layout-option', panel).val();
            var sidebarOption = $('.sidebar-option', panel).val();
            var headerOption = $('.header-option', panel).val();
            var footerOption = $('.footer-option', panel).val();
            
            $.cookie('layout-option',layoutOption,{ expires: 365 });
            $.cookie('sidebar-option',sidebarOption,{ expires: 365 });
            $.cookie('header-option',headerOption,{ expires: 365 });
            $.cookie('footer-option',footerOption,{ expires: 365 });
            
            if (sidebarOption == "fixed" && headerOption == "default") {
                bootbox.alert('默认 的页眉 和  固定的功能菜单不能同时设定. ');
                $('.header-option', panel).val("fixed");
                $('.sidebar-option', panel).val("fixed");
                sidebarOption = 'fixed';
                headerOption = 'fixed';
            }

            resetLayout(); // reset layout to default state

            if (layoutOption === "boxed") {
                $("body").addClass("page-boxed");

                // set header
                $('.header > .header-inner').addClass("container");
                var cont = $('body > .clearfix').after('<div class="container"></div>');

                // set content
                $('.page-container').appendTo('body > .container');

                // set footer
                if (footerOption === 'fixed') {
                    $('.footer').html('<div class="container">' + $('.footer').html() + '</div>');
                } else {
                    $('.footer').appendTo('body > .container');
                }
            }

            if (lastSelectedLayout != layoutOption) {
                //layout changed, run responsive handler:
                runResponsiveHandlers();
            }
            lastSelectedLayout = layoutOption;

            //header
            if (headerOption === 'fixed') {
                $("body").addClass("page-header-fixed");
                $(".header").removeClass("navbar-static-top").addClass("navbar-fixed-top");
            } else {
                $("body").removeClass("page-header-fixed");
                $(".header").removeClass("navbar-fixed-top").addClass("navbar-static-top");
            }

            //sidebar
            if (sidebarOption === 'fixed') {
                $("body").addClass("page-sidebar-fixed");
            } else {
                $("body").removeClass("page-sidebar-fixed");
            }

            //footer 
            if (footerOption === 'fixed') {
                $("body").addClass("page-footer-fixed");
            } else {
                $("body").removeClass("page-footer-fixed");
            }

            handleSidebarAndContentHeight(); // fix content height            
            handleFixedSidebar(); // reinitialize fixed sidebar
            handleFixedSidebarHoverable(); // reinitialize fixed sidebar hover effect
        }

        // handle theme colors
        var setColor = function (color) {
            $('#style_color').attr("href", _GLOBAL.ctx+"/assets/css/themes/" + color + ".css");
           
            $.cookie('style_color', color,{ expires: 365 });
        }

        $('.toggler', panel).click(function () {
            $('.toggler').hide();
            $('.toggler-close').show();
            $('.theme-panel > .theme-options').show();
        });

        $('.toggler-close', panel).click(function () {
            $('.toggler').show();
            $('.toggler-close').hide();
            $('.theme-panel > .theme-options').hide();
        });

        $('.theme-colors > ul > li', panel).click(function () {
            var color = $(this).attr("data-style");
            setColor(color);
            $('ul > li', panel).removeClass("current");
            $(this).addClass("current");
        });

        $('.layout-option, .header-option, .sidebar-option, .footer-option', panel).change(setLayout);

        if ($.cookie('style_color')) {
        	setColor($.cookie('style_color'));
        }else{
        	setColor(_themeDefaultConfig.color)
        }
        
        setLayout();
    }

    
    
    
    var handleDatePickers = function () {

        if (jQuery().datepicker) {
        	
            $('.date-picker').datepicker({
                rtl: App.isRTL(),
                autoclose: true
            });
            $('.form_date').datepicker({
            	rtl: App.isRTL(),
            	autoclose: true
            });
            $(".form_datetime").datetimepicker({
                autoclose: true,
                isRTL: App.isRTL(),
//                format: "dd MM yyyy - hh:ii",
                pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left")
            });

            $(".form_advance_datetime").datetimepicker({
                isRTL: App.isRTL(),
//                format: "dd MM yyyy - hh:ii",
                autoclose: true,
                todayBtn: true,
//                startDate: "2013-02-14 10:00",
                pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left"),
                minuteStep: 10
            });

            $(".form_meridian_datetime").datetimepicker({
                isRTL: App.isRTL(),
//                format: "dd MM yyyy - HH:ii P",
                showMeridian: true,
                autoclose: true,
                pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left"),
                todayBtn: true
            });
//            $('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
        }
    }

    var handleTimePickers = function () {

        if (jQuery().timepicker) {
            $('.timepicker-default').timepicker({
                autoclose: true
            });
            $('.timepicker-24').timepicker({
                autoclose: true,
                minuteStep: 1,
                showSeconds: true,
                showMeridian: false
            });
        }
    }
    
    
    
    /**
     *  按钮触发事件响应数据的处理类型(data-handler)
     *  "INLINE":用返回的html内容替换当前的portlet
     *  "MESSAGE":返回简单的结果信息{content:''}
     *  "CONFIRM" 确认
     *  "MODAL":将返回的html以modal 的形式展示
     *  
     */
    var handleDataHandler = function(){
    	handleMenu4INLINE(" [data-handler='INLINE']");
    	handleMenu4MESSAGE(" [data-handler='MESSAGE']");
    	handleMenu4CONFIRM(" [data-handler='CONFIRM']");
    	handleMenu4MODAL(" [data-handler='MODAL']");
    }
    
    
    // 获取列表中选中的行的值集合
    var _getDataSetValues=function(dataSet){
    	var data = {};
    	if(dataSet){
    		var values = [];
    		$(dataSet).each(function () {
                if($(this).attr("checked")) {
                	values.push($(this).val());
                } 
            });
    		if(values.length<=0){
    			bootbox.alert("请选择数据进行该操作！");
    			return false;
    		}
    		var valuesStr = values.toString();
    		data[_dataSetName] = valuesStr;
    	}
    	return data;
    }
    
    var handleMenu4INLINE = function (selector) {
    	 
    	 $(selector).unbind("click");
	   	 $(selector).on('click',function(e){
	   		 e.preventDefault();
	   		 var $portA = $(this).parents('.portlet');
	   		 
	   		 var $portAParent = $portA.parent();
	   		 var url = $(this).attr('href');
	   		 var title = $(this).attr('data-title');
	   		 var form = $(this).attr('data-form');
	   		 var dataSet =  $(this).attr('data-set');
	   		 var picon =  $(this).attr('portlet-icon');
	   		 picon= picon?picon:'fa fa-edit';
	   		 var data = _getDataSetValues(dataSet);
	   		 if(!data){
	   			 return;
	   		 }
	   		App.blockUI($portAParent, false);
	   		 //加载下一个portlet
	   		 $portA.animate({right: '+200%',opacity: 'toggle'},'nomal','swing',function(){
//		   			 App.blockUI($portAParent, false);
		   			 $.ajax({
		   				 type: "post",
		   				 cache: false,
		   				 url: url,
		   				 data:data,
		   				 dataType: "html",
		   				 success: function (res) {
		   				    App.unblockUI($portAParent);
		   					 
		   					var tmpl = res;
		   					 if(title){
		   						tmpl = [
		   									'<div class="portlet box grey">',
		   									'<div class="portlet-title">',
		   									'<div class="caption"><i class="'+picon+'"></i>'+title+'</div>',
		   									'<div class="tools">',
		   									'<a href="javascript:;" class="collapse"></a>',
		   									'<a href="javascript:;" class="remove"></a>',
		   									'</div>',
		   									'</div>',
		   									'<div class="portlet-body '+(form?'form':'')+'">',
		   										res,
		   									'</div>',
		   									'</div>'

		   					              ].join('');
		   					 }
		   					 
		   					 $portA.after(tmpl);
		   					 App.fixContentHeight(); // fix content height
		   					 App.initAjax(); // initialize core stuff
		   					 
		   					 // 管理返回按钮 
		   					 var $portB = $portA.next();
		   					 var $backMenu = $portB.find('.portlet-title > .tools > a.remove');
		   					 var fnback = function(e){
		   						 
		   						 e.preventDefault();
		   						 
		   						 $portB.hide('fast','swing',function(){
		   							 $portB.empty();
		   							 $portB.remove();
		   							 $portA.animate({right: '+0%',opacity: 'toggle'},'fast','swing',function(){
		   								 // 刷新 portlet
		   								 $portA.find('.portlet-title > .tools > a.reload').click();
		   							 });
		   						 });
		   					 }
		   					 $backMenu.unbind();
		   					 $backMenu.on('click',fnback);
			   				 var $backMenu2 = $portB.find('button.remove');
			   				
			   				 if($backMenu2){
			   					$backMenu2.on('click',fnback);
			   				 }
		   					 
		   				 },
		   				 error: function (xhr, ajaxOptions, thrownError) {
		   					App.unblockUI($portAParent);
		   					 $portAParent.html('<h4>无法加载请求页面.</h4><br/>请尝试<a href="javascript:location.reload();">刷新页面</a>以解决该问题.');
//		   					 App.unblockUI($portAParent);
		   				 },
		   				 async: true
		   			 });
	   		 });
	   		 
	   	 })
    }
    var handleMenu4MODAL = function (selector) {
    		$(selector).unbind("click");
    		$(selector).on('click',function(e){
	    		e.preventDefault();
	    		_GLOBAL.lastHandler=$(this);
	    		var $portA = $(this).parents('.portlet');
	    		var url = $(this).attr('href');
		   		 var dataSet =  $(this).attr('data-set');
		   		
	    		var modal = openModal({
	    			url:url,
	    			simple:$(this).attr('modal-simple'),
	    			title:$(this).attr('data-title'),
	    			size:$(this).attr('modal-size'),
	    			dataSet:dataSet
	    			});
    			
    		})
    }
    var handleMenu4MESSAGE = function (selector) {
    	$(selector).unbind("click");
    	$(selector).on('click',function(e){
    		e.preventDefault();
    		
    		
    		var size = $(this).attr('modal-size')?$(this).attr('modal-size'):'400';
			var title = $(this).attr('data-title')?$(this).attr('data-title'):'By System.';
			var content = $(this).attr('data-content')?$(this).attr('data-content'):'';
			var icon = $(this).attr('modal-icon')?$(this).attr('modal-icon'):'fa-smile-o';
			var color = $(this).attr('modal-color')?$(this).attr('modal-color'):'blue';
    		var tmpl = [
		            '<div class="modal fade " tabindex="-1" data-width="'+size+'" data-replace="false">',
		            '<div class="dashboard-stat '+color+'">',
			        	'<div class="visual">',
			        		'<i class="fa '+icon+'"></i>',
			        	'</div>',
			        	'<div class="details">',
			        		'<div class="number">'+content+'</div>',
			        		'<div class="desc">'+title+'</div>',
			        	'</div>',
		        	'</div>',
		            '</div>'
		            ].join('');
    		$(tmpl).modal().on('hidden.bs.modal', function (e) {
		    	 // do something...
		    	 $(this).empty();
			})
    	})
    }
    
    var openModal = function(opt){
    	
    	 var data = _getDataSetValues(opt.dataSet);
    	 if(!data){
   			 return;
   		 }
    	 $.ajax({
				 type: "post",
				 cache: false,
				 url: opt.url,
				 dataType: "html",
				 data:data,
				 success: function (res) {
					 // general settings
					var size = opt.size?opt.size:'75%';
					var title = opt.title?opt.title:'';
		            var tmpl;
		            if(opt.simple){
		            	tmpl = [
		            	        // data-replace 为true时 表示替换已经打开的modal，为false时表示新打开一个modal
					            '<div class="modal fade " tabindex="-1" data-width="'+size+'" data-replace="false">',
					            res,
					            '</div>'
					            
					            ].join('');
		            }else{
		            	 tmpl = [
									'<div class="modal  fade " tabindex="-1" data-replace="false" data-width="'+size+'" >',
									'<div class="modal-header">',
									'<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>',
									title?'<h4 class="modal-title">'+title+'</h4>':'',
										'</div>',
										'<div class="modal-body">',
										res,
										'</div>',
									'</div>'

					              ].join('');
		            }
					
					
		            
		            var modal = $(tmpl).modal();
		            modal.on('hidden.bs.modal', function (e) {
				    	 
				    	 // do something...
//				    	 if ($('.modal:visible').size() <= 0) {
//			            	 $('body').removeClass('modal-open-noscroll');
//			             }
				    	 $(this).empty();
					});
//				    	 if ($('.modal:visible').size() == 0) {
//				    		 $('body').addClass('modal-open-noscroll');
//				    	 } 
				    _GLOBAL.lastModal= modal; 
		            
					 App.initAjax();
				 },
				 error: function (xhr, ajaxOptions, thrownError) {
					bootbox.alert("操作失败，请尝试刷新页面以解决该问题。");
				 },
				 async: true
			 });
    	
    }
    var handleMenu4CONFIRM = function (selector) {
    	$(selector).unbind("click");
    	$(selector).on('click',function(e){
    		e.preventDefault();
    		var $portA = $(this).parents('.portlet');
    		var url = $(this).attr('href');
    		 var dataSet =  $(this).attr('data-set');
    		 var dataTitle =  $(this).attr('data-title');
    		 var data = _getDataSetValues(dataSet);
    		 if(!data){
    			 return;
    		 }
    		//加载下一个portlet
    		bootbox.confirm(dataTitle?dataTitle:'确定要执行此操作吗？',function(result){
    			if(result){
    				$.ajax({
    					type: "post",
    					cache: false,
    					url: url,
    					data:data,
    					dataType: "json",
    					success: function (res) {
//		   					 bootbox.alert(res.message);
//    						console.log(res);
    						toastr[res.type?res.type:'info'](res.message, '系统消息'); 
    						
    						$portA.find('.portlet-title > .tools > a.reload').click();
    					},
    					error: function (xhr, ajaxOptions, thrownError) {
    						bootbox.alert("操作失败，请尝试刷新页面以解决该问题。");
    					},
    					async: false
    				});
    			}
    		})
    	})
    }
    	
    var handleToastr = function(){
    	if(toastr){
    		toastr.options = {
    				  "closeButton": true,
    				  "debug": false,
    				  "positionClass": "toast-top-right",
    				  "onclick": null,
    				  "showDuration": "1000",
    				  "hideDuration": "1000",
    				  "timeOut": "5000",
    				  "extendedTimeOut": "1000",
    				  "showEasing": "swing",
    				  "hideEasing": "linear",
    				  "showMethod": "fadeIn",
    				  "hideMethod": "fadeOut"
    				}
    	}
    }
    
    
    var handleSideBarInitState = function(){
    	 // 打开首页
		 $("#_main_page_sidebar_menu .start .ajaxify").click();
		 // 显示页面
		 setTimeout('$("html").removeClass("hideall")',50);
		 // 打开第一个菜单目录
		 if(_themeDefaultConfig.openFirstMenu){
			 setTimeout(function(){
				 $("#_main_page_sidebar_menu li:eq(2) a:eq(0)").click();
			 },500);
		 }
    }
    
   
    
    var handlePluginsConfig = function(){
    	 CustomSelect2.init(); // 初始化select2 配置
    	 // 日期控件汉化
    	 $.fn.datepicker.defaults.language = 'zh-CN'; 
    	 $.fn.datetimepicker.defaults.language = 'zh-CN'; 
    	 
    	 // highchart 报表工具
    	 Highcharts.setOptions({
    		 	credits:{//右下角的文本  
    	            enabled: false
    	        },
//    		    colors: [//'#f8b331','#8fc316','#0070cb','#f41b90',
//    					 '#4572A7', '#AA4643', '#89A54E', '#80699B', '#3D96AE',
//    		 		     '#DB843D', '#92A8CD', '#A47D7C', '#B5CA92'],
//    		 	symbols: ['circle', 'diamond', 'square', 'triangle', 'triangle-down'],
    		 	lang: {
    		 		loading: 'Loading...',
    		 		months: ['January', 'February', 'March', 'April', 'May', 'June', 'July',
    		 				'August', 'September', 'October', 'November', 'December'],
    		 		shortMonths: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    		 		weekdays: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
    		 		decimalPoint: '.',
    		 		numericSymbols: ['k', 'M', 'G', 'T', 'P', 'E'], // SI prefixes used in axis labels
    		 		resetZoom: 'Reset zoom',
    		 		resetZoomTitle: 'Reset zoom level 1:1',
    		 		thousandsSep: ','
    		 	},
    		 	global: {
    		 		useUTC: true,
    		 		canvasToolsURL: _GLOBAL.ctx+'/highcharts/js/canvas-tools.js',
    		 		VMLRadialGradientURL:  _GLOBAL.ctx+'/highcharts/gfx/vml-radial-gradient.png'
    		 	}
    	});
    }
    
    var handleIntro = function(){
    	
//    	setTimeout(function(){
//    		introJs().start();
//		},1000);
    }
    
    //* END:CORE HANDLERS *//

    return {
    	
        //main function to initiate the theme
        init: function () {
        	$.ajax({
        		url:_GLOBAL.ctx+"/sys/main/getNav",
        		success: function(data){
        			$("#_main_page_sidebar_menu").append(data);
        		},
        		dataType:"text",
        		async:false
        	});
            //IMPORTANT!!!: Do not modify the core handlers call order.

            //core handlers
            handleInit(); // initialize core variables
            handleResponsiveOnResize(); // set and handle responsive    
            handleUniform(); // hanfle custom radio & checkboxes
            handleScrollers(); // handles slim scrolling contents 
            handleResponsiveOnInit(); // handler responsive elements on page load

            //layout handlers
            handleFixedSidebar(); // handles fixed sidebar menu
            handleFixedSidebarHoverable(); // handles fixed sidebar on hover effect 
            handleSidebarMenu(); // handles main menu
            handleHorizontalMenu(); // handles horizontal menu
            handleSidebarToggler(); // handles sidebar hide/show            
            handleFixInputPlaceholderForIE(); // fixes/enables html5 placeholder attribute for IE9, IE8
            handleGoTop(); //handles scroll to top functionality in the footer
            handleTheme(); // handles style customer tool
     
            //ui component handlers
            handleFancybox() // handle fancy box
            handleSelect2(); // handle custom Select2 dropdowns
            handlePortletTools(); // handles portlet action bar functionality(refresh, configure, toggle, remove)
            handleAlerts(); //handle closabled alerts
            handleDropdowns(); // handle dropdowns
            handleTabs(); // handle tabs
            handleTooltips(); // handle bootstrap tooltips
            handlePopovers(); // handles bootstrap popovers
            handleAccordions(); //handles accordions 
            handleModals(); // handle modals
            handleFullScreenMode(); // handles full screen
            handleLogout(); // handles logout
            handleToastr();
            
            
            
            
            handleSideBarInitState(); // 打开首页  显示整个页面  展开第一个菜单目录 
            handlePluginsConfig(); // 初始化插件配置
            
            handleIntro();// 介绍初始化
            
        },

        //main function to initiate core javascript after ajax complete
        initAjax: function () {
        	 //IMPORTANT!!!: Do not modify the core handlers call order.

            //core handlers
            
        	handleUniform(); // hanfle custom radio & checkboxes     
            
            handleSelect2(); // handle custom Select2 dropdowns
            handleDropdowns(); // handle dropdowns
            handleTooltips(); // handle bootstrap tooltips
            handlePopovers(); // handles bootstrap popovers
            handleAccordions(); //handles accordions 
            handleModals(); // handle modals
            handleDropdownHover(); // handles dropdown hover  
            
            handleDatePickers();
            handleTimePickers();
            
            handleDataHandler(); // 初始化数据超链接（点击超链接响应事件-打开模态窗口、 切换portlet 、确认提交 、弹出消息框）
        },
        openModal:openModal,
        //public function to fix the sidebar and content height accordingly
        fixContentHeight: function () {
            handleSidebarAndContentHeight();
        },

        //public function to remember last opened popover that needs to be closed on click
        setLastPopedPopover: function (el) {
            lastPopedPopover = el;
        },

        //public function to add callback a function which will be called on window resize
        addResponsiveHandler: function (func) {
            responsiveHandlers.push(func);
        },

        // useful function to make equal height for contacts stand side by side
        setEqualHeight: function (els) {
            var tallestEl = 0;
            els = jQuery(els);
            els.each(function () {
                var currentHeight = $(this).height();
                if (currentHeight > tallestEl) {
                    tallestColumn = currentHeight;
                }
            });
            els.height(tallestEl);
        },

        // wrapper function to scroll(focus) to an element
        scrollTo: function (el, offeset) {
            pos = (el && el.size() > 0) ? el.offset().top : 0;
            jQuery('html,body').animate({
                scrollTop: pos + (offeset ? offeset : 0)
            }, 'slow');
        },

        // function to scroll to the top
        scrollTop: function () {
            App.scrollTo();
        },

        // wrapper function to  block element(indicate loading)
        blockUI: function (el, centerY) {
            var el = jQuery(el);
            if (el.height() <= 400) {
                centerY = true;
            }
            el.block({
                message: '<img src="'+_GLOBAL.ctx+'/assets/img/ajax-loading.gif" align="">',
                centerY: centerY != undefined ? centerY : true,
                css: {
                    top: '10%',
                    border: 'none',
                    padding: '2px',
                    backgroundColor: 'none'
                },
                overlayCSS: {
                    backgroundColor: '#000',
                    opacity: 0.05,
                    cursor: 'wait'
                }
            });
        },

        // wrapper function to  un-block element(finish loading)
        unblockUI: function (el, clean) {
            jQuery(el).unblock({
                onUnblock: function () {
                    jQuery(el).css('position', '');
                    jQuery(el).css('zoom', '');
                }
            });
        },

        // initializes uniform elements
        initUniform: function (els) {
            if (els) {
                jQuery(els).each(function () {
                    if ($(this).parents(".checker").size() == 0) {
                        $(this).show();
                        $(this).uniform();
                    }
                });
            } else {
                handleUniform();
            }
        },

        //wrapper function to update/sync jquery uniform checkbox & radios
        updateUniform: function (els) {
            $.uniform.update(els); // update the uniform checkbox & radios UI after the actual input control state changed
        },

        //public function to initialize the fancybox plugin
        initFancybox: function () {
            handleFancybox();
        },

        //public helper function to get actual input value(used in IE9 and IE8 due to placeholder attribute not supported)
        getActualVal: function (el) {
            var el = jQuery(el);
            if (el.val() === el.attr("placeholder")) {
                return "";
            }
            return el.val();
        },

        //public function to get a paremeter by name from URL
        getURLParameter: function (paramName) {
            var searchString = window.location.search.substring(1),
                i, val, params = searchString.split("&");

            for (i = 0; i < params.length; i++) {
                val = params[i].split("=");
                if (val[0] == paramName) {
                    return unescape(val[1]);
                }
            }
            return null;
        },

        // check for device touch support
        isTouchDevice: function () {
            try {
                document.createEvent("TouchEvent");
                return true;
            } catch (e) {
                return false;
            }
        },

        // check IE8 mode
        isIE8: function () {
            return isIE8;
        },

        // check IE9 mode
        isIE9: function () {
            return isIE9;
        },

        //check RTL mode
        isRTL: function () {
            return isRTL;
        },
        
      
        // get layout color code by color name
        getLayoutColorCode: function (name) {
            if (layoutColorCodes[name]) {
                return layoutColorCodes[name];
            } else {
                return '';
            }
        }

    };

}();