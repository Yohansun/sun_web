# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  class DialogCelebrity
    constructor: (options) ->
      {@window, @document, @body} = options

    initialize: ->
      if $.imagepreview
        $.imagepreview({
          file : $('#manage_dialog_editor_treasury_thumb'),
          img : $('#preview-thumb'),
          maxWidth : 280,
          maxHeight : 145
        });

      if $('body').hasClass('xheditor')
        $('.xheditor').xheditor(
          upImgUrl:'/home/upload_img',
          upImgExt: "jpg,jpeg,gif,png",
          html5Upload: false,
          width: 990,
          height: 300
        )

  window.D = D = new DialogCelebrity(window,window.document,window.document.body)