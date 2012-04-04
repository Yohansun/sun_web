$('#uploads').append("<%= escape_javascript(render(:partial => "upload", :locals => {:upload => @upload})) %>");
$('#design_images_size').html(parseInt($('#design_images_size').html()) + 1);