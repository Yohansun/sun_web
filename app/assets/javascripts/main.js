/*search input*/
$(function(){
	var $input = $('.search input.fl,#username,.owner_search');
	$input.focus(function(){
		var txt = $(this).val();
		if(txt == this.defaultValue)
		$(this).val('')
		})
	$input.blur(function(){
		var txt = $(this).val();
		if(txt == '')
		$(this).val(this.defaultValue);
		});
});

/*kv slides*/
$(function(){
	var $bin = $('.slides');
	var w = $bin.width();
	var $con = $('.slidesContainer');
	$con.append($con.html());
	var $slider = $('.slider');
	var pages = $slider.length;
	pages = pages/2;
	var pager = 1;
	var $dot = $('.bullet');
	var num = 0;
	var speed = 5000;
	var _speed = 1500;
	function RunSlide(){
		if(!$slider.is(':animated'))
		{
			if(pager == pages+1)
			{
				$slider.css('left','0');
				$slider.animate({'left':'-='+w},_speed);
				pager = 2;
				num = 1;
			}
			else
			{
				$slider.animate({'left':'-='+w},_speed);
				pager++;
				num = pager-1;
			}
		}
		if(num == pages)num = 0;
		else{}
		$dot.eq(num).addClass('current').siblings().removeClass('current');
	}
//	var sliding=setInterval(RunSlide,speed);
	$dot.click(function(){
		var one = $dot.index(this);
		if(one == 0)
		{
			if(pager == pages+1 || pager == 1){return false;}
		}
		else if(one == 1 && pager == pages+1)
		{
			if(!$slider.is(':animated'))
			{
				$slider.css('left','0');
			}
		}
		$slider.stop(true);
		clearInterval(sliding);
		$dot.eq(one).addClass('current').siblings().removeClass('current');
		$slider.animate({'left':'-'+one*w},_speed);
		sliding=setInterval(RunSlide,speed);
		pager = one+1;
		});
});

/*loginBg*/
$(function(){
	$('a.login').mouseover(function(){
		$('.loginBg').show();
	}).mouseout(function(){
		$('.loginBg').hide();
	});
   $('.loginBg').mouseover(function(){
		$(this).show();
		$('a.login').addClass('logHover');
	}).mouseout(function(){
		$(this).hide();
		$('a.login').removeClass('logHover');
		});
});
/*historys*/
$(function(){
	$('.history').mouseover(function(){
		$('.historys').show();
		})
	.mouseout(function(){
		$('.historys').hide();
		});
	$('.historys').hover(function(){
		$(this).toggle();
		});
});
/*app*/
$(function(){
	var pager = 1;
	var app_speed = 600;
	$('a.app_next').click(function(){
		var $bin = $('.app_slides');
		var w = $bin.width();
		var $slide = $('.app_container');
		var len = $slide.children('a').length;
		if(!$slide.is(':animated'))
		{
			if(pager!=len)
			{
				$slide.animate({'left':'-='+w},app_speed);
				pager++;
			}
			else
			{
				$slide.animate({'left':'0'},app_speed);
				pager = 1;
			}
		}
	});
	$('a.app_prev').click(function(){
		var $bin = $('.app_slides');
		var w = $bin.width();
		var $slide = $('.app_container');
		var len = $slide.children('a').length;
		if(!$slide.is(':animated'))
		{
			if(pager!=1)
			{
				$slide.animate({'left':'+='+w},app_speed);
				pager--;
			}
			else
			{
				$slide.animate({'left':'-'+(len-1)*w},app_speed);
				pager = 4;
			}
		}
	});
});

/*case*/
$(function(){
	var $topBin = $('.case_display');
	var topW = $topBin.width();
	var $topSlide = $('.case_container');
	
	var $ul = $('.case_list ul');
	var $li = $ul.children('li');
	var len = $li.length;
	var _speed = 800;
	var botW = 122;
	var key = 0;
	
	function slide(arg){
		if(!$topSlide.is(':animated'))
		{
			$li.eq(arg).addClass('present').siblings().removeClass('present');
			if(arg<len-1)
			{
				if(arg==len-2){$ul.animate({'left':'-'+(arg-4)*botW},_speed);}
				else $ul.animate({'left':'-'+(arg-3)*botW},_speed);
			}
			if(arg<3)
			{
				$ul.animate({'left':'0'},'normal');
			}
			$topSlide.animate({'left':'-'+arg*topW},_speed);
		}
	}
	$li.click(function(){
		clearInterval(sliding);
		var num = $li.index(this);
		slide(num);
		key = num+1;
		sliding = setInterval(auto,2000);
		});
	function auto()
	{
		if(key<len)
		{
			slide(key);
			key++;
		}
		else
		{
			key = 0;
			slide(key);
		}
	}
	var sliding = setInterval(auto,2000);
})
/*tips*/
$(function(){
	$('.faqs_title').click(function(){
		$(this).children('.tips_bullet').toggleClass('show').end();
		$(this).next().toggle();
		});
});
/*faq_ask*/
$(function(){
	var id1 = '#input_span';
	var id2 = '#textarea_span';
	var id3 = '#service_span';
	$('.faq_text').keyup(function(){myfun(30,id1,$(this))});
	$('.faqs_ask textarea').keyup(function(){tip(200,id2,$(this))})
	$('.faqs_ask textarea').keyup(function(){tip(500,id3,$(this))})
	function tip(total,ids,element){
		var len = element.val().length;
		var rest = total-len;
		$(ids).text(rest);
	}
});
/*regs*/
$(function(){
	$('ul.regs li img').click(function(){
		$(this).next('input').attr('checked','checked');
		});
	$('ul.regs input').click(function(){
		$(this).attr('checked','checked');
		});
	$('a.reg_next').click(function(){
		var info = $(this).next('p.none').text();
		var $input = $('ul.regs input[checked=checked]');
		var len = $input.length;
		if(len<1)
		{
			alert(info);
		}
		$(this).attr('href',$input.attr('alt'));
		});
});
/*system table*/
$(function(){
	$('.sys_content td img').click(function(){delete_row($(this))});
})
function delete_row(element)
{
	element.parents('tr').fadeOut();
}


