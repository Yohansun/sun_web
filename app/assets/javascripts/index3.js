function _scrollTo(y,time,times) {
	if( !( typeof y == 'number' && y >= 0 ) ) {
		return;
	}
	var _this = arguments.callee;
	if( !( typeof time == 'number' && time > 10 ) ) {
		time = 10;
	}
	if( !( typeof times == 'number' && times > 1 ) ) {
		times = 10;
	}
	if( _this.y != y ) {
		_this.y = y;
	}
	if( _this.time != time ) {
		_this.time = time;
	}
	if( _this.times != times ) {
		_this.times = times;
	}
	var current = document.documentElement.scrollTop || document.body.scrollTop;
	if( current == y ) {
		return;
	}
	var p = _this.y - current;
	if( _this.times > Math.abs( p ) ) {
		_this.times = Math.abs( p );
	}
	_this.pc = parseInt(p/_this.times);
	if( _this.timer ) return;
	_this.timer = setTimeout(function(){
		var current = document.documentElement.scrollTop || document.body.scrollTop;
		if( Math.abs(_this.y - current) <= Math.abs(_this.pc) ) {
			window.scrollTo(0,_this.y);
			_this.scrolling = false;
			clearTimeout(_this.timer);
			_this.timer = 0;
		} else {
			window.scrollBy(0,_this.pc);
			_this.timer = setTimeout(arguments.callee,_this.time);
		}
	},time);
}

var adjust = function() {

	var $wrap	= $('#afflatus_showcase .galleryP');
	var $list	= $wrap.find('li');
	var pw		= $list.get(0).offsetWidth; //-------------------- 每列宽度
	var piw		= $list.eq(0).width(); //------------------------- 每列内部宽度
	var ww		= 624; //------------------------------- 容器宽度
	var ps		= 5; //-------------------- 间隔

	//var colslen = Math.floor(ww/(pw+ps)); //---------------------- 列数
	var colslen = 7;
	var cols = new Array(colslen); //----------------------------- 所有列的高度

	var _self = arguments.callee;
	if( typeof _self.ww != 'undefined' && ww == _self.ww ) { //--- 容器宽度没有变化，则不用进行调整
		return;
	}
	_self.ww = ww;

	//var bd = Math.ceil((ww-(colslen*(ps+pw)-ps))/2); //----------- 两边留白
	var bd = 0;

	var getMinHeightColIndex = function(){ //--------------------- 获取最矮的一个列
		var index = 0;
		var height = 1000000;
		for( var i=0; i<colslen; i++ ) {
			if( typeof cols[i] == 'undefined' ) {
				cols[i] = 0;
			}
			if( cols[i] < height ) {
				index = i;
				height = cols[i];
			}
		}
		return index;
	};
	var getMaxHeightColIndex = function(){
		var index = 0;
		var height = 0;
		for( var i=0; i<colslen; i++ ) {
			if( typeof cols[i] == 'undefined' ) {
				cols[i] = 0;
			}
			if( cols[i] > height ) {
				index = i;
				height = cols[i];
			}
		}
		return index;
	};

	$list.each(function( index ){
		var col = getMinHeightColIndex();
		var $image = $(this).css({
			'left'	: col*(pw+ps)+bd+'px',
			'top'	: (cols[col] ? cols[col] + ps : 0) + 'px'
		}).find('img');
		if( $image.size() ) { //--------------------------------- 预设图片外部容器的高度，以便图片加载前计算框框的总体高度
			var width = ( $image.attr('width') > piw ? piw : $image.attr('width') );
			var height = parseInt( $image.attr('height') / $image.attr('width') * width );
			$image.css({
				'width'	: width+'px',
				'height': height+'px'
			});
			$image.parent().css({
				'width'	: width+'px',
				'height': height+'px'
			});
		}
		cols[col] = (cols[col] ? cols[col] + ps : 0) + this.offsetHeight;
	});
	//$wrap.css('height', cols[getMaxHeightColIndex()]+'px'); // 重设容器高度
};


$('#afflatus_showcase .galleryP').addClass('galleryReady');

var $window = $(window);

