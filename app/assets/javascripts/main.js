/*search input*/
$(function(){
	var $input = $('.search input.fl,#username,.owner_search,.input_text');
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
function colors(){
	$('#overlay').fadeIn('fast').children().show();
}	
function close_all(){
	$('.abs_center').hide();
	o_out();
}
function prize_jan(){
	$('#prize_jan').show();
	o_in();
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
	$('a.login').click(show_login);

	$('a.server').click(function(){
		if(!$('.server_suc').is(':visible'))
		{
			$('.server_area').css('width','590px');
			$('div.server_input').show().find('textarea').val('');
		}
	});
	$('div.server_input').mouseleave(function(){
		var txt = $(this).find('textarea').val();
		if(txt=='')
		{
			$(this).hide();
			$('.server_area').css('width','41px');
		}
	});
	$('#server_submit').click(function(){
		var $area = $(this).parents('.server_input').find('textarea')
		var txt = $area.val();
		if(txt!='')
		{
			$('.server_input').hide().next().show();
		}
		else
		{
			inputBlank($area);
			return false;
			}
	});

	$('#server_close').click(function(){
		$(this).parents('.server_suc').hide();
		$('.server_area').css('width','41px');
	});

	$('a.close_btn').click(close_all);
	$('#overlay').click(close_all);
	
	$('body').keydown(function(e){
		if(e.which == 27){
			close_all();
		}
	});
	$('.gift_kv').click(prize_jan);

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
	$('.subs_suc :input').click(close_all);
	
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
	var $bin = $('.slides'),sliding;
	var w = $bin.width();
	var $con = $('.slidesContainer');
	$con.append($con.html());
	var $slider = $('.slider');
	var pages = $slider.length;
	pages = pages/2;
	var pager = 1;
	var $dot = $('.bullet');
	var num = 0;
	var speed = 6000;
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
		sliding = setTimeout(arguments.callee, speed);
	}

	$bin.hover(function(){
		clearTimeout(sliding);
	},function(){
		sliding = setTimeout(RunSlide,speed);
	}).trigger('mouseleave');

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
		$dot.eq(one).addClass('current').siblings().removeClass('current');
		$slider.animate({'left':'-'+one*w},_speed);
		pager = one+1;
	});
});

/*loginBg*//*
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
		//if(errs_out==true)clearTimeout(errs_out);
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
		var $app = '<a href="javascript:void(0)" class="labels fl cr pr">'+text+'<img src="images/news/labels.png" /></a>';
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
	var hh = $over.children('div').outerHeight();
	var h = $over.outerHeight();
	if(hh>h)
	{
		$over.after($("<a href='javascript:void(0)' class='fr ft12'>more>></a>"));
	}
	var msie6 = $.browser.msie && $.browser.version == 6.0;
	$('.profile_info a.fr').click(function(){
		$(this).hide();
		var $next = $(this).parents('.profile').next('.shadow');
		$over.addClass('text_hover');
		if(msie6)
 		{
			$next.css('margin-top',(h-hh+29)+'px');
		}
	});
	$over.mouseleave(function(){
		$(this).removeClass('text_hover').next('a').show();
		$next = $(this).parents('.profile').next('.shadow');
		if(msie6)
 		{
			$next.css('margin-top','0');
		}
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
		/*$('span.zf').hover(function(){
			$(this).parent('.p2').siblings('span.popup_zf').toggle();
			$(this).siblings('span.popup_zf').toggle();
			//$(this).siblings('div.popup_zf').toggle();
			
		})

		$('.forward,.trans a').hover(function(){
			//$(this).siblings('div.popup_zf').toggle();
			$(this).siblings('span.popup_zf').toggle();
		})

		$('.popup_zf').hover(function(){
			$(this).show();
		})*/
	/*$('span.zf')
	.mouseover(function(){
		$(this).parent('.p2').siblings('span.popup_zf').show().end();
	})
	.mouseout(function(){
		$(this).parent('.p2').siblings('span.popup_zf').hide().end()
	});
*/
	$('.transpond_popup').hide();
	$('.transpond_btn').hover(function(){
		$(this).children('span').toggle();
	});
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
	
/*user_email*/
	$('#user_type').change(function(){
		var target = $(this).children().last().text();
		var $email = $('#user_email');
		if($(this).val() == target)
		{
			$email.slideDown('slow');
		}
		else $email.slideUp('slow');
	});
});

