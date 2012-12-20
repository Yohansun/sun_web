class SpecialEvent

  bindEvents: =>
    this.check_login()
    this.check_telephone()
    this.event_join()
    return false

  check_login: ->
    if $('#user_signed').val() isnt 'true'
      o_in()
      $('.unlogin').show()

  check_telephone: ->
    $('a.check-telephone').bind 'click', (event) ->
      if $('#user_signed').val() isnt 'true'
        o_in()
        $('.unlogin').show()
      else
        patrn = /^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/
        tel = $('#attendee_telephone')
        event_id = $('#attendee_special_event_id')
        if tel.val()
          if patrn.test(tel.val())
            $.ajax "/special_events/"+event_id.val()+"/check_mobile",
              type: 'PUT'
              data: 'attendee[telephone]='+tel.val()
              dataType: 'json'
              success: (data) ->
                if data.result is 'success'
                  $('.extra_info').show()
                else
                  o_in()
                  $('.dismatch-mobile').show()
          else
            o_in()
            $('.invalid-mobile').show()
        else
          o_in()
          $('.invalid-mobile').show()

  event_join: ->
    # $("form#event_attend_form").live 'ajax:remotipartSubmit', (event, data, status) =>
    #   button = $('form#event_attend_form input[type=submit]')
    #   button.val('上传中，请稍候')
    #   button.attr('disabled', true)

    $("form#event_attend_form").live 'ajax:complete', (event, data, status) =>
      button = $('form#event_attend_form input[type=submit]')
      button.val('提交')
      button.attr('disabled', false)
      o_in()
      user_path = $('#user_path').val()
      # $('form#event_attend_form input.js-file_name').val('')
      $('form#event_attend_form textarea').val('')
      $("#attendee_image_id").val('');

      data = jQuery.parseJSON(data.responseText);
      switch data.result
        when "A"
          html = '<h2 class="tc txt_green">感谢您的参与</h2>'
          html += '<p class="tc">iColor将送您一个神秘礼物。<br>请去<a href="'+user_path+'" target="_blank">个人账户</a>填写或核实您的邮寄地址，我们将尽快寄出您的圣诞礼物！</p>'
          $('.congrats .content').html(html)
          $('.congrats').show()
        when "B"
          html = '<h2 class="tc">恭喜您</h2>'
          html += '<p class="tc">获得了iColor为您准备的圣诞奖品。<br>请去<a href="'+user_path+'" target="_blank">个人账户</a>填写或核实您的邮寄地址，我们将尽快寄出您的幸运奖品！</p>'
          $('.congrats .content').html(html)
          $('.congrats').show()
        when "C"
          html = '<h2 class="tc">恭喜您</h2>'
          html += '<p class="tc">获得了iColor为您准备的圣诞奖品。<br>请去<a href="'+user_path+'" target="_blank">个人账户</a>填写或核实您的邮寄地址，我们将尽快寄出您的幸运奖品！</p>'
          $('.congrats .content').html(html)
          $('.congrats').show()
        when "overtime"
          $('#overtime_flag').val('true')
          $('.overtime').show()
        else
          $('.congrats-without-award').show()


window.iColor.SpecialEvent ?= new SpecialEvent

# $ ->
  # iColor.SpecialEvent.bindEvents()