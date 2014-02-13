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
        obj = $(this)
        if reply_id isnt ""
          if confirm("是否要替换原来的回复") is true
            submitReply(question_id,content,reply_id,obj)
        else
          submitReply(question_id,content,reply_id,obj)

      submitReply = (question_id,content,reply_id,obj)->
        $.post "/dialog_celebrity/media/update_question",{question_id: question_id, reply_id: reply_id, content: content}, (r)->
          if r.code is 1
            _reply_id = r.reply_id
            obj.attr("data-reply-id",_reply_id)
            obj.parent().parent().parent().prev().find("a").css("color","green").text("已回复")
            alert "提交成功"
  window.D = D = new Media(window,window.document,window.document.body)