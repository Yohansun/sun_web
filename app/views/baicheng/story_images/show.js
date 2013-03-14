$('#uploads').append("<%= escape_javascript(render(:partial => "upload", :locals => {:upload => @upload})) %>");
$('.story_image_size').html(parseInt($('.story_image_size').html()) + 1);
