function galleryC(config){
	if( !( typeof config == 'object' && config != null && typeof config.images != 'undefined' && config.images instanceof Array && config.images.length ) ) {
		return false;
	}
	var obj = {};
	var defConfig = {
		'wrapClass'			: 'galleryC',
		'imagePlayerClass'	: 'big_image',
		'timeSelectorClass'	: 'time',
		'prevClass'			: 'prev',
		'nextClass'			: 'next',
		'playClass'			: 'play',
		'pauseClass'		: 'pause',
		'moveLeftClass'		: 'moveleft',
		'moveRightClass'	: 'moveright',
		'images'			: [],
		'intervals'			: [5,10,15,20],
		'interval'			: '10'
	};
	$.extend(defConfig, config);
	config = defConfig;
	obj.config = config;
	var $wrap 		= $('.'+config.wrapClass);
	var $timeSelector	= $('.'+config.timeSelectorClass);
	var $imagePlayer= $('.'+config.imagePlayerClass);
	var $prev		= $('.'+config.prevClass);
	var $next		= $('.'+config.nextClass);
	var $play		= $('.'+config.playClass);
	var $moveLeft	= $('.'+config.moveLeftClass);
	var $moveRight	= $('.'+config.moveRightClass);
	if( !$play.size() ) {
		$play = $('.'+config.pauseClass);
	}
	if( config.images.length == 1 ) {
		$imagePlayer.html('<img src="'+config.images[0]+'">');
		$moveRight.click(showEvent);
		$next.click(showEvent);
		return true;
	}
	var intervalTime = parseInt( config.interval );
	if( isNaN( intervalTime ) || intervalTime < 1 ) {
		config.interval = 10;
	}

	var timer = 0;
	// 自动播放
	$play.click(function(){
		this.className = this.className == config.playClass ? config.pauseClass : config.playClass;
	});
	if( config.intervals.length < 1 ) {
		$timeSelector.append( '<ul><li>' + config.interval + '秒</li></ul>' );
	} else if( config.interval == 1 ) {
		var pt = parseInt( config.intervals[0] );
		if( !isNaN(pt) && pt > 0 ) {
			config.interval = pt;
		}
		$timeSelector.append( '<ul><li>' + config.interval + '秒</li></ul>' );
	} else {
		for(var i=0,c=config.intervals.length; i<c; i++) {
			var pt = parseInt( config.intervals[i] );
			if( isNaN(pt) || pt < 1 ) {
				config.intervals.splice(i,1);
			}
		}
		$timeSelector.append( '<ul><li>' + config.intervals.join('秒</li><li>') + '秒</li></ul>' );
	}
	config.$intervalListWrap = $timeSelector.find('ul');
	config.$intervalList = $timeSelector.find('li');
	config.$intervalDisplayer = $timeSelector.find('span');
	$timeSelector.hover(function(){
		config.$intervalListWrap.show();
	}, function(){
		config.$intervalListWrap.hide();
	});
	function setIntervalTime( time ) {
		var pt = parseInt( time );
		if( isNaN(pt) || pt < 1 || pt == config.interval ) {
			return;
		}
		for(var i=0,c=config.intervals.length; i<c; i++) {
			if( config.intervals[i] == pt ) {
				config.interval = pt;
				$timeSelector.find('span').html(pt+'秒');
				return;
			}
		}
	}
	config.$intervalList.click(function(){
		var $this = $(this);
		setIntervalTime($this.text());
		$this.parent().hide();
	});
	setIntervalTime(2);
	function showImage(index, lastHandle) {
		index = parseInt(index);
		if(index<0){return false;}
		else if(index+1>config.images.length){}
		else $('.qin_span').text(index+1+'/'+config.images.length);
		if( isNaN(index) ) return false;
		if( index > config.images.length-1 ) {
			showEvent();
		}
		else {
			clearTimeout(timer);
			$imagePlayer.html('<img src="'+config.images[index]+'"/>');
			currentImage = index;
			if( $play.hasClass(config.pauseClass) ) {
				
				timer = setTimeout(function(){
					showImage( currentImage + 1 );
				}, config.interval*1000);
			}
		}
	}
	obj.showImage = showImage;
	//currentImage = 0;
	showImage(0);
	$moveRight.click(function(){ showImage( currentImage + 1, lastHandle ) });
	$next.click(function(){ showImage( currentImage + 1, lastHandle ) });
	$moveLeft.click(function(){ showImage( currentImage - 1, lastHandle ) });
	$prev.click(function(){ showImage( currentImage - 1, lastHandle ) });
	$play.click(function(){ showImage( currentImage, lastHandle ) });
	
	function lastHandle() {
		$('.gallery_over_mask').show();
		$('.gallery_over_wrap').fadeIn('fast');
	}
	function showEvent(){
		$('.gallery_over_mask').show();
			$('.gallery_over_wrap').fadeIn('fast',function(){
				var timer = 5;
				var $a = $('#timers');
				var href = $a.attr('href');
				if(href == undefined) return false;
  				var setTimer = setInterval(mytimer,1000);
				function mytimer(){
					timer --;
					if(timer == 0){
						clearInterval(setTimer);
						window.location = href;
						return;
					}
					else{}
					$a.text(timer);
					}
				});
	}
	
	return obj;
}