$(function() {
	/*作品和灵感秀页面中-----编辑和删除*/
	$('.host_ins_edit,.host_works_edit').css('display','none')
	$('.ins_box').hover(function() {
		var img_h = $(this).children('a').children('img').innerHeight();
		var padding_top = $(this).parent().css('padding-top');
		var padding_right = $(this).parent().css('padding-right');
		//alert(parseFloat(padding_right))
		//alert(parseFloat(padding_top))
		$(this).children('.host_ins_edit').toggle();
		$(this).children('.host_ins_edit').css('top',img_h - 4 - parseFloat(padding_top) + "px")
		$(this).children('.host_ins_edit').css('right',padding_right)
	});

	$('.works_box').hover(function() {
		var img_h = $(this).children('a').children('img').innerHeight();
		var padding_top = $(this).children('a').children('img').css('padding-top');
		var padding_right = $(this).children('a').children('img').css('padding-right');
		//alert(padding_right)
		$(this).children('.host_works_edit').toggle();
		$(this).children('.host_works_edit').css('top',img_h - 20 - parseFloat(padding_top) + "px")
		$(this).children('.host_works_edit').css('right',padding_right)
	});
});

$(function(){
	//公开&私密
	$('.per_btn_area li ul').css('display','none');
	$(".per_btn_area li")
	.mouseover(function(){
		$(this).children('ul').show().end();
	})
	.mouseout(function(){
		$(this).children("ul").hide().end()
	});


	$('.per_public a').click(function(){
		var $txt_per_p = $(this).text();
		var $click_class = $(this).parent().attr('class');
		/*var $cur_class = $(this).parents('.per_public').attr('class')
		alert($cur_class)*/
		$(this).parents('.per_public').children('span').text($txt_per_p);
		$(this).parents('.per_public').attr('class','per_public ' + $click_class)

		$('.per_btn_area li ul').css('display','none');

	});
});

  //心情颜色
  $(function(){
    $('.per_mood_options li a').click(function(){
      var font_color = $(this).attr('data');
      $(this).parents('form').find('textarea').css('color','#' + font_color);
    })
  })


//话费积分
$(function(){
  var $width_a = $('.tel_rate_point a').outerWidth();
  var $height_table = $('.tel_rate_point table').outerHeight();
  //var $pl_table = parseInt($('.tel_rate_point').css('padding-left'));
//alert($pl_table)
  //alert($width_a)
  //alert($height_table)
  $('.tel_rate_point table').css({'display':'none'});
  $('.tel_rate_point').hover(function(){
    //$(this).css('border-color','#969696');
    $(this).children('a').toggleClass('a_hover')
    $(this).children('table').css({'left':$width_a-1, 'top':-$height_table/9*3});
    $(this).children('table').fadeToggle('fast')
  })
})


//imgbase reply
function reply_slideUp(remove_wrap){
	remove_wrap.slideUp(function(){
		$(this).remove();
	})
}
$(function(){
	//show reply textarea
	$('.js-reply').click(function(){		
		var img_reply2 = $(this).parents('.img_reply_item').children().hasClass('img_reply2');
		if(img_reply2 == false){
			reply_slideUp($('.img_reply2'))
			$('<form class="img_reply none img_reply2 fl"><h3>回复评论</h3><textarea></textarea><div><button class="img_reply_btn">提交回复</button><button class="img_reply_btn img_reply_btn_close js-reply_close">取消</button></div></form>').appendTo($(this).parents('.img_reply_item')).slideDown();
		}
	});
	//close reply textarea
	$('.img_reply_list').on('click','.js-reply_close',function(e){
		e.preventDefault();
		reply_slideUp($(this).parents('.img_reply2'))
	});
	//delate reply
	$('.reply_del').click(function(){
		reply_slideUp($(this).parents('.reply_margin'))
	});
	//show reply context
	// 	var $reply_context = $(this).parents('.img_reply2').children('textarea').val();
})

