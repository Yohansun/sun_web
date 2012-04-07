$(function(){
	var $wrap = $('.galleryF');
	var $item = $wrap.find('dl');
	var size = $item.size();
	var wwidth = $wrap.width();
	var swidth = 36;
	var current = -1;
	function show(index){
		if( index == current || index > size-1 || index < 0 ) {
			return;
		}
		$item.eq(index).removeClass('contract');
		if( current > -1 ) {
			$item.eq(current).addClass('contract');
		}
		current = index;
	}
	$item.mouseover(function(){
		var $this = $(this);
		if( !$this.hasClass('contract') ) {
			return false;
		}
		show(this.getAttribute('theindex'));
	}).each(function(index){
		this.setAttribute('theindex', index);
		$(this).addClass('contract');
	}).find('img').each(function(){
		$(this).css('width', wwidth - (swidth*(size-1))-5);
	});
	show(0);
});
