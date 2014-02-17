# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  class Media
    constructor: (options) ->
      {@window, @document, @body} = options

    initialize: ->
      $("body").on "click",".reply-status", ->
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
          $(this).parent().next().prepend("<img src='" + data.result.url + "' data-image-id='" +  data.result.id  + "' />")
        ,
        error: (e, data)->
          alert data.result
      )

      submitReply = (question_id,content,reply_id,image_ids,obj)->
        $.post "/dialog_celebrity/media/update_question",{question_id: question_id, reply_id: reply_id, image_ids: image_ids,content: content}, (r)->
          if r.code is 1
            _reply_id = r.reply_id
            obj.attr("data-reply-id",_reply_id)
            obj.parent().parent().parent().prev().find("a").css("color","green").text("已回复")
            alert "提交成功"

  window.D = D = new Media(window,window.document,window.document.body)
