/**
 * Theme Plugins
 * @author panbaotao
 */
(function($){
	$.fn.extend({
		dwzhighcharts: function(options){
			return this.each(function(){
				var $this = $(this);
				var charid = $this.attr('id');
				
				eval('$this.highcharts('+charid+');');
			});
		}
	});
})(jQuery);

