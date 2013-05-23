$(function(){ //请将js代码统一放在此$(function)里面
	var ie6 = $.browser.msie && $.browser.version == 6,
		_$ = function(id){
			return document.getElementById(id);
		};
	// nav
	(function($){
		if(!ie6) return;
		$('.navBot li').hover(function(){
			$(this).find('ul').show();
		},function(){
			$(this).find('ul').hide();
		});
	})($);

	//kv
	(function($){
		var $slider = $('.kv2013_slider');
		if(!$slider.length) return;
    	var $ul = $slider.slider({
	            buttons : false,
	            speed : 800,
	            pagerClass : 'pager_rest',
				callback : function(n){
					var $img = $slider.find('img');
					$img.eq(n+1).trigger('slide');
				}
	        }).find('ul'),
	        num = $ul.find('li').length - 1;
	    $ul.css('margin-left', - (num * 45 + 12)/2 + 'px');
	})($);

	//grid
	(function($){
		var grid  = $('#grid'),
	    	$win  = $(window);
		if(!grid.length) return;
		var check = function(){
			var w = $win.width();
			grid['css'](
				w <= 1350 ? {
          			left : 0,
          			marginLeft : 0
        		} : {
            		left : '50%',
            		marginLeft : '-673px'
        		}
      		);
		};
		check();
		$win.resize(check);
	})($);

	//spring2013
	(function($){
		//spring_upload
		var spring_upload = $('.spring_upload');
		if(spring_upload.length === 0) return;
		spring_upload.click(function(){
			$('#spring_upload').click();
		});

		//spring_card
		$('.spring_form').submit(function(e){
			e.preventDefault();
			$('.spring_layer').show();
			$('.spring_card').show();
		});
		$('.spring_btn').click(function(){
			window.location.reload();
		});
	})($);

	//upload2013 toggle
	(function($){
		var $btn = $('.upload2013_btn');
		if($btn.length == 0) return;
		$btn.click(function(){
			$(this).toggleClass('upload2013_btn_down').next().toggle();
		});

		//inputs_count
		var $input = $('.inputs_count');
		if($input.length == 0) return;
		$input.bind('keydown keyup',function(){
			var $this = $(this),
				total = $this.data('count'),
				len =total - $this.val().length;
			if(len < 0) {
				$this.val($this.val().slice(0, total));
			} else{
				$this.parent().find('.inputs_count_tip').text(len);
			}
		});
	})($);

	//tabnav
	(function($){
		var default_show_id = $('.tabnav').children('.current').attr('data-tab');
		$(default_show_id).show();
		$('.tabnav').children().click(function(){
			var data_tab_id = $(this).attr('data-tab');
			$(this).addClass('current').siblings().removeClass('current');
			$(data_tab_id).show().siblings().hide();
		});

		//linkageselect
		if(typeof data != 'undefined'){
			var options	= {
				data	: data // data变量数据从location.js得来
			}
			var sel = new LinkageSelect(options);
					sel.bind('.linkageseclet1 .level_1','1');
		      sel.bind('.linkageseclet1 .level_2');
		      sel.bind('.linkageseclet1 .level_3');
		  }
	})($);

	(function($){
	  $('.channel_list a').click(function(){
	   $(this).parents('li').children('h3').children('a').css('color','#ff0000')
	  })
	})($);

  //color mood
  (function($){
      $('.btn_mood,.btn_public').hover(function(){
      	$(this).children('ul').toggle()
      });

      $('.color_mood_options li').hover(function(){
          $(this).siblings('li').removeClass('hover');
          $(this).addClass('hover');
      });
      $('.color_mood_options li a').click(function(){
          var color_value = $(this).css('background-color');
          $(this).parents('form').find('textarea').css('color', color_value);
      });
  })($);
  // lazyload 
  (function($){ 
  	if($.fn.lazyload){
  		$(".kv2013_slider img").lazyload({ 
  			event : "slide"
  			}).eq(0).trigger('slide').end().eq(1).trigger('slide'); 
  		$('.wrapper img').add('.imap img').add('.footer img').lazyload({
  			effect : 'fadeIn' 
  			}); 
  	}
  })($); 
});/*$*/