$window.ready(function(){

	var $wrap = $('div.indexmain');
	var $top1content = $('div.top1content');
	var $top1mask = $('div.top1mask');
	var $design_appreciation = $('#design_appreciation');
	var $master_palace = $('#master_palace');

	// 第一步 家装资讯
	var step1 = function(){
		//window.scrollTo(0,0);
		var $infor = $('#information li');
		var il = $infor.size();
		if( il ) {
			_scrollTo(500,50,10);
			var current = il-1;
			function infor_fade(){
				$infor.eq(current).fadeTo(200,0,function(){
					current--;
					if( current > -1 ) {
						infor_fade();
					} else {
						setTimeout(function(){
							$('#information div.titlebar').fadeOut(200,function(){
								$top1mask.css('width','712px');
								$('#information').fadeOut(200);
							});
						},150);
						setTimeout(function(){
							$design_appreciation.find('div.titlebar').fadeTo(300,0);
						}, 300);
						step2();
					}
				})
			}
			infor_fade();
		}
	};
	
	var $topb2 = $('#topb2');

	// 第二步
	var step2 = function(){
		$topb2.animate({
			'top'	: '+=300px'
		},500);
		$wrap.css({ 'height' : '915px' });
		$design_appreciation.find('div.box_content div.inner_inner').fadeTo(800,0,function(){
			$design_appreciation.find('div.box_content div.inner').animate({
				'marginTop'	: 0,
				'marginLeft': 0,
				'width'		: '264px',
				'height'	: '290px'
			},300,function(){
				$design_appreciation.hide();
				$top1mask.animate({
					'width'		: '584px',
					'opacity'	: 0.5
				},100,function(){
					$top1mask.hide();
					var $pm = $master_palace.find('div.box_content').addClass('shadow');
					var $mpc = $master_palace.find('div.master_palace_content');
					$mpc.animate({
						'height'	: '584px',
						'opacity'	: 0
					},500,function(){
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
					},500);
					$master_palace.find('div.title span').css('position','relative').animate({
						'left'	: '20px',
						'top'	: '-12px'
					},500);
				});
			});
		});
	};
	
	var $top2 = $('#top2');
	var $weekly_star = $('#weekly_star');
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
		},200);
		$mpr.find('img').css('opacity','0').fadeTo(300,1);
		$('#hot_topic').fadeIn(300);
		setTimeout(function(){
			$('#masters_guidance').fadeIn(150,function(){
				// step3完成
				// step4
				$window.scroll(function(){
					var top = document.documentElement.scrollTop || document.body.scrollTop;
					if( top >= 800 ) {
						$window.unbind('scroll',arguments.callee);
						step4();
					}
				});
			});
		},150);
	};

	var step4 = function(){
		_scrollTo(1260,50,20);
		$wrap.css({ 'height' : '1835px' });
		$topb2.css({ 'top' : '1570px' });

		var $wsbt = $weekly_star.find('div.box_title').css('opacity',0);
		var $wsbc = $weekly_star.find('div.boxb_content').css('opacity',0);
		var $asbt = $afflatus_showcase.find('div.box_title').css('opacity',0);
		var $asbc = $afflatus_showcase.find('div.boxb_content').css('opacity',0);
		$recommended_works.css('opacity',0);

		$top2.show().css({ 'top' : '650px', 'opacity' : 0 }).fadeTo(200,1).hide().slideDown(1800,function(){
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
				$recommended_works.fadeTo(1500,1);
		
				setTimeout(function(){
					$asbc.css({
						'position'	: 'relative',
						'top'		: '300px'
					}).animate({
						'top'		: '-20px',
						'opacity'	: 1
					},600,function(){
						$asbc.animate({ 'top' : 0 }, 200,function(){
							$wsbt.fadeTo(500,1);
							setTimeout(function(){
								$asbt.fadeTo(500,1,function(){
									$window.scroll(function(){
										var top = document.documentElement.scrollTop || document.body.scrollTop;
										if( top >= 1500 ) {
											$window.unbind('scroll',arguments.callee);
											step5();
										}
									});
								});
							},300);
						});
                        adjust();
					});
				},300);
		});
	};

	var $home_improvement_news = $('#home_improvement_news');

	var step5 = function(){
		_scrollTo(2120,50,50);
		$wrap.css({ 'height' : '2505px' });
		$topb2.css({ 'top' : '2240px' });
		$home_improvement_news.hide().slideDown(2000,step6);

		var $hin_list = $home_improvement_news.find('div.list').css('opacity',0);
		setTimeout(function(){
			$hin_list.fadeTo(1000,1);
		},1000);

		var $hin_tweibo_c = $home_improvement_news.find('div.tweibo div.boxb_content').css({
																		'position'	: 'relative',
																		'right'		: '-270px',
																		'opacity'	: 0
																	});
		setTimeout(function(){
			$hin_tweibo_c.animate({
				'right'		: 0,
				'opacity'	: 1
			},1000);
		},1500);

		var $hin_tweets = $home_improvement_news.find('div.tweets').css('opacity',0);
		setTimeout(function(){
			$hin_tweets.fadeTo(1000,1);
		},2000);
	};

	var step6 = function(){
		$topb2.animate({ 'top' : '2130px' },500,function(){
			$topb2.animate({ 'top' : '2240px' },500);
		});
	};
/*
document.ondblclick = function(){
	document.title = document.documentElement.scrollTop || document.body.scrollTop;
};
*/

	$top1content.hover(function(){
		if( this.waiting || this.finished ) {
			return;
		}
		this.waiting = 1;
		var _self = this;
		this.timer = setTimeout( function(){
			step1();
			_self.finished = 1;
		}, 1000 );
		this.running = 1;
	},function(){
		if( this.waiting && !this.finished ) {
			this.waiting = 0;
			clearTimeout( this.timer );
		}
	});

});