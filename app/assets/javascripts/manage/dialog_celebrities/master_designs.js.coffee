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

      $('body').on "click",".remove-design", ->
        if confirm("是否删除") is true
          id = $(this).attr("data-design-id")
          $father = $(this).parent().parent().parent().parent()
          $.post "/manage/dialog_celebrities/master_designs/#{id}/delete",{id: id}, (r)->
            $father.remove()

      $("body").on "change","#select-master-type", ->
        mtype = $(this).val()
        if mtype == "0" or mtype == "1"
          $obj = $("select#master_design_master_profile_id")
          $.get "/manage/dialog_celebrities/master_profiles/get_master_by_type?mtype=#{mtype}", (r)->
            $obj.find("option").remove()
            $obj.append("<option>选择名人</option>")
            for i in r.data
              id = i[0]
              name = i[1]
              $obj.append("<option value=#{id}>#{name}</option>")

      $('body').on "click","#find-master-btn", ->
        find_master $("#search-master").val()

      find_master = (name)->
        _isfind = false
        $('select#master_design_master_profile_id option').each (i,obj)->
          if name is $(obj).text()
            $(this).attr("selected","true")
            _isfind = true
        if _isfind is true then alert("名人查找成功") else alert("查找的名人不存在")

  window.D = D = new DialogCelebrity(window,window.document,window.document.body)