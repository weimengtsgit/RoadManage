/*
 *
 * Purpose: Ajax Loading Chart
 * Rely on: jquery.highcharts
 *
 **/

var cached_charts = {};
function render_chart(chart_id, title, data_src_url, params, force_reload, opts){

    var common_opts = {
        chart: {
            defaultSeriesType: "spline",
            animation: false
        },
        yAxis: {
            title:"",
            min:0
        },
        credits: {
            "enabled":false
        },
        plotOptions: {
            "area":{
                "stacking":null
            },
            "series":{
                animation: false,
                events: {
                  legendItemClick: function(event) {
                    var legendName = this.name+'_<dot>';
                    var tempSeries = this.chart.series;
                    var seriesLength = tempSeries.length;
                    for (var i=0; i < seriesLength; i++){
                      if (tempSeries[i].name == legendName){
                        tempSeries[i].visible ? tempSeries[i].hide() : tempSeries[i].show();
                      }
                    }
                  }
                }
            }
        },
        tooltip: {
            enabled: true,
            formatter: function() {
                return ''+
                this.x + '��'+ this.series.name + ' : '+ this.y;
            }
        },
        legend: {
            margin: 25,
            enabled: true
        },
        subtitle: {}
    };
    
    // Set Cached Chart Unique Id
    var chart_cache_id = 'umeng_' + chart_id;
    $.each(params, function(i,n){
        chart_cache_id += '_' + i + ':' + n;
    });

    // Do Nothing If Chart Existing and No Need To Reload
    var cached_data = $('#'+chart_id).data(chart_cache_id);
    if ( cached_charts[chart_cache_id] != undefined && !force_reload && cached_data != null ){
        try{
            cached_charts[chart_cache_id].destroy();
            cached_charts[chart_cache_id] = new Highcharts.Chart($.extend(true, {}, common_opts, cached_data));

            // Trigger chart_data_loaded event
            var data_source = $('#'+chart_id);
            data_source.trigger('chart_data_loaded', data_source.data(chart_cache_id+'_rawdata'));
        }catch(error){}
        return;
    }

    // Loading Data
    var categories = [];
    var series = [];
    var chart_canvas = $('#'+chart_id);
    var loading_img = $("<img src='/images/ajax-loader.gif'/>");
    chart_canvas.block({
        message: loading_img,
        css:{
            width:'32px',
            border:'none',
            background: 'none'
        },
        overlayCSS:{
            backgroundColor: '#FFF',
            opacity: 0.8
        },
        baseZ:997
    });
    $.get( data_src_url, params, function(resp){
        if( resp.result == 'success'){
            $.each(resp.dates, function(i,date){
                categories[i] = date
            });
            
            $.each(resp.stats, function(i,stat){
                series[i] = $.extend({visible:true}, stat);
            });
           
            // Set Init Options
            var options = $.extend(true, {
                chart: {
                    renderTo: chart_id
                },
                title: {
                    text: title
                },
                xAxis: {
                    categories: categories,
                    labels:{
                        align:"right",
                        //rotation:-45,
                        step: parseInt(categories.length / 7)
                    }
                },
                series: series
            }, opts || {});

            // Cache data
            $('#'+chart_id).data(chart_cache_id, options );
            $('#'+chart_id).data(chart_cache_id+'_rawdata', resp);

            // Destroy Existing Chart
            if ( cached_charts[chart_cache_id] != undefined ){
                try{
                    cached_charts[chart_cache_id].destroy();
                }catch(error){}
            }

            // Create Chart
            cached_charts[chart_cache_id] = new Highcharts.Chart($.extend(true, {}, common_opts, options));

            // Trigger chart_data_loaded event
            $('#'+chart_id).trigger('chart_data_loaded', resp);
        }
        chart_canvas.unblock();
    });
}
function flush_chart(){
  cached_charts = {};
}

