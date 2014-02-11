$(function(){
	$('.drophover_toggle').parent().hover(function(){
		console.log($(this))
		$(this).find('.drophover_menu').toggle();
	});

  // upload
  ;(function($){
    $('.js-text_percentage').bind('keydown keyup', function(){
      var len = $(this).val().length;
      var maxlenth = $(this).data('max');
      var restlenth = maxlenth - len;
      if (len > maxlenth) {
        $(this).val($(this).val().slice(0,maxlenth))
        return;
      };
      $(this).next().find('.js-text_lenth_show').text(len);
      $(this).next().find('.js-text_maxlenth').text(maxlenth);
      $(this).next().find('.js-text_restlenth').text(restlenth);
    });
  })($);

  ;(function($){
    var form = $('.form_upload')
    var modal = form.find('.picture_modal')
    form.on('click', '.js-show_picture_modal', function(){
      modal.show();
    });
    form.on('click', '.js-hide_picture_modal', function(e){
      e.stopPropagation();
      modal.hide();
    });
  })($);
})