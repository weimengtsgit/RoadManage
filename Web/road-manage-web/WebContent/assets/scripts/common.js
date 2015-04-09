
var Common = function () {

    // private functions & variables

    var myFunc = function(text) {
        alert(name);
    }
    var name="";
    // public functions
    return {
    	
    	toUpperCase1:function(str){ 
    	       var reg = /\b(\w)|\s(\w)/g; 
//    	       str = str.toLowerCase(); 
    	       return str.replace(reg,function(m){return m.toUpperCase()}) 
    	 },
        //main function
    	formatDateTime: function (data) {
    		return new Date(data).format('yyyy-MM-dd hh:mm:ss');
        },
        formatDate: function (data) {
        	return new Date(data).format('yyyy-MM-dd');
        },
        formatTime: function (data) {
        	return new Date(data).format('hh:mm:ss');
        },
        img:function(data){
        	 return '<img width="22" height="22"  src="'+_GLOBAL.imgUrlPrev+'/'+data+'" alt="" />';
        },
        star:function(data){
        	if(data){
        		var fullNum = Math.floor(data);
        		var isHalf = false;
        		if((data-fullNum)>=0.5){
        			isHalf = true;
        		}
        		var resultArray = ["<span style='color:#35aa47;'>"];
        		var i=0;
        		for(;i<fullNum;i++){
        			resultArray.push("<i class='fa fa-star'></i>");
        		}
        		if(isHalf){
        			resultArray.push("<i class='fa fa-star-half-o'></i>");
        			i++;
        		}
        		for(;i<6;i++){
        			resultArray.push("<i class='fa fa-star-o'></i>");
        		}
        		resultArray.push("</span>");
        		return resultArray.join('');
        	}else{
        		return "无";
        	}
        },
        
        
        
        iframeResize:function(iframe){

            // Check if browser is Opera or Safari(Webkit so Chrome as well)
            if ($.browser.safari || $.browser.opera) {
                    var delayedResize = function () {
                        resizeHeight(iframe);
                    };
                    setTimeout(delayedResize, 0);
                    // Safari and Opera need a kick-start.
                    var source = $(this).attr('src');
                    $(iframe).attr('src', '');
                    $(iframe).attr('src', source);
            }else {
                    resizeHeight(iframe);
            }

            // resizeHeight
            function resizeHeight(iframe) {
                // Set inline style to equal the body height of the iframed content plus a little
                var newHeight = iframe.contentWindow.document.body.offsetHeight + options.heightOffset;
                iframe.style.height = newHeight + 'px';
            }
        }
        
    };

}();