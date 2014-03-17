(function($){
  $('.js-show_content').css('cursor','pointer');
  $('.famous_list').on('click','.js-show_content',function(){
    var $parents = $(this).parents('li');
    $parents.addClass('bg').find('.famous_answer').show();
    $parents.find('.js-state').hide().siblings('.js-hide_content').show().css({'cursor':'pointer','margin-right':'8px'});
  });

  $('.famous_list').on('click','.js-hide_content',function(){
      // $(this).css()
      var $parents = $(this).parents('li');
      $parents.removeClass('bg').find('.famous_answer').hide();
      $(this).hide().siblings('.js-state').show()
    });
  //famous ask
  $('.js-text_percentage').bind('keydown keyup', function(){
    var len = $(this).val().length;
    var maxlenth = $(this).data('max');
    if (len > maxlenth) {
      $(this).val($(this).val().slice(0,maxlenth))
      return;
    };
    $(this).next().find('.js-text_lenth_show').text(len);
    $(this).next().find('.js-text_maxlenth').text(maxlenth);
  });
  //
  // $('.famous_ask_form').on('click','.js-famous_options',function(){
  //   $(this).siblings('.select_options').show();
  // });
  // $('.famous_ask_form').on('click','.js-selects_close',function(){
  //   $(this).parent('.select_options').hide();
  // });
  // //famous ask select option
  // $('.select_options')
  // .on('change','select',function () {
  //   var str = '';
  //   var this_index = $(this).index('select');
  //   $(this).children('option:selected').each(function() {
  //     str = $( this ).text();
  //   });
  //   $('.select_options_show').children().eq(this_index - 1).text(str);
  // })
  // .change();
  //submit
  $('.js-famous_ask_submit').on('click',function(){
    var overview_val = $('.famous_ask_form').find('.js-text_percentage').val();
    var sort_text = $('.famous_ask_form').find('.select_options_show').children('span:eq(0)').text();
    var scope_text = $('.famous_ask_form').find('.select_options_show').children('span:eq(1)').text();
    if (overview_val == '') {
      alert('请输入问题概述')
      return false;
    }else if (sort_text == '' || scope_text == '') {
      alert('请选择分类')
      return false;
    };
  })
  }($));