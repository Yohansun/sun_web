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

    else
      $('.js-fenxiang').attr('href', "/love_story/love_stories/new")
      $('.js-fenxiang').removeAttr('data-confirm');

    if $.readCookie("common_user")? and $.readCookie("common_user") == 'true'
      $('.js-upload').attr('href', "/users/" + $.readCookie("user_id") + "/designs/new")
      $('.js-upload').removeAttr('data-confirm');
    else
      $('.js-upload').attr('href', "javascript:alert('只有设计师才能上传作品!');")
      $('.js-upload').removeAttr('data-confirm');
  # check login box end
