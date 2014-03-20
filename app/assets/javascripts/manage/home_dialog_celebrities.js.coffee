# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $("body").on "click",".edit-image", ->
    $obj = $(this).parent().parent().parent().parent()
    $content = $obj.find(".show")
    $form = $obj.find(".form")
    $content.hide()
    $form.show()

  $("body").on "click",".cancel-image", ->
    $obj = $(this).parent().parent().parent().parent()
    $content = $obj.find(".show")
    $form = $obj.find(".form")
    $content.show()
    $form.hide()

  $("body").on "click",".save-image", ->
    $obj = $(this).parent().parent().parent().parent()

    input_position = $obj.find(".image-position")
    input_title = $obj.find(".image-title")
    input_url = $obj.find(".image-url")

    position = input_position.val()
    title    = input_title.val()
    url    = input_url.val()
    id     = $obj.attr("data-image-id")

    $.post "/manage/home_dialog_celebrities/update_image",{ id: id,position: position, title: title, url: url },(r)->
      contents = $obj.find(".show")
      contents.eq(0).text(position)
      contents.eq(1).text(title)
      contents.eq(2).text(url)

      $(".image-position-word").each (index,obj)->
        if $(obj).attr("data-position") is r.position.toString()
          $(obj).text(r.ori_position)
          $(obj).attr("data-position",r.ori_position)
      contents.eq(0).attr("data-position",position)
      $content = $obj.find(".show")
      $form = $obj.find(".form")
      $content.show()
      $form.hide()

  $('body').on "submit","#manage_dialog_celebrity_pege_form", ->
    _this = this
    $btn = $("#save-btn")
    $btn.val("正在保存...").attr("disabled",true)
    $.post $(this).attr("action"), $(this).serialize(), (r) ->
      alert r.notify
      $btn.val("保存").attr("disabled",false)
    return false