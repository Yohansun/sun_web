# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  class DialogCelebrity
    constructor: (options) ->
      {@window, @document, @body} = options

    initialize: ->
      $("body").on "change","input#manage_dialog_master_design_thumb", ->
        $(this).parent().parent().find(".upload_selected_filename").text $(this).val()

      $("body").on "click","#save_next", ->
        $("input#after_save").val("next")

      $('body').on "click",".remove-design", ->
        if confirm("是否删除") is true
          id = $(this).attr("data-design-id")
          $father = $(this).parent().parent().parent().parent()
          $.post "/manage/dialog_celebrities/master_designs/#{id}/delete",{id: id}, (r)->
            $father.remove()

  window.D = D = new DialogCelebrity(window,window.document,window.document.body)