# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  class DialogCelebrity
    constructor: (options) ->
      {@window, @document, @body} = options

    initialize: ->
      $('#manage_dialog_celebrity_pege_fileupload').fileupload(
        url: '/manage/master_profiles/create_image',
        dataType: 'json',
        acceptFileTypes:  /(\.|\/)(gif|jpe?g|png)$/i,
        maxNumberOfFiles: 1,
        maxFileSize: 5000000,
        done: (e, data)->
          $("img#ett-img").attr("src",data.result.url)
          $("input#ett-url").val(data.result.url)
        ,
        error: (e, data)->
          alert data.result
      )

      $("body").on "change","input#manage_dialog_master_profile_avatar", ->
        $(this).parent().parent().find(".upload_selected_filename").text $(this).val()

      $("body").on "click","#save_next", ->
        $("input#after_save").val("next")

      $("body").on "click","#delete_all", ->
        list = ($(item).attr("id").split("_")[1] for item in $("input.master_select:checked"))
        if list.length is 0
          alert "请先选择要删除的名人"
        else
          if confirm("是否同时要删除手记和作品?") is true then (type = 0) else (type = 1)
          $.post "/manage/dialog_celebrities/master_profiles/destroy_all", { ids: list.join(","), type: type }, (r) ->
            alert r.notify
            if r.code is 1
              $(item).parent().parent().parent().remove() for item in $("input.master_select:checked")

  window.D = D = new DialogCelebrity(window,window.document,window.document.body)