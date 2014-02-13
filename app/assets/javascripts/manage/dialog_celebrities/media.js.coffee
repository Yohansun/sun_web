# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  class DialogCelebrity
    constructor: (options) ->
      {@window, @document, @body} = options

    initialize: ->
      editing = false

      toggle_tr = ($tr,tag)->
        if tag is "edit"
          if editing is true then return
          $tr.find(".group1").hide()
          $tr.find(".group2").show()
          editing = true
        if tag is "back"
          $tr.find(".group1").show()
          $tr.find(".group2").hide()
          editing = false

      $("body").on "click","#create-media", ->
        $btn = $(this)
        $btn.text("正在创建...")
        _is_created = false

        $.post "/manage/dialog_celebrities/media/create_media",(r)->
          if r.code is 1
            $("table#scopes > tbody > tr:first").after(r.content)
          else
            alert r.notify
          $btn.text("新建媒体...")

      $("body").on "click","a.destroy-media", ->
        $obj = $(this)
        $tr = $obj.parent().parent().parent()
        media_id = $tr.attr("data")
        if confirm("是否删除") is true
          $.post "/manage/dialog_celebrities/media/destroy_media", { media_id: media_id },(r)->
            if r.code is 1
              $tr.remove()

      $("body").on "click","a.edit-media", ->
        $this = $(this)
        $tr = $this.parent().parent().parent()
        toggle_tr $tr,"edit"

      $("body").on "click","a.return-media", ->
        $this = $(this)
        $tr = $this.parent().parent().parent()
        toggle_tr $tr,"back"

      $("body").on "click","a.save-media", ->
        $this = $(this)
        $tr = $this.parent().parent().parent()
        media_id = $tr.attr("data")
        $input_media_name = $tr.find("input.medianame")
        $input_media_boards = $tr.find("input[name=mediaboard]")
        $input_media_username = $tr.find("input.mediausername")
        $input_media_pwd = $tr.find("input.mediapwd")
        media_name = $input_media_name.val()
        media_boards = []
        $input_media_boards.each (index,obj)->
          if $(obj).attr("checked") is "checked"
            media_boards.push $(obj).val()
        #media_boards_text = media_boards.join("  ")
        media_boards = media_boards.join("_")
        media_username = $input_media_username.val()
        media_pwd = $input_media_pwd.val()
        $.post "/manage/dialog_celebrities/media/update_media",
          { media_id: media_id, name: media_name, username: media_username, password: media_pwd, boards: media_boards },(r)->
            if r.code is 1
              $tr.find(".media_name").text media_name
              $tr.find(".media_boards").text r.boards
              $tr.find(".media_username").text media_username
              toggle_tr $tr,"back"
            else
              alert r.notify

  window.D = D = new DialogCelebrity(window,window.document,window.document.body)
