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
		if($(isAllIp).val() == 2){  //显示
			$('#'+ipdl+'').attr("style", "display:inline;");
			$('#'+ip+'').attr("class", "ipOrPara required");
		}else{  //不显示
			$('#'+ipdl+'').attr("style", "display:none;");
			$('#'+ip+'').attr("class", "ipOrPara");
			$('#'+ip+'').val("");
		}
	},
	isAllTime:function(isAllTime, startTimedl, endTimedl, startTime, endTime){
		if($(isAllTime).val() == 2){  //显示
			$('#'+startTimedl+'').attr("style", "display:inline;");
			$('#'+endTimedl+'').attr("style", "display:inline;");
		}else{  //不显示
			$('#'+startTimedl+'').attr("style", "display:none;");
			$('#'+startTime+'').val("");
			$('#'+endTimedl+'').attr("style", "display:none;");
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
	}
}
