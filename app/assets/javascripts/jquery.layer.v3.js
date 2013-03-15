/*
 * jQuery Layer Plugin v2
 * Author : Luck Chang
 * Email  : chunhang@networking.io
 * Date   : 2013.1.2 3:01
 */
var Layer = (function($, document){
	"use strict";
	var ie6 = $.browser.msie && $.browser.version == 6,
		 html = document.documentElement,
		 $box,
		 flag;

	function Lay(configs){
		if(!(this instanceof Lay)) {
			return new Lay(configs);
		}
		$box = $('.abs-center');
		if(!$box.length) return;

		this.defaults = {
			btn : null,
			box : null,
			auto: false,
			fade : false,
			callback : function(){}
		};
		this.defaults = $.extend(this.defaults,configs);
		this.init();
	}
	Lay.prototype = {
		constructor : Lay,
		init : function(){
			this.box = this.defaults.box;
			this.btn = this.defaults.btn;
			this.close = this.box.find('.close-btn');
			this.layer = $('#layer');
			this.addEvents();
		},
		layin : function(){
			this.fix();
			this.layer.show();
			this.defaults.fade && this.box.fadeIn();
			this.defaults.fade || this.box.show();
			this.defaults.callback.apply(this, arguments);
		},
		layout : function(){
			this.layer.hide();
			this.defaults.fade && $box.fadeOut();
			this.defaults.fade || $box.hide();
		},
		fix : function(){
			var boxH = this.box.outerHeight(),
				 docH = html.clientHeight;
			if(boxH > docH){
				this.box.css({
					top : 0,
					marginTop : '25px'
				});
			}
			ie6 && this.layer.css({
				'height' : html.scrollHeight + 'px',
				'width' : html.clientWidth + 'px'
			});
		},
		addEvents : function(){
			var that = this;
			if(this.defaults.auto){
				this.layin();
			}
			this.btn && this.btn.length && this.btn.click($.proxy(this.layin, this));
			this.close.click($.proxy(this.layout, this));
			if(flag) return;
			ie6 && $(window).resize($.proxy(this.fix, this));
			flag = true;
		}
	};
	return Lay;
}(jQuery, document));