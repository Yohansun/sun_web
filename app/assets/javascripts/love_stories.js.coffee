#= require 'jsCookie'
$(document).ready ->

  # check login box
  if $.readCookie("user_id")? and $.readCookie("user_id") != ''
    # fill user info
    $('.username_css').html(decodeURI($.readCookie("user_display_name")))
    $('.username_css').attr('href', "/users/" + $.readCookie("user_id") + "/asks")

    $('.js-user-info').show()
    $('.js-hide').hide()

    if $.readCookie("love_story")? and $.readCookie("love_story") == 'true'
      $('.js-fenxiang').attr('href', "javascript:alert('每位用户只能发布一次爱的故事!');")
      $('.js-fenxiang').removeAttr('data-confirm');
      # 为爱刷新_2首页_分享爱的故事
      $('#love_monitor_link_436277').bind 'click', (event) =>
        newTriggerEBConversion(this, 436277);

    else
      $('.js-fenxiang').attr('href', "/love_story/love_stories/new")
      $('.js-fenxiang').removeAttr('data-confirm');
      # 为爱刷新_2首页_分享爱的故事
      $('#love_monitor_link_436277').bind 'click', (event) =>
        newTriggerEBConversion(this, 436277);

    if $.readCookie("common_user")? and $.readCookie("common_user") == 'true'
      $('.js-upload').attr('href', "/users/" + $.readCookie("user_id") + "/designs/new")
      $('.js-upload').removeAttr('data-confirm');
      # 为爱刷新_3首页_上传设计作品
      $('#love_monitor_link_436278').bind 'click', (event) =>
        newTriggerEBConversion(this, 436278);
      # 为爱刷新_8爱的故事_分享爱的故事
      $('#love_monitor_link_436283').bind 'click', (event) =>
        newTriggerEBConversion(this, 436283);
    else
      $('.js-upload').attr('href', "javascript:alert('只有设计师才能上传作品!');")
      $('.js-upload').removeAttr('data-confirm');
      # 为爱刷新_3首页_上传设计作品
      $('#love_monitor_link_436278').bind 'click', (event) =>
        newTriggerEBConversion(this, 436278);
      # 为爱刷新_8爱的故事_分享爱的故事
      $('#love_monitor_link_436283').bind 'click', (event) =>
        newTriggerEBConversion(this, 436283);
  else
    # 为爱刷新_2首页_分享爱的故事
    $('#love_monitor_link_436277').bind 'click', (event) =>
      newTriggerEBConversion(this, 436277);
    # 为爱刷新_3首页_上传设计作品
    $('#love_monitor_link_436278').bind 'click', (event) =>
      newTriggerEBConversion(this, 436278);
    # 为爱刷新_8爱的故事_分享爱的故事
    $('#love_monitor_link_436283').bind 'click', (event) =>
      newTriggerEBConversion(this, 436283);
  # check login box end
