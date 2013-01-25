/*
 * jQuery Slider Plugin v3.0
 * Author : Luck Chung
 * Email : chunhang@networking.io
 * Date : 2012.12.14 14:00
 */
;(function($){
	$.fn.slider = function(config){
		var defaults = {
			buttons : true,
			pager   : true,
			mouse   : 'click',
			speed   : 300,
			duration: 3000,
			autoplay: true,
			pause   : true,
			width   : null,
			styles  : 'none',
			easing  : 'swing',
			pagerClass : '',
			callback: function(){}
		};
		defaults = $.extend(defaults, config);

		return this.each(function(){
			var that = $(this),
				len = that.children().length;
				if (len <= 1) return;

			var slides = {
				imgs : that.html(),
				pag : '',
				pager : 1,
				width : defaults.width || that.width(),
				height: that.height(),
				init : function(){
					if(defaults.pager){
						this.getPager();
					}
					if(defaults.buttons){
						this.getButtons();
					}
					this.bin = $('<div class="slider_container">' + this.imgs + this.imgs + '</div>');
					that.empty().append(this.bin, this.pag, this.prev || '', this.next || '');
					this.imgs = null;

					if(defaults.autoplay){
						this.autoplay();
					}
					if(defaults.pause){
						this.pause();
					}
				},
				getPager : function(){
					for(var i = 2; i <= len; i ++){
						this.pag += '<li class="' + defaults.pagerClass + '">' + i + '</li>';
					}
					this.pag = $('<ul><li class="curr">1</li>' + this.pag + '</ul>');

					this.pag.find('li')[defaults.mouse](function(e){
						var index = $(this).index();
						if(index == 0 && this.pager == len + 1) return;
						slides.play(index + 1, e);
					});
				},
				getButtons : function(){
					this.prev = $('<a href="javascript:;" class="slider_prev">prev</a>');
					this.next = $('<a href="javascript:;" class="slider_next">next</a>');
					this.prev.click(function(){
						slides.play(slides.pager - 1);
					});
					this.next.click(function(){
						slides.play(slides.pager + 1);
					});
				},
				autoplay : function(){
					clearInterval(slides.sliding);
					slides.sliding = setInterval(function(){
						slides.play(slides.pager + 1);
					}, defaults.duration);
				},
				pause : function(){
					that.hover(function(){
						clearInterval(slides.sliding);
					}, slides.autoplay);
				},
				play : function(num, e){
					if(num == 0){
						this.bin.css('left', - len * this.width + 'px').stop()
						.animate({'left' : (1 - len) * this.width + 'px'}, defaults.speed, defaults.easing);
						this.pager = len;
					} else if(num <= len + 1){
						this.bin.stop()
						.animate({'left' : (1 - num) * this.width + 'px'}, defaults.speed, defaults.easing);
						this.pager = num;
					} else {
						this.bin.css('left', 0).stop()
						.animate({'left' : - this.width + 'px'}, defaults.speed, defaults.easing);
						this.pager = 2;
					}
					this.makeDots(this.pager, e);
				},
				makeDots : function(num, e){
					if(!defaults.pager) return;
					num = num > len ? 0 : num -1;
					this.pag.children().eq(num).addClass('curr').siblings().removeClass('curr');
					defaults.callback.call(null, num, e);
				}
			};
			slides.init();
		});
	};
}(jQuery));

/*
 * jQuery Easing plugin
 */

jQuery.easing['jswing'] = jQuery.easing['swing'];

jQuery.extend( jQuery.easing,
{
	def: 'easeOutExpo',
	swing: function (x, t, b, c, d) {
		return jQuery.easing[jQuery.easing.def](x, t, b, c, d);
	},
	easeOutExpo: function (x, t, b, c, d) {
		return (t==d) ? b+c : c * (-Math.pow(2, -10 * t/d) + 1) + b;
	}
});