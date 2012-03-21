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
/*jiathis*/
$(function(){
	$('.jiathis_btn').hover(function(){
		$('.jiathis_area').show();
	},function(){
		$('.jiathis_area').hide();
	});
	$('.jiathis_area').hover(function(){
		$(this).toggle();
	});
});
/*server & subs*/
$(function(){
	$('a.server').click(function(){
		if(!$('.server_suc').is(':visible'))
		$('div.server_input').show().find('textarea').val('');
	});
	$('div.server_input').mouseleave(function(){
		var txt = $(this).find('textarea').val();
		if(txt=='')
		$(this).hide();
	});
	$('#server_submit').click(function(){
		var $area = $(this).parents('.server_input').find('textarea')
		var txt = $area.val();
		if(txt!='')
		{
			$('.server_input').hide().next().show();
		}
		else{
			alert($('.server_check').text());
		}
	});
	$('#server_close').click(function(){
		$(this).parents('.server_suc').hide();
	});
	$('a.close_btn').click(shut_center=function(){
		$(this).parents('.abs_center').hide();
	});
	
	$('a.subscribe').click(function(){
		if($('.subs_suc').is(':visible'))return false;
		$('.subs_input').show().find('input[type=text]').val('');
		$('.subs_err').hide();
	});
	$('form#subs_form').submit(function(){
		var subs = $('#subs_form :input[type=text]').val();
		if(isEmail(subs))
		{
			$('.subs_err').hide();
			$('.subs_input').hide();
			$('.subs_suc').show();
		}
		else{
			$('.subs_err').show();
		}
		return false;
	});
	$('.subs_suc :input').click(shut_center);
	
	function isEmail(str){
       var reg = /^([a-zA-Z0-9._-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
       return reg.test(str);
	}
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
/*
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
*/
/*tips*/
$(function(){
	$('.faqs_title').click(function(){
		$(this).children('.tips_bullet').toggleClass('show').end();
		$(this).next().toggle();
		});
/*nav*/
	$('.navBot li').hover(function(){
		$(this).find('ul').show();
	},function(){
		$(this).find('ul').hide();
		});	
});
/*faq_ask*/
$(function(){
	var id1 = '#input_span';
	var id2 = '#textarea_span';
	var id3 = '#service_span';
	var id4 = '#ins_span';
	
	$('.faq_text').keyup(function(){myfun(30,id1,$(this))});
	$('.faqs_ask textarea').keyup(function(){tip(200,id2,$(this))});
	$('.faqs_ask textarea').keyup(function(){tip(500,id3,$(this))});
	$('textarea.works_details').keyup(function(){tip(400,id4,$(this))});
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

/*reg_suc*/
	var urls = $('.reg_suc a').attr('href');
	if(urls){
		var timer_num =5;
		function timer(){
			if(timer_num == 0){
				window.location=urls;
				return false;
				}
			timer_num--;
			$('.reg_suc span.cr').text(timer_num);
			}
		setInterval(timer,1000);
	}
});
/*pass_check*/
$(function(){
	$('.pass_check').keyup(function(){
		var short = $('#short').text();
		var medium = $('#medium').text();
		var strong = $('#strong').text();
		var pass = $(this).val();
		var num = getstren(pass);
		var w = num*100/32;
		if(w<40)
		{
			$('#ps_tip').text(short).css('color','#f00');
			$('#ps_status').css('background','#f00');
		}
		else if(w<80)
		{
			$('#ps_tip').text(medium).css('color','#F9A60D');
			$('#ps_status').css('background','#F9A60D');
		}
		else
		{
			$('#ps_tip').text(strong).css('color','#008200');
			$('#ps_status').css('background','#008200');
		}
		$('#ps_status').css('width',w+'%');
	});
});

function getstren(passwd) {
	intScore = 0;
 	if (passwd.match(/[a-z]/)) // [verified] at least one lower case letter
 	{
 		intScore = (intScore+1)
 	}
	if (passwd.match(/[A-Z]/)) // [verified] at least one upper case letter
 	{
		intScore = (intScore+5)
	}
 	if (passwd.match(/\d+/)) // [verified] at least one number
 	{
 		intScore = (intScore+5)
 	}
	if (passwd.match(/(\d.*\d.*\d)/)) // [verified] at least three numbers
 	{
 		intScore = (intScore+5)
 	}
 	if (passwd.match(/[!,@#$%^&*?_~]/)) // [verified] at least one special character
 	{
 		intScore = (intScore+5)
 	}
	if (passwd.match(/([!,@#$%^&*?_~].*[!,@#$%^&*?_~])/)) // [verified] at least two special characters
 	{
 		intScore = (intScore+5)
 	}
 	if (passwd.match(/[a-z]/) && passwd.match(/[A-Z]/)) // [verified] both upper and lower case
 	{
 		intScore = (intScore+2)
 	}
	if (passwd.match(/\d/) && passwd.match(/\D/)) // [verified] both letters and numbers
 	{
 		intScore = (intScore+2)
 	}
 	if (passwd.match(/[a-z]/) && passwd.match(/[A-Z]/) && passwd.match(/\d/) && passwd.match(/[!,@#$%^&*?_~]/))
 	{
 		intScore = (intScore+2)
 	}
 return intScore;
}
/*system table*/
$(function(){
	$('.sys_content td img').click(function(){delete_row($(this))});
})
function delete_row(element)
{
	element.parents('tr').fadeOut();
}
/*upload tag*/
$(function(){
	$('div.tags a').click(function(){
		var txt = $(this).text();
		add_tag(txt)
		});
	$('input.add_tag_on').click(function(){
		var txt = $('input.add_tag').val();
		if(txt!='')
		add_tag(txt)
		});
});
function del_tag(){
	$('a.labels img').click(function(){
		$(this).parents('a.labels').remove();
		});
	}
del_tag();
function add_tag(text){
	var $list = $('div.tag_list');
	var $a = $('div.tag_list a');
	var arr = new Array();
	$a.each(function(i){
		arr.push($a.eq(i).text());
		});
	if(arr.indexOf(text)<0)
	{
		var $app = '<a href="javascript:void(0)" class="labels fl cr">'+text+'<img src="images/news/labels.png" /></a>';
		$list.append($app);
		del_tag();
	}
}
/*reg2*/


$(function(){
	var $status = $('input.status');
	$('.user_details').eq(1).hide();
	$status.click(function(){
		var num = $status.index(this);
		$('.user_details').eq(num).show().siblings('.user_details').hide();
	});
});