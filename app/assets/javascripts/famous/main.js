$(function(){
	//index imgbase images hover event
	$('.imgbase_show a').hover(function(){
		$(this).find('span:eq(1)').toggleClass('none')
	});
	//index subnav
	$('.nav li').hover(function(){
		$(this).find('ul').toggle()
	});
	//share
	$('.js-share_btn,.js-share_toggle').hover(function(){
		$('.js-share_toggle').toggle()
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
		$('#haxun').slider({
			buttons : false,
			pagers: '.circle_indicators'
		});
		$('#haxun_design_slide').slider({
			pagers: '.circle_indicators',
			margin : 16
		});
		$('#famous_online').slider({
			pagers: '.circle_indicators',
			margin : 38
		});
		$('#designs_in_slide').slider({
			pagers: '.circle_indicators',
			margin : 0
		});
		$('.gift_carousel').slider({
			auto: false,
			scroll: 1,
			// speed: 200,
			pagers: false,
			callback: function(index, e, that){
				var gift_carousel_height = that.find('li').eq(index).height();
				that.animate({height:gift_carousel_height},200)
				// alert(that.find('li').eq(index).height())
			}
		});
		$('.gift_carousel').each(function(){
			// alert($(this).find('table').eq(0).height())
			$(this).height($(this).find('table').eq(0).height())
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
			var options	= {
				data	: data // data变量数据从location.js得来
			}
			var sel = new LinkageSelect(options);
			sel.bind('.linkageseclet1 .level_1','0');
			sel.bind('.linkageseclet1 .level_2');
			sel.bind('.linkageseclet1 .level_3');

			var options2	= {
				data	: data // data变量数据从location.js得来
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

	;(function($){
		//左侧banner
		$('.js-banner_hover').on('mouseover mouseout','a',function(){
			$('.float_bann').addClass('hidden');
			$('.float_bann_big').removeClass('hidden');
		});
		$('.js-close').on('click', function(){
			$(this).parent().addClass('hidden');
			$(this).parent().siblings().removeClass('hidden');
		});
	}($));


	// master small img
	;(function($){
		// $('.master-list').on('click', '.master-bin li img', function(){
		// 	$(this).parents('div.master-pro').find('img').eq(0).attr('src', this.src);
		// });
		$('.master-detail p').each(function(){
			var that = $(this);
			var text = that.text();
			var txtlen = text.length;
			var num = 48;
			if(txtlen <= num) return;
			var length = txtlen > 96 ? 96 : txtlen;
			for(var i = 0; i < length; i ++){
				if(text.charCodeAt(i) < 127 && num < length){
					num ++;
				}
			}
			that.text(text.slice(0, num) + '...');
		});
	}($));

	//upload
	;(function($){
		$('#upload_tab a:first').tab('show');
		//
		$('.js-text_rest').bind('keydown keyup', function(){
			var len = $(this).val().length;
			var total = $(this).data('max');
			if (len > total) {
				$(this).val($(this).val().slice(0,total))
				return;
			};
			$(this).next().find('.js-text_rest_show').text(total - len);
		});
		//
		$('.js-reco_toggle').click(function(){
			$(this).siblings('.controls').toggleClass('hide');
			$(this).toggleClass('show');
		});
	}($));

	//review
	;(function($){
		$('.js-list_parent').on('click','.js-review_btn', function(){
			$(this).parent().siblings('form.js-review').show();
		});
		$('.js-list_parent').on('click','.js-review_cannel', function(){
			$(this).parents('form.js-review').hide();
		});
		//delete
		$('.js-list_parent').on('click','.js-delete',function(){
			$(this).parent('.state').remove();
		});
	}($));

	//famous
	;(function($){
		$('.js-show_content').css('cursor','pointer');
		$('.famous_list').on('click','.js-show_content',function(){
			var $parents = $(this).parents('li');
			$parents.addClass('bg').find('.famous_answer').show();
			$parents.find('.js-state').hide().siblings('.js-hide_content').show().css({'cursor':'pointer','margin-right':'8px'});
		});

		$('.famous_list').on('click','.js-hide_content',function(){
      // $(this).css()
      var $parents = $(this).parents('li');
      $parents.removeClass('bg').find('.famous_answer').hide();
      $(this).hide().siblings('.js-state').show()
    });

		//famous ask
		$('.js-text_percentage').bind('keydown keyup', function(){
			var len = $(this).val().length;
			var maxlenth = $(this).data('max');
			if (len > maxlenth) {
				$(this).val($(this).val().slice(0,maxlenth))
				return;
			};
			$(this).next().find('.js-text_lenth_show').text(len);
			$(this).next().find('.js-text_maxlenth').text(maxlenth);
		});
		//
		$('.famous_ask_form').on('click','.js-famous_options',function(){
			$(this).siblings('.select_options').show();
		});
		$('.famous_ask_form').on('click','.js-selects_close',function(){
			$(this).parent('.select_options').hide();
		});
		//famous ask select option
		$('.select_options')
		.on('change','select',function () {
			var str = '';
			var this_index = $(this).index('select');
			$(this).children('option:selected').each(function() {
				str = $( this ).text();
			});
			$('.select_options_show').children().eq(this_index - 1).text(str);
		})
		.change();
		//submit
		$('.js-famous_ask_submit').on('click',function(){
			var overview_val = $('.famous_ask_form').find('.js-text_percentage').val();
			var sort_text = $('.famous_ask_form').find('.select_options_show').children('span:eq(0)').text();
			var scope_text = $('.famous_ask_form').find('.select_options_show').children('span:eq(1)').text();
			if (overview_val == '') {
				alert('请输入问题概述')
				return false;
			}else if (sort_text == '' || scope_text == '') {
				alert('请选择分类')
				return false;
			};
		})
	}($));
});