$(function(){
	$('.tab_content').children().hide().eq(0).show();
	$('.tab_nav li').click(function(){
		var index_num = $(this).index();
		var $index_num_con = $('.tab_content').children('div[class^="tab_con"]').eq(index_num);
		// console.log(index_num)
		// console.log($index_num_con.html())
		$(this).addClass('active').siblings().removeClass('active');
		$index_num_con.show().siblings().hide();
	})


	//pop
	$('.landing_overlay,.pop_rule').hide();
	$('.pop_btn').click(function(){
		$('.landing_overlay,.pop_rule').show();
	})
	$('.landing_overlay,.landing_popclose').click(function(){
		$('.landing_overlay').hide();
		$('.pop_rule').hide();
	})

	$('.js-remove').click(function(e){
		e.preventDefault();
		$(this).parents('li').remove();
	})


	//edit & delete work
	$(function() {
		$('.d_works li img').hover(function() {
			$(this).parents('li').children('.host_works_edit').toggle();
		})
		$('.host_works_edit').hover(function(){
			$(this).toggle()
		})
	})


	//point2 
	$(function(){
		//add exchange
		$('.js-exchange_btn').on('click', function(e){
			e.preventDefault();
			var parents_li = $(this).parents('li');
			var ex_img_url = parents_li.find('img[data-url="ex_img_url"]').attr('src');
			var ex_gift_name = parents_li.find('[data-name="ex_gift_name"]').text();
			var ex_point = parents_li.find('[data-point="ex_point"]').text();
			var ex_gift_num = parents_li.find('.num_input').val();

			if (ex_gift_num == 0) {
        alert("请选择数量");
        return false;
      }

			$('.js_checkall').append("<tr><td>" + 
				"<input type='checkbox' class='js-checkbox' checked>" +
				"<img src='" + ex_img_url + "'></td>" + 
				"<td>" + ex_gift_name + "<input type='hidden' value='" + ex_gift_name + "' name='gift_name[]' id='gift_name'></td>" +
				"<td class='tc js-unit_point'>" + ex_point + "分<input type='hidden' name='gift_point[]' id='gift_point' value='" + ex_point + "'></td>" +
				"<td class='tc'><p class='ft12 change_num clear pb10'><a href='javascript:;' class='num_plus fr js_plus'></a><input name='gift_number[]' id='gift_number' class='num_input fr' type='text' value='" + ex_gift_num + "'><a href='javascript:;' class='num_minus fr js_minus'></a></p></td>" +
				"<td class='tc js-sum_point js-sum_point_on'>" + (ex_gift_num*ex_point) + "分<input type='hidden' name='total_gift_point[]' id='total_gift_point' value='" + (ex_gift_num*ex_point) + "'></td><td class='tc'><a class='gifts_del js_gifts_del' href='javascript:;'>删除</a></td></tr>");
			add()
		});


		function total_numpoint (that,input_val){
			var unit_point_td = $(that).parents('tr').children('.js-unit_point');
			var unit_point = $(that).parents('tr').children('.js-unit_point').find('input').val();
			var sum_point_td = $(that).parents('tr').children('.js-sum_point');
			var sum_point = unit_point * input_val;
			var total_point = $(that).parents('form').find('.js-total_point');
			if (unit_point_td.length >0) {
				sum_point_td.text(sum_point + '分');
				total_point.text()
			};
		};

		function add(){
			var sum = $('.js_checkall').find('.js-sum_point_on');
			var arr = sum.map(function(i, td){
				return parseInt(td.innerHTML);
			});
			var total = 0;
			for (var i = arr.length; i-- ; ) {
				total += arr[i];
			}
			$('#total_point').text(total);
		}

		$('.js_checkall').on('change','.js-checkbox',function(){
			var $this = $(this);
			var prop = $this.prop('checked');
			var td = $this.parents('tr').find('.js-sum_point');
			if(prop) td.addClass('js-sum_point_on');
			else td.removeClass('js-sum_point_on');
			add()
		});


		//—— change number
		$('.js_checkall,.gifts_list').on('click','.js_minus',function(){
			var input = $(this).siblings('input');
			var input_val = $(this).siblings('input').val();
			if (input_val > 0) {
				input_val --
			}else {
				input_val = 0;
			};
			// console.log(input_val)
			input.val(input_val);
			total_numpoint(this,input_val);
			add()
		});
		$('.js_checkall,.gifts_list').on('click','.js_plus',function(){
			var input = $(this).siblings('input');
			var input_val = $(this).siblings('input').val();
			if (input_val >= 0) {
				input_val++
			} else {
				input_val = 1;
			}
			// console.log(input_val)
			input.val(input_val);
			total_numpoint(this,input_val);
			add()
		});

		//del
		$('.js_checkall').on('click','.js_gifts_del',function(){
			// console.log(00)
			$(this).parents('tr').remove();
			add();
		});
		
		//options-checkbox all or none
		$('.js_checkall').on('click','#checkall',function(){
			$(this).parents('table').find('.js-checkbox').prop('checked',this.checked).trigger('change');
		});

		$('.num_input').keyup(function(){
			if(isNaN(this.value)){
				this.value = 0;
				total_numpoint(this,0);
			}
			else {
				total_numpoint(this,this.value);
				add();
			}
		})
	});
})