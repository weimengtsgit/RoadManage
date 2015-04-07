/**
自定义select2 的 formatResult
**/
var CustomSelect2 = function () {

    // private functions & variables

    var config = function() {
       if(Select2Ex){
    	   // 
    	   Select2Ex.setFormatResult({
    		   mall_messageTemplate:function(m){
   				var markup = [
   				           "<table class='movie-result'>",
			 					"<tr><td valign='top'>",
			 				  	"<h5>" + m.name + "</h5>",
			 				  	"<div class='movie-synopsis'>" + m.content + "</div>",
			 					"</td></tr>",
								"</table>"
      			 					].join('');
      			 
      			 return markup;
   			},
   			mall_shop:function(m){
   				var markup = [
   				              "<table class='movie-result'>",
   				              "<tr><td valign='top'>",
   				              "<h5>" + m.name + "</h5>",
   				              "<div class='movie-synopsis'>" + m.intro + "</div>",
   				              "</td></tr>",
   				              "</table>"
   				              ].join('');
   				
   				return markup;
   			},
   			mall_apDevice:function(m){
   				var markup = [
   				              "<table class='movie-result'>",
   				              "<tr><td valign='top'>",
   				              "<h5>" + m.mac + "</h5>",
   				              "<div class='movie-synopsis'>" + m.description + "</div>",
   				              "</td></tr>",
   				              "<tr><td>",
   				              "位置:"+m.location,
   				              "</td></tr>",
   				              "</table>"
   				              ].join('');
   				
   				return markup;
   			},
   			mall_mall:function(m){
   				var markup = [
   				                "<table class='movie-result'>",
      			 					"<tr><td valign='top'>",
      			 				  	"<h5>" + m.name + "</h5>",
                					"<div class='movie-synopsis'>" + m.intro + "</div>",
      			 					"</td></tr>",
      								"</table>"
      			 					].join('');
      			 
      			 return markup;
   			}
    		   
    		   
    	   });
       }
    }	

    // public functions
    return {

        //main function
        init: function () {
        	config();           
        }
    };

}();
