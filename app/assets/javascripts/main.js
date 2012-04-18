// forward

$(function(){
	if ($("span.zf")) {
		$(".popup_zf_qq, .popup_zf_sina, .popup_zf_rr, .popup_zf_kaixin").click(function(e){
			var parent_node = $(this).parent();
			var url = $(parent_node).attr("data-url");
			var title = $(parent_node).attr("data-title");
			var pic = $(parent_node).attr("data-pic");

			var webid = $(this).attr("data-webid");

			window.open("http://www.jiathis.com/send/?webid="+webid+"&url="+url+"&title="+title+"&pic="+pic);
		});
	};
});

/*search input*/
$(function(){
	var $input = $('.search input.fl,#username,.owner_search,#host_main');
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
function o_in(){
	$('#overlay').fadeIn('fast');
	}
function o_out(){
	$('#overlay').fadeOut();
	}
function show_login(){
	o_in();
	$('.unlogin').show();
	}

function inputBlank(area){
	area.css({background:"#fcc",opacity:0}).animate({opacity:1},200);
    area.animate({opacity:0.5},200);
	area.animate({opacity:1},200);
	area.animate({opacity:0.5},200,function(){
	area.css({background:"#fff",opacity:1});
		});
	return false;
	}

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
			inputBlank($area);
			}
	});

	$('#server_close').click(function(){
		$(this).parents('.server_suc').hide();
	});
	$('a.close_btn').click(shut_center=function(){
		$(this).parents('.abs_center').hide();
		o_out();
	});
	$('body').keydown(function(e){
		if(e.which == 27)
		{
			shut_center();
			$('.abs_center').hide();
		}
		});
	$('#overlay').click(function(){
		shut_center();
		});
	$('#overlay').children().click(function(e){
		e.stopPropagation();
		});

	$('a.subscribe').click(function(){
		if($('.subs_suc').is(':visible'))return false;
		o_in();
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

/*form.check_valid*/
    $('form.check_valid').submit(function(){
        var $area = $(this).find('textarea');
        var txt = $area.val();
        if(txt=='')
        {
            inputBlank($area);
            return false;
        }
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
	var speed = 10000;
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
	var sliding=setInterval(RunSlide,speed);
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
	$('span.tips a').click(err_in);
	$('.err_tips').click(function(){
		if(errs_out==true)clearTimeout(errs_out);
		err_out();
		});
});
   var errs_out;
   function err_in(){
   $('.err_tips').fadeIn(600,function(){
		errs_out = setTimeout(err_out,3000);
		});
	}
	function err_out(){
	   $('.err_tips').fadeOut();
	}
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

/*faq_ask*/

	makeTips('#textarea1',200,'#textarea_span','#textarea_overflow');
	makeTips('.faq_text',30,'#input_span');
	makeTips('#f_input',500,'#span6_2','#overflow6_2');
	makeTips('#textarea6_3',500,'#span6_3','#overflow6_3');
	makeTips('#textarea2',400,'#ins_span','#overflow_ins');
	SecondTip('.area_text','.words_tip');
});

	function makeTips(str,sum,string1,string2)
	{
		$(str).bind('keyup keydown hover mouseover mouseout mousemove',function(){
			tips($(this),sum,string1,string2);
		});
	}
	function tips(element,total,span1,span2)
	{
		var len = element.val().length;
		var $span1 = $(span1);
		var $span2 = $(span2);
		var rest = total - len;
		if(rest<0)
		{
			$span1.hide();
			rest = Math.abs(rest);
			$span2.show().find('span').text(rest);
		}
		else
		{
			$span1.show().find('span').text(rest);
			$span2.hide();
		}
	}
	function SecondTip(element,node){
		$(element).bind('keyup keydown hover mouseover mouseout mousemove',function(){
			changeTips($(this),node);
		});
	}
	function changeTips(element,node){
		var num = element.val().length;
		if(num>140){$(node).css('color','#f00');}
		else{$(node).css('color','#8A8987');}
		$(node).text(num);
	}

/*regs*/
/*
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
})
*/
/*reg_suc*/

