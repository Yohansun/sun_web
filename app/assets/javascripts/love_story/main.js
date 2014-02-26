$(function(){
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

  //right sidebar list
  ;(function($){
    $('.js-img_show').on('click', '.js-title', function(){
      $(this).parent('li').siblings().find('a.js-img').hide();
      $(this).parent('li').addClass('active').siblings('li').removeClass('active')
      $(this).siblings('a.js-img').show();
    })
  }($));
  //LinkageSelect
  ;(function($){
    //linkageselect
    if(typeof data != 'undefined'){
      var options = {
        data  : data // data变量数据从location.js得来
      }
      var sel = new LinkageSelect(options);
      sel.bind('.linkageseclet .level_1','0');
      sel.bind('.linkageseclet .level_2');
      // sel.bind('.linkageseclet .level_3');

      var options2 = {
        data  : data // data变量数据从location.js得来
      }
      var sel2 = new LinkageSelect(options2);
      sel2.bind('.linkageseclet2 .level_1','0');
      sel2.bind('.linkageseclet2 .level_2');
      sel2.bind('.linkageseclet2 .level_3');
    }
  })($);
})