$('#uploads').append("<%= escape_javascript(render(:partial => "upload", :locals => {:upload => @upload})) %>");
$('.contract_image_size').html(parseInt($('.contract_image_size').html()) + 1);