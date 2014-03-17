# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  class DialogCelebrity
    constructor: (options) ->
      {@window, @document, @body} = options

    initialize: ->
      $('#manage_dialog_master_design_upload_file').fileupload(
        url: '/manage/dialog_celebrities/master_design_upload_file',
        dataType: 'json',
        acceptFileTypes:  /(\.|\/)(gif|jpe?g|png)$/i,
        maxNumberOfFiles: 1,
        maxFileSize: 5000000,
        formData: { master_design_id: $("#manage_dialog_master_design_upload_file").attr("data-master-design-id")},
        done: (e, data)->
          $("#master-designs-warp").prepend(data.result.content)
        ,
        error: (e, data)->
          alert data.result
      )

      $('body').on "click","a#save-all", ->
        cover_upload_id = $("input[name=is-cover]:checked").val()
        arr = []
        $(".file-info").each (index,obj)->
          _obj = new Object
          _obj.id = $(obj).attr("data-upload-id")
          _obj.recommend_color1 = $(obj).find("#color1").val()
          _obj.recommend_color2 = $(obj).find("#color2").val()
          _obj.recommend_color3 = $(obj).find("#color3").val()
          _obj.recommend_color_category1  = $(obj).find("#color-name1").val()
          _obj.recommend_color_category2  = $(obj).find("#color-name2").val()
          _obj.recommend_color_category3  = $(obj).find("#color-name3").val()
          arr.push _obj
        $.post "/manage/dialog_celebrities/master_design_upload_save_all",{cover_upload_id: cover_upload_id,data: arr}, (r)->
          window.location.href = "/manage/dialog_celebrities/master_designs"

      $('body').on "click",".remove-upload", ->
        if confirm("是否删除") is true
          id = $(this).parent().prev().prev().attr("data-upload-id")
          $father = $(this).parent().parent()
          $.post "/manage/dialog_celebrities/master_design_upload_ajax_delete",{id: id}, (r)->
            $father.remove()

  window.D = D = new DialogCelebrity(window,window.document,window.document.body)