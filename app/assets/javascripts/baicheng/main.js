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
	$('#colors_con').hover(function(){
		$(this).children().fadeToggle('fast');
	});

	//nav
	// (function($){
	// 	var footer = $('.footer'),
	// 		win = $(window);
	// 	function size(){
	// 		var	h = win.height();
	// 		if(h <= 900){
	// 			footer.css('position','fixed');
	// 		} else {
	// 			footer.css('position','static');
	// 		}
	// 	}
	// 	size();
	// 	win.resize(size);
	// })($);

	//reply
	function reply_slideUp(remove_wrap){
		remove_wrap.slideUp(function(){
			$(this).remove();
		})
	};
	$('.js-reply').click(function(){		
		var reply_form = $(this).parents('.comment-item').children().hasClass('reply_form');
		if(reply_form == false){
			reply_slideUp($('.reply_form'))
			$('<form class="reply_form"><textarea></textarea><button class="submit_btn">提交评论</button><button class="submit_btn submit_btn_cancel js-submit_btn_cancel">取消</button></form>').appendTo($(this).parents('.comment-item')).slideDown();
		}
	});
	$('.comment-list').on('click','.js-submit_btn_cancel',function(e){
		e.preventDefault();
		reply_slideUp($(this).parents('.reply_form'))
	});

	//subnav
	/*$('.nav').children('li')
	.mouseover(function(){
		$(this).children().addClass('active');
		$(this).children('.subnav').show();
	})
	.mouseout(function(){
		$(this).children().removeClass('active');
		console.log($(this))
		$(this).children('.subnav').hide();
	});*/

	$('.nav').children('li').hover(function(){
		$(this).children('.subnav').toggle()
	})
});