/*
function _scrollTo(y,time,step) {
	if( typeof y != 'number' ) return;
	if( typeof y != 'number' || time < 10 ) {
		time = 10;
	}
	if( typeof y != 'number' || time < 1 ) {
		step = 10;
	}
	var _this = arguments.callee;
	_this.crolling = true;
	var current = document.documentElement.scrollTop || document.body.scrollTop;
	if( y == current ) {
		_this.crolling = false;
		return;
	}
	var p = y - current;
	if( Math.abs(p) < step ) {
		window.scrollTo(0,y);
		return;
	}
	var timer = setInterval(function(){
		var current = document.documentElement.scrollTop || document.body.scrollTop;
		if( Math.abs(y - current) <= Math.abs(step) ) {
			window.scrollTo(0,y);
			_this.scrolling = false;
			clearInterval(timer);
		} else {
			window.scrollBy(0,step);
		}
	}, time);
}
*/
function _scrollTo(y,time,times) {
	var _this = arguments.callee;
	_this.crolling = true;
	var current = document.documentElement.scrollTop || document.body.scrollTop;
	if( y == current ) {
		_this.crolling = false;
		return;
	}
	var p = y - current;
	if( times > Math.abs( p ) ) {
		times = Math.abs( p );
	}
	var pc = parseInt(p/times);
	/*var timer = setInterval(function(){
		var current = document.documentElement.scrollTop || document.body.scrollTop;
		if( Math.abs(y - current) <= Math.abs(pc) ) {
			window.scrollTo(0,y);
			_this.scrolling = false;
			clearInterval(timer);
		} else {
			window.scrollBy(0,pc);
		}
	}, time);*/
	var timer = setTimeout(function(){
		var _this = arguments.callee;
		var current = document.documentElement.scrollTop || document.body.scrollTop;
		if( Math.abs(y - current) <= Math.abs(pc) ) {
			window.scrollTo(0,y);
			_this.scrolling = false;
			clearTimeout(timer);
		} else {
			window.scrollBy(0,pc);
			timer = setTimeout(_this,time);
		}
	},time);
}


$(window).ready(function(){
	/*$('#design_appreciation .titlebar').fadeTo(800, 0, function(){
		$('#design_appreciation div.inner').animate({
			'marginLeft': '0',
			'marginTop'	: '0',
			'width'		: '264px',
			'height'	: '290px'
		}, 500);
	});*/
	var $top1content = $('div.top1content');
	var $top1mask = $('div.top1mask');
	var $design_appreciation = $('#design_appreciation');
	var $master_palace = $('#master_palace');

	// 第一步 家装资讯
	var step1 = function(){
		window.scrollTo(0,0);
		var $infor = $('#information li');
		var il = $infor.size();
		if( il ) {
			_scrollTo(500,50,40);
			var current = il-1;
			function infor_fade(){
				$infor.eq(current).fadeTo(300,0,function(){
					current--;
					if( current > -1 ) {
						infor_fade();
					} else {
						setTimeout(function(){
							$('#information div.titlebar').fadeOut(300,function(){
								$top1mask.css('width','712px');
								$('#information').fadeOut(300);
							});
						},150);
						setTimeout(function(){
							$design_appreciation.find('div.titlebar').fadeTo(500,0);
						}, 300);
						step2();
					}
				})
			}
			infor_fade();
		}
	};
	//setTimeout(step1, 500);

	var $topb2 = $('#topb2');

	// 第二步
	var step2 = function(){
		$topb2.animate({
			'top'	: '+=300px',
			'opacity': 0
		},800,function(){
			$topb2.css({
				//'top'	: '2230px'
				'top'	: '2350px'
			});
		});
		$design_appreciation.find('div.box_content div.inner_inner').fadeTo(800,0,function(){
			$design_appreciation.find('div.box_content div.inner').animate({
				'marginTop'	: 0,
				'marginLeft': 0,
				'width'		: '264px',
				'height'	: '290px'
			},500,function(){
				$design_appreciation.hide();
				$top1mask.animate({
					'width'		: '584px',
					'opacity'	: 0.5
				},200,function(){
					$top1mask.hide();
					var $pm = $master_palace.find('div.box_content').addClass('shadow');
					var $mpc = $master_palace.find('div.master_palace_content');
					$mpc.animate({
						'height'	: '584px',
						'opacity'	: 0
					},800,function(){
						$mpc.css({
							'opacity'	: '1',
							'background': 'none',
							'boxShadow' : 'none'
						}).find('div.original').hide();
						$pm.css({
							'width'	: '318px',
							'padding': '15px 20px'
						});
						step3();
					});
					$master_palace.animate({
						'width'	: '360px'
					},800);
					$master_palace.find('div.title span').css('position','relative').animate({
						'left'	: '20px',
						'top'	: '-12px'
					},800);
				});
			});
		});
	};

	var $top2 = $('#top2');
	var $weekly_star = $('#weekly_stars');
	var $afflatus_showcase = $('#afflatus_showcase');
	var $recommended_works = $('#recommended_works');
	
	var step3 = function() {
		var $mpr = $master_palace.find('div.replace').show();
		$mpr.find('h3').css({
			position: 'relative',
			top		: '10px',
			opacity	: '0'
		}).animate({
			top : 0,
			opacity : 1
		},300);
		$mpr.find('img').css('opacity','0').fadeTo(300,1);
		$('#hot_topic').fadeIn(300);
		setTimeout(function(){
			_scrollTo(1250,60,40);
	
			var $wsbt = $weekly_star.find('div.box_title').css('opacity',0);
			var $wsbc = $weekly_star.find('div.boxb_content').css('opacity',0);
			var $asbt = $afflatus_showcase.find('div.box_title').css('opacity',0);
			var $asbc = $afflatus_showcase.find('div.boxb_content').css('opacity',0);
			$recommended_works.css('opacity',0);


			$('#masters_guidance').fadeIn(150, function(){
				$top2.css({
					'top'		: '640px',
					'overflow'	: 'hidden',
					'opacity'	: 0
				}).fadeTo(200,1).hide().slideDown(3000, function(){
					$wsbc.css({
						'position'	: 'relative',
						'top'		: '300px'
					}).animate({
						'top'		: '-20px',
						'opacity'	: 1
					},1000).animate({
						'top'		: '0'
					},200,function(){
						$wsbc.css('position','static');
					});
					$recommended_works.fadeTo(1500,1)
					setTimeout(function(){
						$asbc.css({
							'position'	: 'relative',
							'top'		: '300px'
						}).animate({
							'top'		: '-20px',
							'opacity'	: 1
						},1000).animate({
							'top'	: '0'
						},200,function(){
							$wsbt.fadeTo(500,1);
							setTimeout(function(){
								$asbt.fadeTo(500,1,function(){
									setTimeout(step4,1000);
								});
							},500);
						});
					},500);
				});
			});
		},150);
	};

	var $home_improvement_news = $('#home_improvement_news');

	var step4 = function(){
		$home_improvement_news.hide().slideDown(4000,function(){
			step5();
		});
		_scrollTo(2050,50,50);
	};

	var step5 = function(){
		_scrollTo(2580,50,20);
		$topb2.animate({
			'opacity'	: 1,
			'top'		: '2350px'
		},500).animate({
			'top'	: '2150px'
		},500).animate({
			'top'	: '2230px'
		},800);
	};
});