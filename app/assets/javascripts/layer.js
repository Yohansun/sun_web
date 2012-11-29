/*
 * jQuery layer plugin
 * Author : Luck Chang
 * Email  : chunhang@networking.io
 * Date   : 2012.11.29 10:00
 */
(function($, exports){
	var ie6 = $.browser.msie && $.browser.version == 6,
		document = exports.document,
		doc = document.documentElement,
		_$ = function(id){
			return document.getElementById(id);
		};

	function Layer(configs){
		var defaults = {
			btn : null,
			box : null,
			callback : function(){}
		};
		for(var o in configs){
			if(configs.hasOwnProperty(o)){
				defaults[o] = configs[o];
			}
		}
		this.btn = defaults.btn;
		this.box = defaults.box;
		this.init();
	}

	Layer.prototype = {
		constructor : Layer,
		init : function(){
			this.layer = _$('nov_notification');
			this.addEvents();
		},
		css : function(ele, obj){
			for(var i in obj)
				if(obj.hasOwnProperty(i))
					ele.style[i] = obj[i];
		},
		layout : function(){
			this.box.hide();
			this.css(this.layer, {
				'display' : 'none'
			});
		},
		layin : function(){
			this.fix();
			this.box.show();
			this.css(this.layer, {
				'display' : 'block'
			});
		},
		proxy : function(func, obj){
			return function(){
				return func.call(obj, arguments);
			};
		},
		fix : function(){
			if(!ie6) return;
			var h = doc.scrollHeight,
				w = doc.clientWidth;
			this.css(this.layer, {
				'height' : h + 'px',
				'width' : w + 'px'
			});
		},
		addEvents : function(){
			var that = this;
			if(this.btn){
				this.btn.click(this.proxy(this.layin, this));
			} else {
				this.layin();
			}
			$(this.layer).click(this.proxy(this.layout, this));
			$(this.box).click(this.proxy(this.layout, this));
			$(document).keydown(function(e){
				if(e.which === 27 && that.box.is(':visible'))
					that.layout();
			});
			if(ie6) $(exports).resize(this.proxy(this.fix, this));
		}
	};
	exports.Layer = Layer;
})(jQuery, window);

$(function(){
	var icolor = new Layer({
		box : $('.nov_notification')
	});
});