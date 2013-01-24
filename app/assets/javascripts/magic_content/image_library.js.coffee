class ImageLibrary

  bindEvents: =>
    this.previous_next_image()
    this.area_change()
    this.tag_checked()
    this.tag_expand()

  previous_next_image: ->
    $('#image-box .up-down-page .left, #image-box .up-down-page .right').live 'click', (event) ->
      direction = $(event.currentTarget).attr('class')
      current_id = $('.image-preview').data('id')
      iColor.ImageLibrary.request_loading()
      $.ajax '/admin/content/image_libraries/'+current_id+'/up_down_page.js',
        type: 'GET'
        data: 'direction='+direction
        error: (jqXHR, textStatus, errorThrown) =>
          alert "请求失败"
          $.unblockUI()
        success: (data, textStatus, jqXHR) =>
          $.unblockUI()

  area_change: ->
    $("#county").live "change", (event) ->
      current_id = $(event.currentTarget).data('image-id')
      $.ajax '/admin/content/image_libraries/'+current_id+'/update_tags',
        type: 'PUT'
        data: {area_id: $(event.currentTarget).val()}
        error: (jqXHR, textStatus, errorThrown) =>
          alert "地区保存失败"

  tag_checked: ->
    $(".js-check_boxes").live "click", (event) ->
      current_id = $(event.currentTarget).data('image-id')
      $.ajax '/admin/content/image_libraries/'+current_id+'/update_tags',
        type: 'PUT'
        data: {tag: $(event.currentTarget).val()}
        error: (jqXHR, textStatus, errorThrown) =>
          alert "保存失败" 

  init_area_selection: (area_data, image_area_id, areas) ->
    options = { data: area_data }
    select = new LinkageSelect(options)
    if image_area_id isnt null
      select.bind('.level_1', areas[0])
      select.bind('.level_2', areas[1])
      select.bind('.level_3', areas[2])
    else
      select.bind('.level_1', null, '请选择');
      select.bind('.level_2', null, '请选择');
      select.bind('.level_3', null, '请选择');

  tag_expand: ->
    $('.tags-container h2 span').bind 'click', (event) ->
      dom = $(event.currentTarget)
      tag_id = dom.data('tag-id')
      $('.js-tab-'+tag_id+'-childen').toggleClass('expand')
      if tag_id is 136 || tag_id is 210
        if dom.hasClass('expand')
          dom.removeClass('expand')
          dom.html('收缩')
        else
          dom.addClass('expand')
          dom.html('展开')
      else
        if dom.hasClass('expand')
          dom.removeClass('expand')
          dom.html('展开')
        else
          dom.addClass('expand')
          dom.html('收缩')

  request_loading: ->
    $.blockUI css:
      border: "none"
      padding: "15px"
      backgroundColor: "#000"
      "-webkit-border-radius": "10px"
      "-moz-border-radius": "10px"
      opacity: .5
      color: "#fff"

window.iColor.ImageLibrary ?= new ImageLibrary