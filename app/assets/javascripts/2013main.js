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
		if($slider.length == 0) return;
		var	$ul = $slider.slider({
				buttons : false,
				speed : 800,
				pagerClass : 'pager_rest'
			}).find('ul'),
			num = $ul.find('li').length - 1;
		$ul.css('margin-left', - (num * 45 + 12)/2 + 'px');
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
});

(function($){
$(function(){
    //upload2013 toggle
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
});
})($);