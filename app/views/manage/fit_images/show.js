$('#uploads').append("<%= escape_javascript(render(:partial => "manage/fit_images/upload", :locals => {:upload => @upload})) %>");
