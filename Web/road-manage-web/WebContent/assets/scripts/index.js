var Index = function () {
	function easyPie(){
		   $('.easy-pie-chart .number.transactions').easyPieChart({
               animate: 1000,
               size: 75,
               lineWidth: 10,
               scaleColor: false,
               barColor: App.getLayoutColorCode('yellow')
           });

           $('.easy-pie-chart .number.visits').easyPieChart({
               animate: 1000,
               size: 75,
               lineWidth: 3,
               barColor: App.getLayoutColorCode('green')
           });
            
           $('.easy-pie-chart .number.bounce').easyPieChart({
               animate: 1000,
               size: 75,
               lineWidth: 3,
               barColor: App.getLayoutColorCode('red')
           });

           $('.easy-pie-chart-reload').click(function(){
               $('.easy-pie-chart .number').each(function() {
                   var newValue = Math.floor(100*Math.random());
                   $(this).data('easyPieChart').update(newValue);
                   $('span', this).text(newValue);
               });
           });
	}
	function Percentage(num, total) { 
	    return (Math.round(num / total * 10000) / 100 );// 小数点后两位百分比
	   
	}
	function setUpNum(preId,t,y){
		if(t && y){
			
			var v = Percentage((t-y),y);
			if(v>=0){
				v="+"+v+"%"
			}else{
				v=v+"%";
			}
		}else{
			v='+0%';
		}
		$("#"+preId+"span").text(v);
	}
	function getCount(){
		$.ajax({
			   type: "POST",
			   url: _GLOBAL.ctx+"/report/mallReportFresh",
			   success: function(obj){
				  
				   if(obj){
						   $('#mall_pv_today').text(obj.mall_pv_today?obj.mall_pv_today:0);
						   setUpNum('mall_pv_up_',obj.mall_pv_today,obj.mall_pv_yesterday);
						   $('#mall_uv_today').text(obj.mall_uv_today?obj.mall_uv_today:0);
						   setUpNum('mall_uv_up_',obj.mall_uv_today,obj.mall_uv_yesterday);
						   $('#mall_new_user_today').text(obj.mall_new_user_today?obj.mall_new_user_today:0);
						   $('#mall_user_all').text(obj.mall_user_all?obj.mall_user_all:0);
//						   setUpNum('mall_user_up_',obj.mall_new_user_today,obj.mall_new_user_yesterday);
						   $('#mall_term_all').text(obj.mall_term_all);
						   $('#mall_term_online').text(obj.mall_term_online);
						   
						   
				   }
				   
//				   setTimeout("Index.getCount()", 30*1000);
			   }
			});
	}
	
	function highcharts(){
		 var chart_pv_uv = {
   				 chart: {
   		                type: 'spline',
   		                renderTo : 'chart_pv_uv'
   		            },
   		            title: {
   		                text: '宣传页访问量/客流量趋势'
   		            },
   		            subtitle: {
   		                text: '最近一周'
   		            },
   		            xAxis: {
   		                type: 'category'
   		            	,tickInterval: 1
   		            },
   		            yAxis: {
   		                title: {
   		                    text: '访问量(次数)'
   		                },
   		                min: 0
   		            },
   		           
   			series : [{name: '访问量'} ,{name: '客流量'}]
   		};
   	   
   		var chart_online = {
   				 chart: {
   		                type: 'spline',
   		                renderTo : 'chart_online'
   		            },
   		            title: {
   		                text: '在线用户趋势'
   		            },
   		            subtitle: {
   		                text: '8:00-24:00'
   		            },
   		            xAxis: {
   		                type: 'category',
//   		                labels:{ 
//   		                    step:4
//   		                } 
   		                tickInterval: 2
   		            },
   		            yAxis: {
   		                title: {
   		                    text: '在线用户数'
   		                }
   		            },
   		           
   			series : [{name: '在线用户数'}]
   		};
   	   $.ajax({
   		   type: "POST",
   		   url: _GLOBAL.ctx+"/report/mallReport",
   		   success: function(obj){
   			   
   			   chart_pv_uv.series[0].data=obj.mall_last_pv;
   			   chart_pv_uv.series[1].data=obj.mall_last_uv;
   			   new Highcharts.Chart(chart_pv_uv);

   			   
   			   chart_online.series[0].data=obj.mall_online_hour;
   			   new Highcharts.Chart(chart_online);
   		   }
   		});
	}

    return {
    	getCount:getCount,
    	initMiniCharts: function () {
            
            getCount();
            
            highcharts();
        }
    };

}();