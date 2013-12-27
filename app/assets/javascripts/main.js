// forward

$(function(){
    if ($("span.zf")) {
        $(".popup_zf_qq, .popup_zf_sina, .popup_zf_rr, .popup_zf_kaixin").click(function(e){
            var parent_node = $(this).parent();
            var url = $(parent_node).attr("data-url");
            var title = $(parent_node).attr("data-title");
            var pic = $(parent_node).attr("data-pic");
            var webid = $(this).attr("data-webid");
            var dataId = $(parent_node).attr("data-id");
            var dataType = $(parent_node).attr("data-type");
            $.post("/scores/share_score",
            {
                share_id : webid,
                data_id : dataId,
                data_type : dataType
            },
            function(data){
                var $zf_text = parent_node.prev().children('span');
                if(new RegExp("转发").test($zf_text.text()) || $zf_text.find('i.icon-share1').length){
                    var $zf_num = $zf_text.children('em');
                    $zf_num.text($zf_num.text()*1+1);
                };

            });
            window.open("http://www.jiathis.com/send/?webid="+webid+"&url="+url+"&title="+title+"&pic="+pic);
        });
    };
});

/*search input*/
$(function(){
    var $input = $('.search input.fl,#username,.owner_search,#host_main,.input_text');
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
// $(function(){
//     $('.jiathis_btn').hover(function(){
//         $('.jiathis_area').show();
//     },function(){
//         $('.jiathis_area').hide();
//     });
//     $('.jiathis_area').hover(function(){
//         $(this).toggle();
//     });
// });
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
    $("#design_message").hide();
}

function prize_jan(){
    $('#prize_jan').show();
    o_in();
}

function colors(){
    o_in();
    $("#design_message").show();
}

function close_all(){
    $('.abs_center').hide();
    $('.unlogin').hide();
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
    // $('a.login').click(show_login);
    // $('a.server').click(function(){
    //     if(!$('.server_suc').is(':visible'))
    //     {
    //         $('.server_area').css('width','590px');
    //         $('div.server_input').show().find('textarea').val('');
    //     }
    // });
    // $('div.server_input').mouseleave(function(){
    //     var txt = $(this).find('textarea').val();
    //     if(txt=='')
    //     {
    //         $(this).hide();
    //         $('.server_area').css('width','41px');
    //     }
    // });

    $('.gift_kv').click(prize_jan);

    $('#server_submit').click(function(){
        var $area = $(this).parents('.server_input').find('textarea')
        var txt = $area.val();
        if(txt!='')
        {
            $('.server_input').hide().next().show();
        }
        else{
            inputBlank($area);
            return false;
            }
    });

    $('#server_close').click(function(){
        $(this).parents('.server_suc').hide();
        $('.server_area').css('width','41px');
    });
  $('a.close_btn').click(close_all);
  // $('#overlay').click(close_all);

    $('body').keydown(function(e){
        if(e.which == 27){
      close_all();
        }
        });

/*  $('a.subscribe').click(function(){
        if($('.subs_suc').is(':visible'))return false;
        o_in();
        $('#july_last').show().find('input[type=text]').val('');
        $('.subs_err').hide();
    });*/
    $('form#subs_form').submit(function(){
        var subs = $('#subs_form :input[type=text]').val();
        if(isEmail(subs))
        {
            $('.subs_err').hide();
            $('#july_last').hide();
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
    $('.faqs_title').live('click',function(){
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
    makeTips('#inspiration_content',400,'#july_26','#overflow6_4')
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
        var num = $('.referr_input .radio_btn').index(this);
        if(num==0)
        {
            $('#referr').fadeIn();
            }
        if(num ==1)
        {
            $('#referr').fadeOut()
        }
    })

    $('.update_password .radio_btn').click(function(){
        var num = $('.update_password .radio_btn').index(this);
        if(num==0)
        {
            $('#password_update').fadeIn();
            }
        if(num ==1)
        {
            $('#password_update').fadeOut()
        }
    })

    var urls = $('.reg_suc a').attr('href');
    var timer_num =5;

    if(urls){
         setTimeout(timer,1000);
    }
    function timer(){
         if(timer_num == 0){
              window.location.href=urls;
              return;
         }
         else{
              timer_num--;
              $('.reg_suc span.cr').text(timer_num);
              setTimeout(timer,1000);
         }
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
//  var $over = $('.over_text');
//  var hh = $over.children('div').outerHeight();
//  var h = $over.outerHeight();
//  if(hh>h)
//  {
//      $over.after($("<a href='javascript:void(0)' class='fr ft12'>more>></a>"));
//  }
//
//  $('.profile_info a.fr').click(function(){
//      $(this).hide();
//        var $next = $(this).parents('.profile').next('.shadow');
//      $over.addClass('text_hover');
//      if(msie6)
//      {
//          $next.css('margin-top',(h-hh+29)+'px');
//      }
//  });
//  $over.mouseleave(function(){
//      $next = $(this).parents('.profile').next('.shadow');
//      if(msie6)
//      {
//          $next.css('margin-top','0');
//      }
//  });
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
   $(this).siblings('span.popup_zf').toggle();
   //$(this).siblings('div.popup_zf').toggle();

  })
  $('.zhuanfa').hover(function(){
    $(this).next('.popup_zf').toggle();
  });

  $('.forward,.trans a').hover(function(){
   //$(this).siblings('div.popup_zf').toggle();
   $(this).siblings('span.popup_zf').toggle();
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
        var $left   = $('div.galleryE span.moveleft');
        var $right  = $('div.galleryE span.moveright');
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
    $('#user_type').change(function() {
        var $email = $('#user_email');
        if ($(this).val() == 'user') {
            $email.show();
        }
        else $email.hide();
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
        var $is_privacy = $(this).attr('data');
        var $click_class = $(this).parent().attr('class');

        $("#is_privacy").val($is_privacy);
        $(this).parents('.per_public').children('span').text($txt_per_p);
        $(this).parents('.per_public').attr('class','per_public ' + $click_class)

        $('.per_btn_area li ul').css('display','none');

    });
});


  //心情颜色
  $(function(){
    $('.per_mood_options li a').click(function(){
      var font_color = $(this).attr('data');
      var font_color_code = $(this).attr('data-code');
      var font_color_name = $(this).attr('data-name');

      $(this).parents('form').find('textarea').css('color','#' + font_color);
      $("#font_color").val(font_color);
      $("#color_code").val(font_color_code);
      $("#color_name").val(font_color_name);
    });
  });

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

jQuery.easing['jswing'] = jQuery.easing['swing'];

jQuery.extend( jQuery.easing,
{
 def: 'easeOutQuad',
 swing: function (x, t, b, c, d) {
  return jQuery.easing[jQuery.easing.def](x, t, b, c, d);
 },
 easeOutQuad: function (x, t, b, c, d) {
  return -c *(t/=d)*(t-2) + b;
 },
 easeOutExpo: function (x, t, b, c, d) {
  return (t==d) ? b+c : c * (-Math.pow(2, -10 * t/d) + 1) + b;
 }
});

$(function(){
    //show reply textarea
    $('.js-reply').live('click', function(e){
        dom = $(e.currentTarget);
        dom.parents('.img_reply_item').siblings().children('form').slideUp();
    dom.parents('.this_btn').siblings('.img_reply2').slideToggle();
    });
    $('.js-reply_close').click(function(e){
        e.preventDefault();
        $(this).parents('.img_reply2').slideUp();
    });
    //gotop
    (function($){
        var gotop = $('#gotop'),
            $win  = $(window),
            ie6 = $.browser.msie && $.browser.version == 6.0;
        if(!gotop.length || ie6) return;
        gotop.hide().click(function(){
            $('html,body').animate({'scrollTop':0},300);
            gotop.fadeOut();
        });
        $(window).scroll(function(){
            var h = $(this).scrollTop();
            h > 1000 && !gotop.is(':visible') && gotop.fadeIn();
            h <= 1000 && gotop.is(':visible') && gotop.fadeOut();
        });
        var check = function(){
            var w = $win.width();
            gotop['css'](
                w <= 1350 ? {
                    left : 'auto',
                    right : 0,
                    marginLeft : 0
                } : {
                    left : '50%',
                    right : 'auto',
                    marginLeft : '590px'
                }
            );
        };
        check();
        $win.resize(check);
    })($);
});

$(function(){
  $('.js-yda .tab_content').children().hide().eq(0).show();
  $('.js-yda .tab_nav li').click(function(){
      var index_num = $(this).index();
      var $index_num_con = $('.js-yda .tab_content').children('div[class^="tab_con"]').eq(index_num);
      $(this).addClass('active').siblings().removeClass('active');
      $index_num_con.show().siblings().hide();
  });
  //pop
    $('.landing_overlay,.pop_rule').hide();
    $('.pop_btn').click(function(){
        $('.landing_overlay,.pop_rule').show();
    });
    $('.landing_overlay,.landing_popclose').click(function(){
        $('.landing_overlay').hide();
        $('.pop_rule').hide();
    });
});
$(function(){
    //index imgbase images hover event
    $('.imgbase_show a').hover(function(){
        $(this).find('span:eq(1)').toggleClass('none')
    });
    //index subnav
    $('.nav li').hover(function(){
        $(this).find('ul').toggle()
    });
    //share jiathis
    $('.js-share_btn').hover(function(){
        $('.jiathis_area').toggle()
    });
    $(".jiathis_area").mouseover(function(){
      $(this).show()
    }).mouseout(function(){
      $(this).hide()
    });
    //li:hover js
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
        $('.channel_slide').slider({
            buttons : false,
            auto : false,
            scroll : 3,
            pagers : '.chann_indicators'
        });
        $('#refresh_slide').slider({
            buttons : false,
            scroll : 1,
            pagers : '.circle_indicators'
        });
    })($);

    // back top
    ;(function($){
        // console.log($(window).width())
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

    ;(function($){
        //linkageselect
        if(typeof data != 'undefined'){
            var options = {
                data    : data // data变量数据从location.js得来
            }
            var sel = new LinkageSelect(options);
            sel.bind('.linkageseclet1 .level_1','0');
            sel.bind('.linkageseclet1 .level_2');
            sel.bind('.linkageseclet1 .level_3');

            var options2    = {
                data    : data // data变量数据从location.js得来
            }
            var sel2 = new LinkageSelect(options2);
            sel2.bind('.linkageseclet2 .level_1','0');
            sel2.bind('.linkageseclet2 .level_2');
            sel2.bind('.linkageseclet2 .level_3');
        }
    })($);

    ;(function($){
        //mood color
        function hover_toggle (btnclass, sec){
            $('[data-hover="hover_toggle"]').hide();
            btnclass.on('mouseenter mouseleave', function(){
                $(this).children('[data-hover="hover_toggle"]').toggle();
            });
            if(sec){
                btnclass.find('a').on('click', function(){//console.log(sec)
                    var color_value = $(this).css('background-color');
                    $(this).parents('form').find('textarea').css('color', color_value);
                });
            };
        };
        hover_toggle($('.js_hovertoggle'))
        hover_toggle($('.js_colors'), true)
    })($);

    // map-list
    ;(function($){
        var form = $('.map-list-search');

        $('.map-list-nav').on('click', 'li', function(){
            var that = $(this);
            var index = that.index();
            that.addClass('list-curr').siblings().removeClass();
            form.eq(index).show().siblings().hide();
        });

        $('.map-srch-bin').on('click', '.map-srch-del', function(){
            $(this).parent().remove();
        });

        $('.map-list-up').click(function(){
            var that = $(this);
            if(that.hasClass('map-list-down')){
                that.removeClass('map-list-down').text('收起');
            } else {
                that.addClass('map-list-down').text('展开');
            }
            that.parent().toggleClass('map-mini');
        });

        $('.map-srch-reset').click(function(){
            $(this).siblings('span').remove();
        });

        if($.fn.masonry){
            $(window).load(function () {
                $('#map-flow').masonry({
                    width: 230
                });
            });
        }
    }($));
    ;(function($){
        $('.js-img_show').on('click', '.js-title', function(){
            $(this).parent('li').siblings().find('a.js-img').hide();
            $(this).parent('li').addClass('active').siblings('li').removeClass('active')
            $(this).siblings('a.js-img').show();
        })
    }($));

    ;(function($){
        $('.js-ask_btn').click(function(){
            $(this).children('.ask_form').show();
        });
        $('.js-ask_btn').mouseleave(function(){
            $('.ask_form').hide();
        })
    }($));
});