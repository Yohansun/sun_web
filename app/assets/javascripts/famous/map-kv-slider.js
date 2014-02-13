// map-kv-slider.js

jQuery(function($){
	var bin = $('.map-kv-slider'),
		ul = bin.find('ul'),
		li = ul.find('li'),
		pages = li.length,
		h = li.outerHeight() + 8,
		bigimg = $('.js-map-big').find('img')[0],
		pager = 1;
	var bool = pages >= 4
	if(bool) ul.html(ul.html() + ul.html());

	// prev
	$('.js-map-next,.js-map-next-bullet').click(function(){
		if(bool){
			if(ul.is(':animated'))return
			if(pager <= pages){
				ul.stop(true).animate({'top': '-=' + h});
				pager ++;
			} else {
				ul.stop(true).css('top',0).animate({'top': '-=' + h});
				pager = 2;
			}
		} else {
			if(pager < pages) pager ++
			else pager = 1
		}

		makepager(pager);
	});
	// next
	$('.js-map-prev,.js-map-prev-bullet').click(function(){
		if(bool){
			if(ul.is(':animated'))return
			if(pager > 1){
				ul.stop(true).animate({'top': '+=' + h});
				pager --;
			} else {
				ul.stop(true).css('top',- pages * h).animate({'top': '+=' + h});
				pager = pages;
			}
		} else {
			if(pager > 1) pager --
			else pager = pages
		}
		makepager(pager);
	});

	function makepager(num){
		ul.find('li').eq(num - 1).trigger('click');
	}
	ul.find('li').on('click', function(){
		var that = $(this);
		that.addClass('map-active').siblings('.map-active').removeClass();
		var img = this.getElementsByTagName('img')[0]
		bigimg.src = img.src;

		var index = img.getAttribute('index')
		if(index){
			$('div.colors_box').hide().eq( +index ).show()
			$('div.work_tags').hide().eq( +index ).show()
		}
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

	var hash = window.location.hash.slice(1)
	if(hash || hash.length){
		$('[data-id=' + hash + ']').parents('li').click()
	}
});