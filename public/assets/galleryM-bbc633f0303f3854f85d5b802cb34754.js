$(function(){
	var $wrap = $('div.galleryM');
	var $item = $wrap.find('div.list ul');
	if( $item.size() < 2 ) {
		return;
	}
	var size = $item.size();
	var current = -1;
	var show = function(index){
		if( index == current ) return;
		if( index > size-1 ) {
			index = 0;
		} else if( index < 0 ) {
			index = size-1;
		}
		$item.eq(index).css('zIndex', 10).show();
		if( current>-1 ) {
			$item.eq(current).css('zIndex', 9).hide();
		}
		current = index;
	};
	show(0);
	$wrap.find('.moveleft').click(function(){
		show(current+1);
	});
	$wrap.find('.moveright').click(function(){
		show(current-1);
	});
})
;
