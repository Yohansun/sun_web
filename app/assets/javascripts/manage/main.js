$(function(){
	//index imgbase
	$('.imgbase_show a').hover(function(){
		$(this).find('span:eq(1)').toggleClass('none')
	});
	//index subnav
	$('.nav li').hover(function(){
		$(this).find('ul').toggle()
	});
	/*li:hover js*/
	var ie6 = (function(){
		var i = document.createElement("b");
		i.innerHTML = "<!--[if IE 6]><i></i><![endif]-->";
		return i.getElementsByTagName("i").length === 1;
	})()
	if(ie6){
		$('.ul_dot li,.index_map li').hover(function(){
			$(this).toggleClass('js-hover')
		});
		$('.carousel-indicators a').hover(function(){
			$(this).children('.hover').toggle();
		})
	};

	$('.js-login').click(function(e){
		e.preventDefault();
		$('#overlay').fadeIn('fast');
		$('.unlogin').show();
	});
	$('.js-close_btn').click(function(e){
		e.preventDefault();
		$('#overlay').fadeOut('fast');
		$('.unlogin').hide();
	})

	// index slider
	;(function($){
		if(!$.fn.slider) return;
		$('#indexkv').slider({
			buttons : false,
			pagers : '.carousel-indicators'
		});
		$('#master_slide').slider({
			pagers : false
		});
	})($);

	// back top
	;(function($){
		console.log($(window).width())
		$("#back-top").hide();
		$(window).scroll(function () {
			if ($(this).scrollTop() > 100) {
				$('#back-top').fadeIn();
			} else {
				$('#back-top').fadeOut();
			}
		});
		// scroll body to 0px on click
		$('#back-top a').click(function () {
			$('body,html').animate({
				scrollTop: 0
			}, 800);
			return false;
		});
	})($);
});