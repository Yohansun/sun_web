class SpecialEvent

  bindEvents: ->
    this.check_login()
    this.check_telephone()
    this.event_join()

  check_login: ->
    console.log 'check_login'

  check_telephone: ->
    $('a.check-telephone').bind 'click', (event) ->
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
    $("form#event_attend_form").live 'ajax:remotipartSubmit', (event, data, status) =>
      button = $('form#event_attend_form input[type=submit]')
      button.val('上传中，请稍候')
      button.attr('disabled', true)

    $("form#event_attend_form").live 'ajax:complete', (event, data, status) =>
      button = $('form#event_attend_form input[type=submit]')
      button.val('提交')
      button.attr('disabled', false)
      o_in()
      $('form#event_attend_form input[type="file"]').val('')
      $('form#event_attend_form textarea').val('')
      data = jQuery.parseJSON(data.responseText);
      switch data.result
        when "A"
          $('.congrats').html('288色卡')
          $('.congrats').show()
        when "B"
          $('.congrats').html('有机会获得1122色卡、u盘、小罐漆的其中一个')
          $('.congrats').show()
        when "C"
          $('.congrats').html('288色卡+有机会获得1122色卡、u盘、小罐漆的其中一个')
          $('.congrats').show()
        when "overtime"
          $('.overtime').show()
        else
          $('.congrats-without-award').show()
          


window.iColor.SpecialEvent ?= new SpecialEvent

# $ ->
  # iColor.SpecialEvent.bindEvents()