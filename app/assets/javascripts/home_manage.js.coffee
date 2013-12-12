#= require 'application'
#= require 'manage/bootstrap'
#= require 'manage/jquery.slider'
#= require 'LinkageSelect'
#= require_self

$(document).ready ->
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

      parts = window.search_path.split("_")
      parts[0] = tags.join("-")
      window.search_path = parts.join("_")

      init_query_tags()
      return false

    $('a.js-del-tag').live 'click', (event) =>
      tag = $(event.currentTarget).parent()
      tag_index = $(tag).data("tag-index")

      path = window.search_path
      tags = path.split("_")[0].split("-")
      tags[tag_index] = 0

      parts = window.search_path.split("_")
      parts[0] = tags.join("-")
      window.search_path = parts.join("_")

      init_query_tags()
      return false


window.init_query_tags = () ->
  $(".js-query-tags").html('')
  path = window.search_path
  tags = path.split("_")[0].split("-")
  tags.pop()
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

  toggle_search_now_button()

window.toggle_search_now_button = () ->
  if window.search_path != window.original_search_path
    $(".js-search-now").show()
  else
    $(".js-search-now").hide()

