$('#uploads').append("<%= escape_javascript(render(:partial => "manage/home_banners/upload_photo", :locals => {:upload => @upload})) %>");
$('#uploads_big').append("<%= escape_javascript(render(:partial => "manage/home_banners/edit_photo", :locals => {:upload => @upload})) %>");
