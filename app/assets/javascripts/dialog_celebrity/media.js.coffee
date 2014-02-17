# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  class Media
    constructor: (options) ->
      {@window, @document, @body} = options

    initialize: ->
      $("body").on "click",".reply-status", ->
        id = $(this).parent().parent().next().attr("data-question-id")
        for obj in $(".question-warp")
          if $(obj).find(".content").attr("data-question-id") isnt id
            $(obj).find(".content").slideUp()
        $(this).parent().parent().next().slideToggle()
      $("body").on "click","#submit-question",->
        question_id = $(this).attr("data-question-id")
        reply_id = $(this).attr("data-reply-id")
        content = $(this).parent().prev().find("textarea").val()

        image_ids = ( $(obj).attr("data-image-id") for obj in $(this).parent().parent().next().find("img") )

        obj = $(this)
        if reply_id isnt ""
          if confirm("是否要替换原来的回复") is true
            submitReply(question_id,content,reply_id,image_ids,obj)
        else
          submitReply(question_id,content,reply_id,image_ids,obj)

      $('.upload').fileupload(
        url: '/dialog_celebrity/media/upload_question_image',
        dataType: 'json',
        acceptFileTypes:  /(\.|\/)(gif|jpe?g|png)$/i,
        maxNumberOfFiles: 1,
        maxFileSize: 5000000,
        done: (e, data)->
          content = "<div class='fl mr5 image-warp clearfix'><img src=#{data.result.url} data-image-id=#{data.result.id} /><a href='javascript:;' class='delete-reply-img-btn' >删除</a></div>"
          $(this).parent().next().prepend(content)
        ,
        error: (e, data)->
          alert data.result
      )

      $('.datetimepicker_full').datetimepicker({format: 'yyyy-mm-dd',autoclose: true,minView: 2});

      $("body").on "click",".delete-question-btn", ->
        $obj = $(this).parent().parent().parent()
        id = $(this).attr("data-question-id")
        if confirm("是否要删除?") is true
          $.post '/dialog_celebrity/media/delete_question',{ id: id }, ->
            $obj.remove()
            alert "删除成功"

      $("body").on "click",".delete-reply-img-btn", ->
        $obj = $(this).parent()
        id = $(this).prev().attr("data-image-id")
        if confirm("是否要删除?") is true
          $.post '/dialog_celebrity/media/delete_question_image',{ id: id }, ->
            $obj.remove()
            alert "删除成功"


      submitReply = (question_id,content,reply_id,image_ids,obj)->
        $.post "/dialog_celebrity/media/update_question",{question_id: question_id, reply_id: reply_id, image_ids: image_ids,content: content}, (r)->
          if r.code is 1
            _reply_id = r.reply_id
            obj.attr("data-reply-id",_reply_id)
            obj.parent().parent().parent().prev().find("a").css("color","green").text("已回复")
            alert "提交成功"

  window.D = D = new Media(window,window.document,window.document.body)
