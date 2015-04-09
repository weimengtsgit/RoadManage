<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />

<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<script src="${ctx}/dwz/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="${ctx}/dwz/js/jquery.ba-resize.min.js" type="text/javascript"></script>
<script src="${ctx}/highcharts/js/highcharts.js" type="text/javascript"></script>
<script>
Highcharts.setOptions({//
// 	    colors: [//'#f8b331','#8fc316','#0070cb','#f41b90',
// 				 '#4572A7', '#AA4643', '#89A54E', '#80699B', '#3D96AE',
// 	 		     '#DB843D', '#92A8CD', '#A47D7C', '#B5CA92'],
// 	 	symbols: ['circle', 'diamond', 'square', 'triangle', 'triangle-down'],
		credits:{//右下角的文本  
            enabled: false
        },
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
	 		canvasToolsURL: '${ctx}/highcharts/js/canvas-tools.js',
	 		VMLRadialGradientURL: '${ctx}/highcharts/gfx/vml-radial-gradient.png'
	 	}
});
</script>
