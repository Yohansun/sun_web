$(function() {
  params = getParameters();
  window.search_path = '/color_designs?promit=1';
  init_query_path();
  set_original_search_path();

  $('a.js-search-tag').click(function(event) {
    tag = event.currentTarget;
    tag_name = $(tag).data('name');
    tag_val = $(tag).data('val');
    if (tag_name == 'order') {
      $(tag).addClass('active').siblings('a').removeClass('active');
    } else{
      $(tag).addClass('highlight').siblings('a').removeClass('highlight');
    };
    tag_html = '<a href="javascript:void(0);" data-name=\"' + tag_name + '\" class="map-srch-del">delete</a>';
    tag_html_full = '<span class="map-srch-s search-tag-' + tag_name + '\">' + tag_val + tag_html + '</span>';
    if ($('.search-tag-' + tag_name).length > 0) {
      $('.search-tag-' + tag_name).html(tag_val + tag_html);
    }else{
      $('.js-query-tags').append(tag_html_full);
    };
    params[tag_name] = tag_val
    if (tag_val == '') {
      delete params[tag_name];
      $('.search-tag-'+ tag_name).remove();
    };
    init_query_path();
    return false;
  });
  $('a.map-srch-del').click(function(event) {
    tag = event.currentTarget;
    tag_name = $(tag).data('name');
    delete params[tag_name];
    init_query_path();
  });
  $('.js-search-now').click(function(event) {
    $('.map-srch-bin').html("您的选择：<span style='color:#ff6600'>图片搜索中...</span>");
    setTimeout(function() {
      window.location = window.search_path;
    }, 100);
  });
});
toggle_search_now_button = function() {
  if (window.search_path != window.original_search_path) {
    $(".js-search-now").show();
  } else{
    $(".js-search-now").hide();
  };
};

init_query_path = function() {
  window.search_path = '/color_designs?promit=1';
  if (params.style) {
    search_path += '&style=' + params.style;
  };
  if (params.design_usage) {
    search_path += '&design_usage=' + params.design_usage;
  };
  if (params.design_color) {
    search_path += '&design_color=' + params.design_color;
  };
  if (params.order) {
    search_path += '&order=' + params.order;
  };
  toggle_search_now_button();
};
set_original_search_path = function() {
  window.original_search_path = '/color_designs?promit=1';
  if (params.style) {
    original_search_path += '&style=' + params.style;
  };
  if (params.design_usage) {
    original_search_path += '&design_usage=' + params.design_usage;
  };
  if (params.design_color) {
    original_search_path += '&design_color=' + params.design_color;
  };
  if (params.order) {
    original_search_path += '&order=' + params.order;
  };
  toggle_search_now_button();
};