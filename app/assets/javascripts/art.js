$(function(){
	var ie6 = $.browser.msie && $.browser.version <= 7;
	$('.art_top li').hover(function(){
		var that = $(this);
		if(!that.is(':animated'))
			that.animate({'top':'-8px'},'fast').next('a').show();
			if(ie6){
				that.children('a').show();
			}
			info_hide();
			that.find('.art_info').fadeIn();
		},function(){
			var that = $(this);
			info_hide();
			that.animate({'top':'0px'},'fast').next('a').hide();
			if(ie6){
				that.children('a').hide();
			}
		});
		function info_hide(){
			$('.art_info').hide();
		}
		var $art_li = $('.art_nav li');
		$art_li.click(function(){
			$(this).addClass('selected').siblings().removeClass('selected');
			var num = $art_li.index(this);
			$('#art_container').children(':eq(' + num + ')').show().siblings().hide();
		});
		$('#carousel').draggableCarousel({ 
			'keyControls' : true,
			'transitionDuration' : 1000
		});
})