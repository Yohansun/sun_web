$('#uploads').html("<%= escape_javascript(render(:partial => "kv_upload", :locals => {:upload => @upload})) %>");
$('#hidden_map_id').val(<%= @upload.id %>);