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
		var $lazy = $('.lazy'),
        $slider = $('.kv2013_slider'),
        count = 0;
    if(!$lazy.length || !$slider.length) return;
    $lazy.lazyload({
        event : "sporty",
        load : function(){
            count ++;
            if(count == $slider.children().length){
                var    $ul = $slider.slider({
                        buttons : false,
                        speed : 800,
                        pagerClass : 'pager_rest'
                    }).find('ul'),
                    num = $ul.find('li').length - 1;
                $ul.css('margin-left', - (num * 45 + 12)/2 + 'px');
            }
        }
    });
    $(window).bind("load", function(){
        $lazy.trigger("sporty");
    });
	})($);

	//grid
	(function($){
		var brush = _$('brush'),
			grid  = _$('grid'),
			bin   = _$('grid_brush'),
			$win  = $(window);
		if(!brush) return;
		$(brush).click(function(){
			this.style.display = 'none';
			grid.style.display = 'block';
		});
		$(grid).find('a').click(function(){
			grid.style.display = 'none';
			brush.style.display = 'block';
		});

		function check(){
			var w = $win.width();
			if(w <= 1780){
				bin.style.left = 0;
				bin.style.marginLeft = 0;
				brush.style.left = 0;
				brush.style.right = 'auto';
			} else {
				bin.style.left = '50%';
				bin.style.marginLeft = '-868px';
				brush.style.left = 'auto';
				brush.style.right = '-25px';
			}
		}
		check();
		$win.resize(check);
	})($);

	//gotop
	(function($){
		var gotop = $('#gotop');
		if(!gotop.length) return;
		gotop.click(function(){
			$('html,body').animate({'scrollTop':0},300);
			gotop.fadeOut();
		});
		$(window).scroll(function(){
			var h = $(this).scrollTop();
			h > 1000 && !gotop.is(':visible') && gotop.fadeIn();
			h <= 1000 && gotop.is(':visible') && gotop.fadeOut();
		});
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
			sel.bind('.linkageseclet .level_1','1');
			sel.bind('.linkageseclet .level_2');
			sel.bind('.linkageseclet .level_3');
		}
	})($);
});/*$*/