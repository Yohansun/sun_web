var popupA = function( config ){
	var defConfig = {
		'popup'	: $('.popupA'),
		'mask'	: $('.popupA_mask'),
		'closeBtn'	: $('.popupA .close,.popupA input.ok')
	};
	$.extend(defConfig, config);
	this.config = defConfig;
	var _self = this;
	this.config.closeBtn.click(function(){
		_self.close();
	});
	if( $.browser.msie && $.browser.version < 7 ) {
		this.config.popup.css({
			'width'	: document.body.scrollWidth+'px'
		});
		this.config.mask.css({
			'width'	: document.body.scrollWidth+'px',
			'height' : document.body.scrollHeight+'px'
		});
		this.defaultTop = parseInt( this.config.popup.find('.popupA_content').css('marginTop') ) || 0;
	}
};
popupA.prototype = {
	open : function() {
		if( !this.config ) return false;
		if( $.browser.msie && $.browser.version < 7 ) {
			this.config.popup.css('marginTop', document.documentElement.scrollTop + this.defaultTop);
		}
		this.config.popup.show();
		this.config.mask.show();
	},
	close : function() {
		if( !this.config ) return false;
		this.config.popup.hide();
		this.config.mask.hide();
	}
};