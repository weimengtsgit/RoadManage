/**
 * @author ZhangHuihua@msn.com
 * 
 */

var SLAVEJS = {
	
	getLoopupJson : function(action){
		$.getJSON(action, function(data){
			$.bringBack(data);
	  	});
	} ,
	submitPageForm: function(btn){
		var finder = $("input", $(btn)).filter(".hiddenItem");
		finder.each(function(){
			$(this).val("");
		});
		return true;
	},
	isAllIp:function(isAllIp,ipdl, ip){
		var dl = $('#'+ipdl+'');
		if($(isAllIp).val() == 2){  //显示
			dl.show();
			$('#'+ip+'').attr("class", "ipOrPara required");
		}else{  //不显示
			dl.hide();
			$('#'+ip+'').attr("class", "ipOrPara");
			$('#'+ip+'').val("");
		}
	},
	isAllTime:function(isAllTime, startTimedl, endTimedl, startTime, endTime){
		var startdl = $('#'+startTimedl+'');
		var enddl = $('#'+endTimedl+'');
		if($(isAllTime).val() == 2){  //显示
			startdl.show();
			enddl.show();
		}else{  //不显示
			startdl.hide();
			enddl.hide();
			$('#'+startTime+'').val("");
			$('#'+endTime+'').val("");
		}
	},
	changeProtocolType : function changeProtocolType(obj){
		var target = $(obj).parents('dl').next();
		if($(obj).val() == 'SSL'){
			target.attr("style", "");
		}else{
			target.attr("style", "display:none;");
		}
	},
	checkvalue:function(){
		
	}
};
