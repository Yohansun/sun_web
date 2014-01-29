# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  class DialogCelebrity
    constructor: (options) ->
      {@window, @document, @body} = options

    initialize: ->
      $("body").on "change","input#manage_dialog_editor_treasury_thumb", ->
        $(this).parent().parent().find(".upload_selected_filename").text $(this).val()

      $('.xheditor').xheditor(
        upImgUrl:'/home/upload_img',
        upImgExt: "jpg,jpeg,gif,png",
        html5Upload: false,
        width: 990,
        height: 300
      )

  window.D = D = new DialogCelebrity(window,window.document,window.document.body)