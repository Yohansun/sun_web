$(function(){
	if($.fn.slider)	$('.story-slider').slider({
		callback : function(num){
			var html = $('.story-slider').children().children().eq(num).find('.colorsbox').html();
			$('#colors_boxes').html(html);
		}
	});
	$('.js-questionmart').hover(function(){
		$(this).children('.questionmart_pop').toggle();
	});
//colors
	// $('#colors_con').hover(function(){
	// 	$(this).children().fadeToggle('fast');
	// });

	//nav
	(function($){
		var footer = $('.footer'),
			win = $(window);
		function size(){
			var	h = win.height();
			if(h <= 900){
				footer.css('position','fixed');
			} else {
				footer.css('position','static');
			}
		}
		size();
		win.resize(size);
	})($);

	//reply
	$('.js-reply').click(function(){
		$(this).parents('.comment-list').find('.comment-form').hide()
		$(this).parent('p').siblings('.comment-form').slideDown();
	});
	$('.comment-list').on('click','.js-submit_btn_cancel',function(e){
		e.preventDefault();
		$(this).parents('.reply_form').slideUp()
	});
});