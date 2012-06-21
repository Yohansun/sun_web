$(function(){
	/*flash zone*/

	var $art_li = $('.art_top li');
	
	$art_li.hover(function(){
		$(this).children('.art_info').stop(true).animate({'top':'-8px'},'fast',function(){
			$(this).next('a').show();
		}).children('span').show();
	},function(){
		$(this).children('a').hide().end().children('.art_info').stop().animate({'top':'0'},'fast').children('span').hide();
	}).mouseover(function(e){
		var num = $('.art_top li').index(this);
		$('.art_box').hide().eq(num).show();
	});

	$('.ipad1_zoom').click(o_in);
	$('#lay_close').click(o_out);

	/*art nav starts*/
	var $art_li = $('.art_nav li');
	$art_li.click(function(){
		$(this).addClass('selected').siblings().removeClass('selected');
		var num = $art_li.index(this);
		$('#art_container').children(':eq(' + num + ')').show().siblings().hide();
	});
	$('#carousel,#pdf_container,#arts').draggableCarousel({ 
		'keyControls' : true,
		'transitionDuration' : 1000
	});
})