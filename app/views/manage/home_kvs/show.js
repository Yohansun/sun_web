$('#uploads').html("<%= escape_javascript(render(:partial => "kv_upload", :locals => {:upload => @upload})) %>");
