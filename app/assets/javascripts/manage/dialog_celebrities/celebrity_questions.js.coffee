$ ->
  class DialogCelebrity
    constructor: (options) ->
      {@window, @document, @body} = options

    initialize: (board_id)->
      board_id = board_id
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

      $("body").on "click","#create-scope", ->
        $btn = $(this)
        $btn.text("正在创建...")
        _is_created = false

        $.post "/manage/dialog_celebrities/celebrity_questions/create_board_scope", { board_id: board_id },(r)->
          if r.code is 1
            $("table#scopes > tbody").append(
              "<tr data=" + r.scope_id + "><td class='centerText'>" +
              "<div class='group1'>" +
              "<a href='javascript:;' class='edit-scope' title='编辑'>编辑</a> " +
              "<a href='javascript:;' class='destroy-scope' title='删除'>删除</a>" +
              "</div>" +
              "<div class='group2 hide'>" +
              "<a href='javascript:;' class='save-scope' title='编辑'>保存</a> " +
              "<a href='javascript:;' class='return-scope' title='删除'>返回</a>" +
              "</div>" +
              "</td>"+
              "<td><span class='scope_name group1'></span>"+
              "<span class='scope_name_field group2 hide'><input type='text' class='scopename w150' /></span></td>"+
              "<td>"+
              "<span class='scope_key group1'></span>"+
              "<span class='scope_key_field group2 hide'><input type='text' class='scopekey w500' /></span></td>"+
              "</tr>"
            )
            $btn.text("创建范围...")
          else
            alert r.notify

      $("body").on "click","a.destroy-scope", ->
        $obj = $(this)
        $tr = $obj.parent().parent().parent()
        scope_id = $tr.attr("data")
        $.post "/manage/dialog_celebrities/celebrity_questions/destroy_board_scope", { scope_id: scope_id },(r)->
          if r.code is 1
            $tr.remove()

      $("body").on "click","a#save-board", ->
        board_name = $("input#board-name").val()
        if board_name isnt $("a#border-name-#{board_id}").text()
          $.post "/manage/dialog_celebrities/celebrity_questions/save_board_name",
            { board_id: board_id, board_name: board_name },(r)->
              if r.code is 1
                $("a#border-name-#{board_id}").text board_name

      $("body").on "click","a.edit-scope", ->
        $this = $(this)
        $tr = $this.parent().parent().parent()
        toggle_tr $tr,"edit"

      $("body").on "click","a.return-scope", ->
        $this = $(this)
        $tr = $this.parent().parent().parent()
        toggle_tr $tr,"back"

      $("body").on "click","a.save-scope", ->
        $this = $(this)
        $tr = $this.parent().parent().parent()
        scope_id = $tr.attr("data")
        $input_scope_name = $tr.find("input.scopename")
        $input_scope_key = $tr.find("input.scopekey")
        scope_name = $input_scope_name.val()
        scope_key = $input_scope_key.val()
        $.post "/manage/dialog_celebrities/celebrity_questions/update_board_scope",
          { scope_id: scope_id, scope_name: scope_name, scope_key: scope_key },(r)->
            if r.code is 1
              $tr.find(".scope_name").text scope_name
              $tr.find(".scope_key").text scope_key
              toggle_tr $tr,"back"
            else
              alert r.notify


  window.D = D = new DialogCelebrity(window,window.document,window.document.body)
