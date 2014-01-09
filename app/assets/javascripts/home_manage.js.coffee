#= require 'application'
#= require 'jsCookie'
#= require 'jquery.unveil'
#= require 'manage/bootstrap'
#= require 'manage/jquery.slider'
#= require 'LinkageSelect'
#= require_self

$(document).ready ->
  $("img.lazy").unveil()

  # check login box
  if $.readCookie("user_id")? and $.readCookie("user_id") != ''
    # fill user info
    $('.js-user-name').html(decodeURI($.readCookie("user_display_name")))
    $('.js-user-homepage').attr('href', "/users/" + $.readCookie("user_id") + "/asks")

    $('.js-user-info').show()
    $('.nav_top .login').hide()
    $('.nav_top .btn_red').hide()

    # bind user links
    $(".subscribe").click =>
      o_in();
      $('#july_last').show().find('input[type=text]').val('')
      $('.subs_err').hide()

    $("#new_reply_msg").submit =>
      area = $('#reply_msg_content')
      if area.val() == ''
        inputBlank(area)
        return false

    $(".home_banner2").click =>
      window.open("/users/" + $.readCookie("user_id") + "/edit?edit_by=home_banner2", "_blank");

  else
    $('#overlay_new_user').live 'ajax:error', (xhr, status, error) =>
      $('.err_tips').fadeIn 600, ->
        errs_out = setTimeout ->
          $('.err_tips').fadeOut()
        ,3000

    $("#per_form, #new_message, #new_reply_msg, #new_faq, #channel_service").submit =>
      show_login()
      return false

    $("#new_site_message").submit =>
      $('.server_input').hide()
      show_login()
      return false

    $("#channel_access, #one_key_forward, #ckepop a, .new_mix_color, .home_banner2, .subscribe").click =>
      show_login()
      return false

  # check login box end

  if $('a.js-tag').length > 0
    $('a.js-tag').live 'click', (event) =>
      path = window.search_path
      tags = path.split("_")[0].split("-")
      tag = event.currentTarget
      tag_id = $(tag).data("tag-id")
      tag_name = $(tag).data("tag-name")
      tag_index = $(tag).data("tag-index")

      if tag_index == '_2'
        tag_index = 2
      else
        tag_index = parseInt(tag_index)
        if tag_index >= 2
          tag_index++

      tags[tag_index] = tag_id

      reset_search_path(tags)
      return false

    $('a.js-del-tag').live 'click', (event) =>
      tag = $(event.currentTarget).parent()
      tag_index = $(tag).data("tag-index")

      path = window.search_path
      tags = path.split("_")[0].split("-")
      tags[tag_index] = 0

      reset_search_path(tags)
      return false

    $('a.js-del-area').live 'click', (event) =>
      path = window.search_path
      tags = path.split("_")[0].split("-")
      tags[tags.length - 1] = 0
      $("#area_names").val("")

      reset_search_path(tags)
      return false

    $('.js-search-now').live 'click', (event) =>
      $('.map-srch-bin').html("您的选择：<span style='color:#ff6600'>图片搜索中...</span>")
      setTimeout ->
        window.location = '/images/' + window.search_path
      , 100

window.reset_search_path = (tags) ->
  parts = window.search_path.split("_")
  parts[0] = tags.join("-")
  window.search_path = parts.join("_")
  init_query_tags()

window.init_query_tags = () ->
  $(".js-query-tags").html('')
  path = window.search_path
  tags = path.split("_")[0].split("-")
  area_id = tags.pop()
  area_names = $("#area_names").val()

  for tag_index, tag_id of tags
    if tag_id > 0
      tag = $(".js-tag-"+tag_id)[0]
      tag_html = '<span class="map-srch-s" data-tag-id="' + tag_id + '" data-tag-index="' + tag_index + '">'
      names = $(tag).data("tag-name").split(":")
      tag_html += names[0]
      tag_html += ': <i>' + names[1] + '</i>' if names.length > 1
      tag_html += '<a href="javascript:void(0)" class="js-del-tag map-srch-del">删除</a>'
      tag_html += '</span>'
      $(".js-query-tags").append(tag_html)

  if parseInt(area_id) > 0 and area_names.length > 0
      area_html = '<span class="map-srch-s">'
      area_html += '地区'
      area_html += ': <i>' + area_names + '</i>'
      area_html += '<a href="javascript:void(0)" class="js-del-area map-srch-del">删除</a>'
      area_html += '</span>'
      $(".js-query-tags").append(area_html)

  toggle_search_now_button()

window.toggle_search_now_button = () ->
  if window.search_path != window.original_search_path
    $(".js-search-now").show()
  else
    $(".js-search-now").hide()