$(function(){
	$('.referr_input .radio_btn').click(function(){
		var num = $('.radio_btn').index(this);
		if(num==0)
		{
			$('#referr').fadeIn();
			}
		if(num ==1)
		{
			$('#referr').fadeOut()
		}
	})

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
		var shorts = $('#short').text();
		var medium = $('#medium').text();
		var strong = $('#strong').text();
		var pass = $(this).val();
		var num = getstren(pass);
		var w = num*100/32;
		if(w<40)
		{
			$('#ps_tip').text(shorts).css('color','#f00');
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
/*upload tag*/
$(function(){
	toggleItem();
	$('div.tags a').click(function(){
		var txt = $(this).text();
		add_tag(txt);
		});
	$('input.add_tag_on').click(function(){
		var txt = $('input.add_tag').val();
		if(txt!='')
		add_tag(txt);
		});
	del_tag();
});

function del_tag(){
	$('a.labels img').click(function(){
		$(this).parents('a.labels').remove();
		});
	}

function add_tag(text){
	var $list = $('div.tag_list');
	var $a = $('div.tag_list a');
	var arr = new Array();
	$a.each(function(i){
		arr.push($a.eq(i).text());
		});
	if($.inArray(text,arr)<0)
	{
		var $app = '<a href="javascript:void(0)" class="labels fl cr pr">'+text+'<img src="/assets/news/labels.png" /></a>';
		$list.append($app);
		toggleItem();
		del_tag();
	}
}

function toggleItem(){
	$('.tag_list a').hover(
	function(){
		$(this).children('img').css('visibility','visible');
	},function(){
		$(this).children('img').css('visibility','hidden');
	});
}
/*reg2*/

$(function(){
	var $status = $('input.status');
	$('.user_details').eq(1).hide();
	$status.click(function(){
		var num = $status.index(this);
		$('.user_details').eq(num).show().siblings('.user_details').hide();
	});

/*big_img*/
	$('.big_image').hover(function(){
		$(this).children('.pa').toggle();
	})

/*float_ads*/
	$('.shut_float').click(function(){
		$(this).parent().hide();
	})

/*qin_slide*/
	qin_slide('#qin_slide1 ');
	qin_slide('#qin_slide2 ');
	qin_slide('#qin_slide3 ');
	//qin_slide('#slide3 ');
/*over_text*/
        var $over = $('.over_text');
        var $p = $over.children('p').last();
        if($p.outerHeight()>100)
            {
                $over.after($("<a href='javascript:void(0)' class='fr ft12'>more>></a>"));
        }
        $('.profile_info a.fr').click(function(){
            $(this).hide();
            $over.addClass('text_hover');
        });
    $over.mouseleave(function(){
            $(this).removeClass('text_hover').next('a').show();
        });
});

			function qin_slide(ID){

				var page = 1;
				var i = 3;
				$(ID+'a.works_next').click(function(){
					var $parent = $(this).parent('div.works_list_slide');
					var $v_list = $parent.find('div.img_works_list');
					var $v_box = $parent.children('div.img_works_box');

					var v_width = $v_box.width();
					var len = $v_list.find('img').length;
					var page_count = Math.ceil(len/i);

					if(!$v_list.is(':animated')){
						if(page == page_count){
							$v_list.animate({'left':'0px'});
							page = 1;

						}else{
							$v_list.animate({'left':'-='+v_width});
							page++;
						}
					}
				})
				$(ID+'a.works_pre').click(function(){
					var $parent = $(this).parent('div.works_list_slide');
					var $v_list = $parent.find('div.img_works_list');
					var $v_box = $parent.children('div.img_works_box');

					var v_width = $v_box.width();
					var len = $v_list.find('img').length;
					var page_count = Math.ceil(len/i);
					if(!$v_list.is(':animated')){
						if(page == 1){
							$v_list.animate({left:'-='+v_width*(page_count-1)});
							page = page_count;

						}else{
							$v_list.animate({left:'+='+v_width});
							page--;
						}
					}
				})

				}

//转发
	$(function(){
		$('span.zf').hover(function(){
			$(this).parent('.p2').siblings('span.popup_zf').toggle();
			$(this).siblings('div.popup_zf').toggle();

		})

		$('.forward,.trans a').hover(function(){
			$(this).siblings('div.popup_zf').toggle();
		})
		$('.popup_zf').hover(function(){
			$(this).toggle();
		})
	})
/*color_trend 4-1-1*/
$(function(){
	var $item = $('div.galleryE div.list ul');
	var count = $item.find('li').size();
	var colsize = 8;
	var pwidth = $item.find('li').eq(0).width();
	var sp = 17;
	var wwidth = count * ( pwidth + sp ) - sp;
	var movewidth = pwidth + sp;
	var disabledClassName = "disabled";
	if( count > colsize ) {
		var $left	= $('div.galleryE span.moveleft');
		var $right	= $('div.galleryE span.moveright');
		function s(left) {
			if( typeof left != 'number' ) {
				left = parseInt($item.css('left')) || 0;
			}
			$left[ left >= 0 ? 'addClass' : 'removeClass' ](disabledClassName);
			$right[ ( -1 * left ) >= wwidth - ( colsize * ( movewidth ) - sp ) ? 'addClass' : 'removeClass' ](disabledClassName);
		}
		s();
		$left.click(function(){
			if( $(this).hasClass(disabledClassName) ) {
				return;
			}
			s( (parseInt($item.css('left')) || 0) + movewidth );
			$item.animate({
				"left" : "+="+movewidth+'px'
			}, 'fast');
		});
		$right.click(function(){
			if( $(this).hasClass(disabledClassName) ) {
				return;
			}
			s( (parseInt($item.css('left')) || 0) - movewidth );
			$item.animate({
				"left" : "-="+movewidth+'px'
			}, 'fast');
		});
	}

});