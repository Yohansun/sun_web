$(function(){
	var $wrap = $('div.galleryO');
	var $item = $wrap.find('li');
	var $moveleft = $wrap.find('.moveleft');
	var $moveright = $wrap.find('.moveright');
	var $current = $wrap.find('span.current');
	$wrap.find('span.total').html($item.size());
	var size = $item.size();
	if( size < 2 ){
		$moveleft.hide();
		$moveright.hide();
	}
	var current = -1;
	$item.filter(function(index){
		return index;
	}).hide();
	function show(index) {
		if( index == current ) return;
		if( index > size-1 ) {
			index = 0;
		} else if( index < 0 ) {
			index = size-1;
		}
		//$moveleft[ index == 0 ? 'addClass' : 'removeClass' ]('disabled');
		//$moveright[ index == size-1 ? 'addClass' : 'removeClass' ]('disabled');
		$item.eq(index).css('z-index', 12).fadeIn('fast');
		$item.eq(current<0 ? index+1 : current).css('z-index', 11).fadeOut('fast');
		current = index;
		$current.html(index+1);
	}
	$moveleft.click(function(){
		show(current-1);
	});
	$moveright.click(function(){
		show(current+1);
	});
        setInterval(function(){
            show(current+1);
        },3000);
})