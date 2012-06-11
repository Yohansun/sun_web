/*
 *	jQuery layer plugin for iColor yda v1.0
 *	author : luck chang
 *	email : chunhang@networking.io
 *	date : 2012.6.8 15:14:26
 */
;(function($){
	$.fn.extend({
		'layer' : function(configs){

			configs = $.extend({

				shut : $('#lay_close'),
				animation : false,
				speed : 400,
				styles : 'shake',	//or slide
				onscroll : false,	//scroll pannel is active
				duration : 2500		//image autoplay duration

			},configs);

			var $center = $('.abs_center'),
			auto = true,
			my = {};
			my.that = this,
			my.div = $('.content'),
			my.lay = $('#layer'),
			my.ie6 = $.browser.msie && $.browser.version == 6;
			my.name = $('#yda_name');
			my.school = $('#yda_school');
			my.img = $('#yda_img');
			my.ul = $('#yda_ul');
			my.ulf = $('#ul_f');
			my.uls = $('#ul_s');

			if(configs.onscroll || my.ie6){
				my.div.css('position','absolute');
			}

			my.that.click(function(){
				if(my.lay.is(':visible')) return;
				makeDetails(this);
				layin();
				if(configs.animation){
					if(configs.styles == 'shake'){
						my.div.show()
						.animate({'top':'60%'},configs.speed)
						.animate({'top':'40%'},configs.speed)
						.animate({'top':'55%'},configs.speed)
						.animate({'top':'45%'},configs.speed)
						.animate({'top':'50%'},configs.speed);
					}						
					else if(configs.styles == 'slide'){
						my.div.show()
						.animate({'top':'50%'},configs.speed);
					}
				}
				else{
					my.div.css('top','50%').fadeIn();
				}
			});
	
			$(document).keydown(function(event){
				if(my.lay.is(':visible')){
					if(event.which == 27){
						close_all();
					}
				}
			});

			configs.shut.click(close_all);
			my.lay.click(close_all);

			function close_all(){
				if(configs.animation){
					$center.stop(true).animate({'top':'-50%'},'normal',function(){
						$(this).hide();
					})
				}
				else{
					$center.fadeOut();
				}
				layout();
				if(auto)clearInterval(auto);
			}
			function layin(){
				if(my.ie6){
					var h = document.documentElement.scrollHeight;
					my.lay.css('height', h + 'px');
				}
				my.lay.show().animate({'opacity':'0.5'},'normal');
			}
			function layout(){
				my.lay.animate({'opacity':'0'},'normal').hide();
			}
			function makeDetails(element){
				var obj = {};
				obj.name = $(element).text();
				obj.school = $(element).attr('school');
				obj.user = $(element).attr('user');
				
				if($(element).hasClass('names')){
					my.name.text(obj.name);
					my.school.text(obj.school);
					my.img.attr('src',obj.user);
					my.ul.hide();
				}
				else{
					my.school.text(obj.name);
					my.name.text(obj.user);
					my.ul.show();
					my.f = $(element).attr('f');
					my.s = $(element).attr('s');
					my.img.attr('src',my.f);
					my.ulf.attr('src',my.f);
					my.uls.attr('src',my.s);
					$('#yda_ul li').mouseover(function(){
						alter($(this));
					});
					var index = 1;
					auto = setInterval(function(){
						index = index +1;
						index = index > 1 ? 0 : 1;
						$('#yda_ul li:eq('+index+')').trigger('mouseover');
					},configs.duration);
				}
			}
			function alter(element){
				element.addClass('curr').siblings().removeClass();
				var src = element.children().attr('src');
				my.img.attr('src',src);
			}
		}
	});
})(jQuery);

$(function(){
	$('.yda_table a').layer({
		animation : true,
		styles : 'shake',
		speed : 300,
		onscroll : false
	})
});