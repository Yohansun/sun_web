// forward
function o_in(){$("#overlay").fadeIn("fast")}function o_out(){$("#overlay").fadeOut()}function show_login(){o_in(),$(".unlogin").show(),$("#design_message").hide()}function colors(){o_in(),$("#design_message").show()}function close_all(){$(".abs_center").hide(),o_out()}function inputBlank(a){return a.css({background:"#fcc",opacity:0}).animate({opacity:1},200),a.animate({opacity:.5},200),a.animate({opacity:1},200),a.animate({opacity:.5},200,function(){a.css({background:"#fff",opacity:1})}),!1}function makeTips(a,b,c,d){$(a).bind("keyup keydown hover mouseover mouseout mousemove",function(){tips($(this),b,c,d)})}function tips(a,b,c,d){var e=a.val().length,f=$(c),g=$(d),h=b-e;h<0?(f.hide(),h=Math.abs(h),g.show().find("span").text(h)):(f.show().find("span").text(h),g.hide())}function SecondTip(a,b){$(a).bind("keyup keydown hover mouseover mouseout mousemove",function(){changeTips($(this),b)})}function changeTips(a,b){var c=a.val().length;c>140?$(b).css("color","#f00"):$(b).css("color","#8A8987"),$(b).text(c)}function getstren(a){return intScore=0,a.match(/[a-z]/)&&(intScore+=1),a.match(/[A-Z]/)&&(intScore+=5),a.match(/\d+/)&&(intScore+=5),a.match(/(\d.*\d.*\d)/)&&(intScore+=5),a.match(/[!,@#$%^&*?_~]/)&&(intScore+=5),a.match(/([!,@#$%^&*?_~].*[!,@#$%^&*?_~])/)&&(intScore+=5),a.match(/[a-z]/)&&a.match(/[A-Z]/)&&(intScore+=2),a.match(/\d/)&&a.match(/\D/)&&(intScore+=2),a.match(/[a-z]/)&&a.match(/[A-Z]/)&&a.match(/\d/)&&a.match(/[!,@#$%^&*?_~]/)&&(intScore+=2),intScore}function del_tag(){$("a.labels img").click(function(){$(this).parents("a.labels").remove()})}function add_tag(a){var b=$("div.tag_list"),c=$("div.tag_list a"),d=new Array;c.each(function(a){d.push(c.eq(a).text())});if($.inArray(a,d)<0){var e='<a href="javascript:void(0)" class="labels fl cr pr">'+a+'<img src="/assets/news/labels.png" /></a>';b.append(e),toggleItem(),del_tag()}}function toggleItem(){$(".tag_list a").hover(function(){$(this).children("img").css("visibility","visible")},function(){$(this).children("img").css("visibility","hidden")})}function qin_slide(a){var b=1,c=3;$(a+"a.works_next").click(function(){var a=$(this).parent("div.works_list_slide"),d=a.find("div.img_works_list"),e=a.children("div.img_works_box"),f=e.width(),g=d.find("img").length,h=Math.ceil(g/c);d.is(":animated")||(b==h?(d.animate({left:"0px"}),b=1):(d.animate({left:"-="+f}),b++))}),$(a+"a.works_pre").click(function(){var a=$(this).parent("div.works_list_slide"),d=a.find("div.img_works_list"),e=a.children("div.img_works_box"),f=e.width(),g=d.find("img").length,h=Math.ceil(g/c);d.is(":animated")||(b==1?(d.animate({left:"-="+f*(h-1)}),b=h):(d.animate({left:"+="+f}),b--))})}$(function(){$("span.zf")&&$(".popup_zf_qq, .popup_zf_sina, .popup_zf_rr, .popup_zf_kaixin").click(function(a){var b=$(this).parent(),c=$(b).attr("data-url"),d=$(b).attr("data-title"),e=$(b).attr("data-pic"),f=$(this).attr("data-webid"),g=$(b).attr("data-id"),h=$(b).attr("data-type");$.post("/scores/share_score",{share_id:f,data_id:g,data_type:h},function(a){var c=b.prev().children("span");if((new RegExp("转发")).test(c.text())){var d=c.children("em");d.text(d.text()*1+1)}}),window.open("http://www.jiathis.com/send/?webid="+f+"&url="+c+"&title="+d+"&pic="+e)})}),$(function(){var a=$(".search input.fl,#username,.owner_search,#host_main,.input_text");a.focus(function(){var a=$(this).val();a==this.defaultValue&&$(this).val("")}),a.blur(function(){var a=$(this).val();a==""&&$(this).val(this.defaultValue)})}),$(function(){$(".jiathis_btn").hover(function(){$(".jiathis_area").show()},function(){$(".jiathis_area").hide()}),$(".jiathis_area").hover(function(){$(this).toggle()})}),$(function(){function a(a){var b=/^([a-zA-Z0-9._-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;return b.test(a)}$("a.login").click(show_login),$("a.server").click(function(){$(".server_suc").is(":visible")||($(".server_area").css("width","590px"),$("div.server_input").show().find("textarea").val(""))}),$("div.server_input").mouseleave(function(){var a=$(this).find("textarea").val();a==""&&($(this).hide(),$(".server_area").css("width","41px"))}),$("#server_submit").click(function(){var a=$(this).parents(".server_input").find("textarea"),b=a.val();if(b=="")return inputBlank(a),!1;$(".server_input").hide().next().show()}),$("#server_close").click(function(){$(this).parents(".server_suc").hide(),$(".server_area").css("width","41px")}),$("a.close_btn").click(close_all),$("#overlay").click(close_all),$("body").keydown(function(a){a.which==27&&close_all()}),$("form#subs_form").submit(function(){var b=$("#subs_form :input[type=text]").val();return a(b)?($(".subs_err").hide(),$("#july_last").hide(),$(".subs_suc").show()):$(".subs_err").show(),!1}),$(".subs_suc :input").click(close_all)}),$(function(){function l(){e.is(":animated")||(g==f+1?(e.css("left","0"),e.animate({left:"-="+c},k),g=2,i=1):(e.animate({left:"-="+c},k),g++,i=g-1)),i==f&&(i=0),h.eq(i).addClass("current").siblings().removeClass("current")}var a=$(".slides"),b,c=a.width(),d=$(".slidesContainer");d.append(d.html());var e=$(".slider"),f=e.length;f/=2;var g=1,h=$(".bullet"),i=0,j=5e3,k=1500;a.hover(function(){clearInterval(b)},function(){b=setInterval(l,j)}).trigger("mouseleave"),h.click(function(){var a=h.index(this);if(a==0){if(g==f+1||g==1)return!1}else a==1&&g==f+1&&(e.is(":animated")||e.css("left","0"));e.stop(!0),h.eq(a).addClass("current").siblings().removeClass("current"),e.animate({left:"-"+a*c},k),g=a+1})}),$(function(){$(".history").mouseover(function(){$(".historys").show()}).mouseout(function(){$(".historys").hide()}),$(".historys").hover(function(){$(this).toggle()})}),$(function(){var a=1,b=600;$("a.app_next").click(function(){var c=$(".app_slides"),d=c.width(),e=$(".app_container"),f=e.children("a").length;e.is(":animated")||(a!=f?(e.animate({left:"-="+d},b),a++):(e.animate({left:"0"},b),a=1))}),$("a.app_prev").click(function(){var c=$(".app_slides"),d=c.width(),e=$(".app_container"),f=e.children("a").length;e.is(":animated")||(a!=1?(e.animate({left:"+="+d},b),a--):(e.animate({left:"-"+(f-1)*d},b),a=4))})}),$(function(){$(".faqs_title").live("click",function(){$(this).children(".tips_bullet").toggleClass("show").end(),$(this).next().toggle()}),$(".navBot li").hover(function(){$(this).find("ul").show()},function(){$(this).find("ul").hide()}),makeTips("#textarea1",200,"#textarea_span","#textarea_overflow"),makeTips(".faq_text",30,"#input_span"),makeTips("#f_input",500,"#span6_2","#overflow6_2"),makeTips("#textarea6_3",500,"#span6_3","#overflow6_3"),makeTips("#textarea2",400,"#ins_span","#overflow_ins"),SecondTip(".area_text",".words_tip"),makeTips("#inspiration_content",400,"#july_26","#overflow6_4")}),$(function(){function c(){if(b==0){window.location.href=a;return}b--,$(".reg_suc span.cr").text(b),setTimeout(c,1e3)}$(".referr_input .radio_btn").click(function(){var a=$(".referr_input .radio_btn").index(this);a==0&&$("#referr").fadeIn(),a==1&&$("#referr").fadeOut()}),$(".update_password .radio_btn").click(function(){var a=$(".update_password .radio_btn").index(this);a==0&&$("#password_update").fadeIn(),a==1&&$("#password_update").fadeOut()});var a=$(".reg_suc a").attr("href"),b=5;a&&setTimeout(c,1e3)}),$(function(){$(".pass_check").keyup(function(){var a=$("#short").text(),b=$("#medium").text(),c=$("#strong").text(),d=$(this).val(),e=getstren(d),f=e*100/32;f<40?($("#ps_tip").text(a).css("color","#f00"),$("#ps_status").css("background","#f00")):f<80?($("#ps_tip").text(b).css("color","#F9A60D"),$("#ps_status").css("background","#F9A60D")):($("#ps_tip").text(c).css("color","#008200"),$("#ps_status").css("background","#008200")),$("#ps_status").css("width",f+"%")})}),$(function(){toggleItem(),$("div.tags a").click(function(){var a=$(this).text();add_tag(a)}),$("input.add_tag_on").click(function(){var a=$("input.add_tag").val();a!=""&&add_tag(a)}),del_tag()}),$(function(){var a=$("input.status");$(".user_details").eq(1).hide(),a.click(function(){var b=a.index(this);$(".user_details").eq(b).show().siblings(".user_details").hide()}),$(".big_image").hover(function(){$(this).children(".pa").toggle()}),$(".shut_float").click(function(){$(this).parent().hide()}),qin_slide("#qin_slide1 "),qin_slide("#qin_slide2 "),qin_slide("#qin_slide3 ")}),$(function(){$("span.zf").hover(function(){$(this).parent(".p2").siblings("span.popup_zf").toggle(),$(this).siblings("span.popup_zf").toggle()}),$(".forward,.trans a").hover(function(){$(this).siblings("span.popup_zf").toggle()}),$(".popup_zf").hover(function(){$(this).toggle()})}),$(function(){var a=$("div.galleryE div.list ul"),b=a.find("li").size(),c=8,d=a.find("li").eq(0).width(),e=17,f=b*(d+e)-e,g=d+e,h="disabled";if(b>c){var i=$("div.galleryE span.moveleft"),j=$("div.galleryE span.moveright");function k(b){typeof b!="number"&&(b=parseInt(a.css("left"))||0),i[b>=0?"addClass":"removeClass"](h),j[-1*b>=f-(c*g-e)?"addClass":"removeClass"](h)}k(),i.click(function(){if($(this).hasClass(h))return;k((parseInt(a.css("left"))||0)+g),a.animate({left:"+="+g+"px"},"fast")}),j.click(function(){if($(this).hasClass(h))return;k((parseInt(a.css("left"))||0)-g),a.animate({left:"-="+g+"px"},"fast")})}$("#user_type").change(function(){var a=$("#user_email");$(this).val()=="user"?a.show():a.hide()})}),$(function(){$(".host_ins_edit,.host_works_edit").css("display","none"),$(".ins_box").hover(function(){var a=$(this).children("a").children("img").innerHeight(),b=$(this).parent().css("padding-top"),c=$(this).parent().css("padding-right");$(this).children(".host_ins_edit").toggle(),$(this).children(".host_ins_edit").css("top",a-4-parseFloat(b)+"px"),$(this).children(".host_ins_edit").css("right",c)}),$(".works_box").hover(function(){var a=$(this).children("a").children("img").innerHeight(),b=$(this).children("a").children("img").css("padding-top"),c=$(this).children("a").children("img").css("padding-right");$(this).children(".host_works_edit").toggle(),$(this).children(".host_works_edit").css("top",a-20-parseFloat(b)+"px"),$(this).children(".host_works_edit").css("right",c)})}),$(function(){$(".per_btn_area li ul").css("display","none"),$(".per_btn_area li").mouseover(function(){$(this).children("ul").show().end()}).mouseout(function(){$(this).children("ul").hide().end()}),$(".per_public a").click(function(){var a=$(this).text(),b=$(this).attr("data"),c=$(this).parent().attr("class");$("#is_privacy").val(b),$(this).parents(".per_public").children("span").text(a),$(this).parents(".per_public").attr("class","per_public "+c),$(".per_btn_area li ul").css("display","none")})}),$(function(){$(".per_mood_options li a").click(function(){var a=$(this).attr("data"),b=$(this).attr("data-code"),c=$(this).attr("data-name");$(this).parents("form").find("textarea").css("color","#"+a),$("#font_color").val(a),$("#color_code").val(b),$("#color_name").val(c)})}),$(function(){var a=$(".tel_rate_point a").outerWidth(),b=$(".tel_rate_point table").outerHeight();$(".tel_rate_point table").css({display:"none"}),$(".tel_rate_point").hover(function(){$(this).children("a").toggleClass("a_hover"),$(this).children("table").css({left:a-1,top:-b/9*3}),$(this).children("table").fadeToggle("fast")})}),jQuery.easing.jswing=jQuery.easing.swing,jQuery.extend(jQuery.easing,{def:"easeOutQuad",swing:function(a,b,c,d,e){return jQuery.easing[jQuery.easing.def](a,b,c,d,e)},easeOutQuad:function(a,b,c,d,e){return-d*(b/=e)*(b-2)+c},easeOutExpo:function(a,b,c,d,e){return b==e?c+d:d*(-Math.pow(2,-10*b/e)+1)+c}});