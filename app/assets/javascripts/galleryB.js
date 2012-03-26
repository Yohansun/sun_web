$(function(){
	var $item = $('div.galleryB div.list ul');
	var count = $item.find('li').size();
	var colsize = 4;
	var pwidth = $item.find('li').eq(0).width();
	var sp = 10;
	var wwidth = count * ( pwidth + sp ) - sp;
	var movewidth = pwidth + sp;
	var disabledClassName = "disabled";
	if( count > colsize ) {
		var $left	= $('div.galleryB span.moveleft');
		var $right	= $('div.galleryB span.moveright');
		function s(left) {
			if( typeof left != 'number' ) {
				left = parseInt($item.css('left')) || 0;
			}
			$left[ left >= 0 ? 'addClass' : 'removeClass' ](disabledClassName);
			$right[ ( -1 * left ) >= wwidth - ( 4 * ( movewidth ) - sp ) ? 'addClass' : 'removeClass' ](disabledClassName);
		}
		s();
		$left.click(function(){
			if( $(this).hasClass(disabledClassName) ) {
				return;
			}
			s( (parseInt($item.css('left')) || 0) + movewidth );
			$item.animate({
				"left" : "+="+movewidth+'px'
			}, 'fast');
		});
		$right.click(function(){
			if( $(this).hasClass(disabledClassName) ) {
				return;
			}
			s( (parseInt($item.css('left')) || 0) - movewidth );
			$item.animate({
				"left" : "-="+movewidth+'px'
			}, 'fast');
		});
	}
});