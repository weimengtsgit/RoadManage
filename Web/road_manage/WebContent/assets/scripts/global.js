
var _GLOBAL = function () {

    // private functions & variables
	var enums={};
    var intervals = {iframeInterval:null};
    var lastHandler;
    var lastModal;
    // public functions
    return {
    	ctx:"",
    	imgUrlPrev:"",
    	lastHandler:lastHandler,
    	lastModal:lastModal,
    	intervals:intervals,
    	lastMenu:null,//上一次点击的菜单
    	init :function(ctx,imgUrlPrev){
    		_GLOBAL.ctx = ctx;
    		_GLOBAL.imgUrlPrev = imgUrlPrev;
    		
    		$.getJSON(ctx+"/commons/getAllEnum", function(json){
    			  enums = json;
    		});
    		
    	},
		pushEnum : function(name,value){
			try{
				enums[name]=value;
			}catch(e){
				console.log(e);
				bootbox.alert("当前页面的某些枚举值可能显示有误。");
			}
		},
		getEnum : function(name,value){
			if(value||value=='0'){
				if(enums[name] && enums[name][value]){
					return enums[name][value];
				}else{
					return value;
				}
			}else{
				return '<span class="label label-default">无</span>';
			}
		},
		getEnums : function(name){
			return enums[name];
		}

    };

}();