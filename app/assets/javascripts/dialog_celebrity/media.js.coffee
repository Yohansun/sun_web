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
          _question_id = $(this).parent().parent().parent().attr("data-question-id")
          content = "<div class='fl mr5 image-warp clearfix'><a class='reply-upload-colorbox reply-upload-colorbox-#{_question_id}' data-question-id=#{_question_id} href=#{data.result.url2}><img src=#{data.result.url} data-image-id=#{data.result.id} /></a><a href='javascript:;' class='delete-reply-img-btn' >删除</a></div>"
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

      $("body").on "click",".delete-question", ->
        $obj = $(this).parent().parent().parent().parent()
        id = $(this).parent().parent().parent().attr("data-question-id")
        if confirm("是否要删除?") is true
          $.post '/dialog_celebrity/media/delete_question',{ id: id }, ->
            $obj.remove()
            alert "删除成功"

      $("body").on "click",".recover_board", ->
        $obj = $(this).parent().parent().parent().parent().parent()
        id = $(this).parent().parent().parent().parent().attr("data-question-id")
        if confirm("是否要恢复?") is true
          $.post '/dialog_celebrity/media/recover_question',{ id: id }, ->
            $obj.remove()
            alert "恢复成功"

      $("body").on "click",".update_board_id", ->
        $obj = $(this).parent().parent().parent().parent()
        id = $(this).parent().parent().parent().attr("data-question-id")
        board_id = $(this).parent().prev().find("select").val()
        if board_id is ""
          alert "请选择领域"
        else
          if confirm("是否要设置领域") is true
            $.post '/dialog_celebrity/media/update_question_board',{ id: id,board_id: board_id }, ->
              $obj.remove()
              alert "设置领域成功"

      $("body").on "click",".destroy-question", ->
        $obj = $(this).parent().parent().parent().parent().parent()
        id = $(this).parent().parent().parent().parent().attr("data-question-id")
        if confirm("是否要删除?") is true
          $.post '/dialog_celebrity/media/destroy_question',{ id: id }, ->
            $obj.remove()
            alert "彻底删除成功"


      $("body").on "click",".delete-reply-img-btn", ->
        $obj = $(this).parent()
        id = $obj.find('img').attr("data-image-id")
        if confirm("是否要删除?") is true
          $.post '/dialog_celebrity/media/delete_question_image',{ id: id }, ->
            $obj.remove()
            alert "删除成功"

      $("body").on "click","a.reply-upload-colorbox", ->
        obj = "reply-upload-colorbox-" + $(this).attr("data-question-id")
        colorbox_qa(".#{obj}")

      $("body").on "change","select.board_scope", ->
        scope = $(this).find("option:selected").attr("data-key")
        $obj = $(this).parent().next().find("select")
        $obj.find("option:gt(0)").remove()
        if scope?
          for _key in scope.split(",")
            $obj.append("<option>#{_key}</option>")

      $("body").on "change","select.key_arr", ->
        question_id = $(this).parent().parent().parent().attr("data-question-id")
        key = $(this).val()
        if key isnt ""
          $.post "/dialog_celebrity/media/update_question_key",{question_id: question_id,key: key}

      $("body").on "click",".reset_board_id", ->
        question_id = $(this).parent().parent().parent().attr("data-question-id")
        $obj = $(this)
        $.post "/dialog_celebrity/media/reset_question_key",{question_id: question_id}, ->
          $scope = $obj.parent().prev().prev().find("select")
          $key = $obj.parent().prev().find("select")
          $scope.find("option:eq(0)").attr("selected","selected")
          $key.find("option:gt(0)").remove()

      colorbox_qa = (obj) ->
        $(obj).colorbox({rel: obj,slideshow:true,width:'745px',current:"{current}/{total}",slideshowAuto:false});

      #colorbox_qa(".replies-upload-colorbox");

      submitReply = (question_id,content,reply_id,image_ids,obj)->
        $.post "/dialog_celebrity/media/update_question",{question_id: question_id, reply_id: reply_id, image_ids: image_ids,content: content}, (r)->
          if r.code is 1
            _reply_id = r.reply_id
            obj.attr("data-reply-id",_reply_id)
            alert "提交成功"
            obj.parent().parent().parent().prev().find("a:first").css("color","green").text("已回复").click()

  window.D = D = new Media(window,window.document,window.document.body)
