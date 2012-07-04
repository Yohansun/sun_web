/*
 *	jQuery slider plugin v2.0
 *	author : Luck Chang
 *	email  : chunhang@networking.io
 *	data   : 2012.06.18 19:28
 */

 ;(function($){
 	$.fn.slider = function(configs){
 
 		var $this = this,
 		len = $this.children().length;
		if(len == 1) return;

		configs = $.extend({
			styles   : 'none',
			speed    : 400,
			duration : 3000,
			pause    : true,
			prev     : '.slider_prev',
			next     : '.slider_next',
			buttons  : true,
			mouse    : 'click',
			autoplay : true,
			easing   : 'swing'
		},configs);

		var html = $this.html(),
		tmp = '',
		button = '',
		slide = configs.styles == 'slide',
		vertical = configs.styles == 'vertical',
		fade = configs.styles == 'fade',
		none = configs.styles == 'none';
		fadenone = fade || none;

		if(configs.buttons && !vertical){
			button = '<a href="javascript:;" class="slider_prev"></a><a href="javascript:;" class="slider_next"></a>';
		}
		for(var i = 2; i <= len; i ++){
			tmp += '<li>' + i + '</li>';
		}
		if(fadenone){
			tmp = html + '<ul><li class="curr">1</li>' + tmp + '</ul>' + button;
		}
		else{
			tmp = '<div class="slider_bin_container">' + html + html + '</div><ul><li class="curr">1</li>' + tmp + '</ul>' + button;
		}

		$this.html(tmp);
		var $next = $('.slider_next');
		$next.html($this.data('next'));
		html = null;
		button = null;
		tmp = null;

		var $li = $this.find('li'),
		$img = $this.children('img'),
		sliding,
		pager = 1,
		now = 0;

		if(fadenone){
			$img.css('position','absolute')
			.filter(function(index){
				return index;
			}).hide();

			$(configs.prev,this).click(function(){
				fades(pager - 1);
			});

			$(configs.next,this).click(function(){
				fades(pager + 1);
			});
			$li[configs.mouse](function(){
				var num = $li.index(this) + 1;
				fades(num);
			});
		}
		else{
			var	$bin = $this.children('.slider_bin_container'),
			w = $this.width(),
			h = $this.height();

			if(vertical){
				$bin.css({'width':w+'px','height':'99999px'});
			}

			var dirs = vertical ?'top':'left',
			scroll = vertical ? h : w,
			param1 = {},
			param2 = {},
			param3 = {};
			param1[dirs] = '+=' + scroll + 'px';
			param2[dirs] = '-=' + scroll + 'px';

			$(configs.prev,this).click(function(){
				play(pager - 1);
			});
			$(configs.next,this).click(function(){
				play(pager + 1);
			});
			$li[configs.mouse](function(){
				return false;
				var num = $li.index(this);
				mouse(num);
			});
		}

		if(configs.autoplay){
			autoplay();
			if(configs.pause){
				$this.hover(function(){
					clearInterval(sliding);
				},function(){
					autoplay();
				});
			}
		}

		function autoplay(){
			clearInterval(sliding);
			sliding = setInterval(function(){
				if(fadenone){
					fades(pager + 1);
				}
				else{
					play(pager + 1);
				}
			},configs.duration);
		}
		function fades(num){
			if(num > len){ num = 0;}
			else if(num <= 0) {num = len-1;}
			else num = num -1;
			if(fade){
				$img.eq(num).stop().fadeIn().end().eq(now).fadeOut();
			}
			if(none){
				$img.eq(now).hide().end().eq(num).show();
			}
			now = num;
			pager = num + 1;
			makeDots(pager);
		}
		function play(page){
			if(!$bin.is(':animated')){
				if(page == len + 1){
					clearInterval(sliding);
					return;
				}
				param3[dirs]  = (1-page) * scroll + 'px';
				if(page == 0){
					$bin.css(dirs,- scroll * len + 'px').animate(param1,configs.speed,configs.easing);
					pager = len;
				}
				else if(page == len + 2){
					$bin.css(dirs,'0').animate(param2,configs.speed,configs.easing);
					pager = 2;
				}
				else{
					$bin.animate(param3,configs.speed,configs.easing);
					pager = page;
					if(page == len){
						$next.text($this.data('shut')).click(function(){
							$('.abs_center').hide();
							$('#layer').hide();
						});
					}
				}
				makeDots(pager);
			}
		}
		function mouse(num){
			param3[dirs]  = -num * scroll + 'px';
			if(pager == len && num == 0){
				$bin.stop().animate(param2,configs.speed,configs.easing);
			}
			else if(pager == 1 && num == len-1){
				$bin.stop().css(dirs,- scroll * len + 'px')
				.animate(param1,configs.speed,configs.easing);
			}
			else{
				$bin.stop().animate(param3,configs.speed,configs.easing);
			}
			pager = num + 1 ;
			makeDots(pager);
		}
		function makeDots(index){
			index = (index == len + 1) ? 1 : index;
			$li.eq(index - 1).addClass('curr').siblings().removeClass();
		}

	}
})(jQuery);

/*
 * jQuery Easing plugin
 */

jQuery.easing['jswing'] = jQuery.easing['swing'];

jQuery.extend( jQuery.easing,
{
	def: 'easeOutQuad',
	swing: function (x, t, b, c, d) {
		return jQuery.easing[jQuery.easing.def](x, t, b, c, d);
	},
	easeOutQuad: function (x, t, b, c, d) {
		return -c *(t/=d)*(t-2) + b;
	},
	easeOutCubic: function (x, t, b, c, d) {
		return c*((t=t/d-1)*t*t + 1) + b;
	},
	easeInOutCubic: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t + b;
		return c/2*((t-=2)*t*t + 2) + b;
	},
	easeOutQuint: function (x, t, b, c, d) {
		return c*((t=t/d-1)*t*t*t*t + 1) + b;
	},
	easeInOutQuint: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t*t*t + b;
		return c/2*((t-=2)*t*t*t*t + 2) + b;
	},
	easeOutExpo: function (x, t, b, c, d) {
		return (t==d) ? b+c : c * (-Math.pow(2, -10 * t/d) + 1) + b;
	},
	easeOutCirc: function (x, t, b, c, d) {
		return c * Math.sqrt(1 - (t=t/d-1)*t) + b;
	},
	easeOutElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		return a*Math.pow(2,-10*t) * Math.sin( (t*d-s)*(2*Math.PI)/p ) + c + b;
	},
	easeInOutElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d/2)==2) return b+c;  if (!p) p=d*(.3*1.5);
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		if (t < 1) return -.5*(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )) + b;
		return a*Math.pow(2,-10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )*.5 + c + b;
	},
	easeInBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158;
		return c*(t/=d)*t*((s+1)*t - s) + b;
	},
	easeOutBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158;
		return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
	},
	easeInOutBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158; 
		if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b;
		return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b;
	},
	easeInBounce: function (x, t, b, c, d) {
		return c - jQuery.easing.easeOutBounce (x, d-t, 0, c, d) + b;
	},
	easeOutBounce: function (x, t, b, c, d) {
		if ((t/=d) < (1/2.75)) {
			return c*(7.5625*t*t) + b;
		} else if (t < (2/2.75)) {
			return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
		} else if (t < (2.5/2.75)) {
			return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
		} else {
			return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
		}
	}
});