jQuery.extend(jQuery.validator.messages, {
	required : "该字段不能为空",
	ipv4 : "请输入有效的IPV4地址，例如:192.168.1.1",
	remote : "请修正该字段",
	email : "请输入正确格式的电子邮件",
	url : "请输入合法的网址",
	date : "请输入合法的日期",
	dateISO : "请输入合法的日期 (ISO).",
	number : "请输入合法的数字",
	digits : "只能输入整数",
	creditcard : "请输入合法的信用卡号",
	equalTo : "请再次输入相同的值",
	accept : "请输入拥有合法后缀名的字符串",
	maxlength : jQuery.validator.format("请输入一个长度最多是 {0} 的字符串"),
	minlength : jQuery.validator.format("请输入一个长度最少是 {0} 的字符串"),
	rangelength : jQuery.validator.format("请输入一个长度介于 {0} 和 {1} 之间的字符串"),
	range : jQuery.validator.format("请输入一个介于 {0} 和 {1} 之间的值"),
	max : jQuery.validator.format("请输入一个最大为 {0} 的值"),
	min : jQuery.validator.format("请输入一个最小为 {0} 的值")
});

jQuery.extend(jQuery.validator.defaults, {
	uxMsgType:'tooltip', //tooltip | popup
	ignore : "",
	focusInvalid : true,
	highlight : function(element) {
		$(element).closest('.form-group').addClass('has-error');
	},
	uxPopupMsg:function(element,msg){
		if(msg){
			$(element).popover({
				trigger : 'hover',
				html : true,
				content : msg,
				placement : 'auto'

			});
		}else{
			$(element).popover('destroy');
		}
	},
	uxTooltipMsg:function(element,msg){
		if(msg){
			$(element).tooltip({
				title : msg
			});
		}else{
			$(element).tooltip('destroy');
		}
	},
	uxShowMsg:function(element,msg){
		if(jQuery.validator.defaults.uxMsgType=='tooltip'){
			
			jQuery.validator.defaults.uxTooltipMsg(element,msg);
		}else{
			jQuery.validator.defaults.uxPopupMsg(element,msg);
		}
	},
	uxHideMsg:function(element){
		if(jQuery.validator.defaults.uxMsgType=='tooltip'){
			jQuery.validator.defaults.uxTooltipMsg(element);
		}else{
			jQuery.validator.defaults.uxPopupMsg(element);
		}
	},
	errorPlacement : function(error, element) {
		if ($(element).attr('error-target')) {
			jQuery.validator.defaults.uxShowMsg($(element).closest($(element).attr('error-target')),error[0].innerText);
		} else if ($(element).attr('type') == 'hidden') {
			jQuery.validator.defaults.uxShowMsg($(element).parent(),error[0].innerText);
		} else if ($(element).hasClass('select2me')) {
			jQuery.validator.defaults.uxShowMsg($(element).prev('div.select2-container'),error[0].innerText);
		} else {
			jQuery.validator.defaults.uxShowMsg($(element),error[0].innerText);
		}
	},
	unhighlight : function(element) {
		$(element).closest('.form-group').removeClass('has-error');
	},
	onchange: function( element, event ) {
//		console.log(element);
		if ( !this.checkable(element) && (element.name in this.submitted || !this.optional(element)) ) {
			this.element(element);
		}
	},
	success : function(element) {
//		console.log(element);
		element.closest('.form-group').removeClass('has-error');
		if ($(element).attr('error-target')) {
			jQuery.validator.defaults.uxShowMsg($(element).closest($(element).attr('error-target')));
		} else if ($(element).attr('type') == 'hidden') {
			jQuery.validator.defaults.uxShowMsg($(element).parent());
		} else if ($(element).hasClass('select2me')) {
			jQuery.validator.defaults.uxShowMsg($(element).prev('div.select2-container'));
		} else {
			jQuery.validator.defaults.uxShowMsg($(element));
		}
	}
});

(function() {
	var rules = [
			{
				name : "mac",
				fn : function(val, element) {
					return this.optional(element)
							|| /^([0-9a-fA-F][0-9a-fA-F]-){5}([0-9a-fA-F][0-9a-fA-F])$/
									.test(val);
				},
				msg : "请输入一个有效的mac地址"
			},
			{
				name : "ip",
				fn : function(val, element) {
					return this.optional(element)
							|| /^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$/
									.test(val);
				},
				msg : "请输入一个有效的IP地址"
			}

	];

	$.each(rules, function(index, rule) {
		jQuery.validator.addMethod(rule.name, rule.fn, rule.msg);
	});

})();
