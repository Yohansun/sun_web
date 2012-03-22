$(function(){
	var maxCharacter = 100;
	var $characters = $('#characters');
	var $textarea = $('#upload_form textarea');
	$textarea.keydown(function(e){
		if( this.value.length >= maxCharacter && e.keyCode != 8 && e.keyCode != 46 ) {
			e.preventDefault();
		}
	}).keyup(function(e){
		if( this.value.length > maxCharacter ) {
			this.value = this.value.substr(0, maxCharacter);
		}
		$characters.html( maxCharacter - this.value.length );
	});
	var defValue = $textarea.attr('value');
	if( defValue.length > maxCharacter ) {
		$textarea.attr('value', defValue.substr(0, maxCharacter));
	}
	$characters.html( maxCharacter - $textarea.attr('value').length );
	$('#upload_form').submit(function(e){
		if( $textarea.attr('value').length > maxCharacter ) {
			alert('内容超过'+maxCharacter+'个字!');
			e.preventDefault();
		}
	});
	var popup = new popupA;
	$('#upload_target').load(function(){
		if((this.contentDocument || this.document).location.href.indexOf('http') == 0 ) {
			popup.open();
		}
	});
});