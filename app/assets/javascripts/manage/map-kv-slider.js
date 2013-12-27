// map-kv-slider.js

jQuery(function($){
	var bin = $('.map-kv-slider'),
		ul = bin.find('ul'),
		li = ul.find('li'),
		pages = li.length,
		h = li.outerHeight() + 8,
		bigimg = $('.map-big').find('img')[0],
		pager = 1;
	if(pages < 4) return false;
	ul.html(ul.html() + ul.html());

	// prev
	$('.map-prev,.map-prev-bullet').click(function(){
		if(pager <= pages){
			ul.stop(true).animate({'top': '-=' + h});
			pager ++;
		} else {
			ul.stop(true).css('top',0).animate({'top': '-=' + h});
			pager = 2;
		}
		makepager(pager);
	});
	// next
	$('.map-next,.map-next-bullet').click(function(){
		if(pager > 1){
			ul.stop(true).animate({'top': '+=' + h});
			pager --;
		} else {
			ul.stop(true).css('top',- pages * h).animate({'top': '+=' + h});
			pager = pages;
		}
		makepager(pager);
	});

	function makepager(num){
		ul.find('li').eq(num - 1).trigger('click');
	}
	ul.find('li').on('click', function(){
		var that = $(this);
		that.addClass('map-active').siblings('.map-active').removeClass();
		bigimg.src = this.getElementsByTagName('img')[0].src;
		// var index = that.index();
		// if(index <= pages){
		// 	ul.stop(true).animate({'top' : - index * h})
		// 	if(index > pages){
		// 		index = 1;
		// 	} else {
		// 		pager = index + 1;
		// 	}
		// }
	});


});