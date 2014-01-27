# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  class DialogCelebrity
    constructor: (options) ->
      {@window, @document, @body} = options

    initialize: ->
      $("body").on "click","#save_next", ->
        $("input#after_save").val("next")
      if $.imagepreview
        $.imagepreview({
          file : $('#manage_dialog_master_profile_avatar'),
          img : $('#preview-avatar'),
          maxWidth : 80,
          maxHeight : 80
        });

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

