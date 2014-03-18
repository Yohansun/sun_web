$ ->
  class DialogCelebrity
    constructor: (options) ->
      {@window, @document, @body} = options

    initialize: ->
      _title = _url =_check_last_celebrity = _check_last_master = _celebrity_list_value = _master_list_value = _search_celebrity = _search_master = null
      seve_current_values = ->
        _title = $("#ett-title").val()
        _url = $("#ett-url").val()
        _check_last_celebrity = $("#check_last_celebrity").attr("checked")
        _celebrity_list_value = $("#celebrity-list").val()
        _check_last_master = $("#check_last_master").attr("checked")
        _master_list_value = $("#master-list").val()
        _search_celebrity = $("#search-celebrity").val()
        _search_master = $("#search-master").val()

      seve_current_values()

      $('.title-field').bind 'keydown keyup', ->
        $this = $(this);
        total = $this.data('total')
        if !total
          return
        len = total - $this.val().length
        if (len < 0)
          $this.val($this.val().slice(0, total))

      $('#manage_dialog_celebrity_pege_fileupload').fileupload(
        url: '/manage/dialog_celebrities/create_image',
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

      $('body').on "submit","#manage_dialog_celebrity_pege_form", ->
        _this = this
        $btn = $("#save-btn")
        $btn.val("正在保存...").attr("disabled",true)
        $.post $(this).attr("action"), $(this).serialize(), (r) ->
          alert r.notify
          if r.code is 1
            seve_current_values()
          $btn.val("保存").attr("disabled",false)
        return false

      find_celebrity = (name)->
        _isfind = false
        $('select#celebrity-list option').each (i,obj)->
          if name is $(obj).attr("data")
            $(this).attr("selected","true")
            _isfind = true
        if _isfind is true then alert("名人查找成功") else alert("查找的名人不存在")

      $('body').on "click","#find-celebrity-btn", ->
        find_celebrity $("#search-celebrity").val()

      find_master = (name)->
        _isfind = false
        $('select#master-list option').each (i,obj)->
          if name is $(obj).attr("data")
            $(this).attr("selected","true")
            _isfind = true
        if _isfind is true then alert("名人查找成功") else alert("查找的名人不存在")

      $('body').on "click","#find-master-btn", ->
        find_master $("#search-master").val()

      toggle_celebrity = (tag)->
        $('#search-celebrity').attr('disabled',tag)
        $('select#celebrity-list').attr('disabled',tag)
        if tag is true
          $('#find-celebrity-btn').css("display","none")
        else
          $('#find-celebrity-btn').css("display","block")

      toggle_master = (tag)->
        $('#search-master').attr('disabled',tag)
        $('select#master-list').attr('disabled',tag)
        if tag is true
          $('#find-master-btn').css("display","none")
        else
          $('#find-master-btn').css("display","block")

      check_celebrity = ->
        if $("#check_last_celebrity").attr("checked") is "checked" then toggle_celebrity(true) else toggle_celebrity(false)

      check_master = ->
        if $("#check_last_master").attr("checked") is "checked" then toggle_master(true) else toggle_master(false)

      $('body').on "change","#check_last_celebrity", -> check_celebrity()

      $('body').on "change","#check_last_master", -> check_master()

      $('body').on "change","#celebrity-list", ->
        $("#search-celebrity").val $(this).find("option[value="+$(this).val()+"]").attr("data")

      $('body').on "change","#master-list", ->
        $("#search-master").val $(this).find("option[value="+$(this).val()+"]").attr("data")

      $('body').on "click","#reset-btn", ->
        if confirm("当前所有项将将恢复到最后一次保存的版本") is true
          $("#ett-title").val(_title)
          $("#ett-url").val(_url)
          if _check_last_celebrity is 'checked'
            toggle_celebrity(true); $("#check_last_celebrity").attr("checked",true)
          else
            toggle_celebrity(false); $("#check_last_celebrity").attr("checked",false)
          if _check_last_master is 'checked'
            toggle_master(true); $("#check_last_master").attr("checked",true)
          else
            toggle_master(false); $("#check_last_master").attr("checked",false)

          $("select#celebrity-list").find("option[value=" + _celebrity_list_value + "]").attr("selected",true)
          $("select#master-list").find("option[value=" + _master_list_value + "]").attr("selected",true)

          $("#search-celebrity").val(_search_celebrity)
          $("#search-master").val(_search_master)

      $('select#master-list option').each (i,obj)->
        $(this).find("option[value=" + _master_list_value + "]").attr("select",true)

      check_celebrity() ; check_master()

  window.D = D = new DialogCelebrity(window,window.document,window.document.body)
