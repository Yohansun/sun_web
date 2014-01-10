$('#uploads').append("<%= escape_javascript(render(:partial => "upload", :locals => {:upload => @upload})) %>");
$('.<%= params[:for] %>_images_size').html(parseInt($('.<%= params[:for] %>_images_size').html()) + 1);
<% if @upload.imageable_type == "Design" %>
	$('#image_tag').append("<%= escape_javascript(render(:partial => "img_lib_tag", :locals => {:img_lib_tag => @upload})) %>");
<% end %>
var txt = parseInt($('.work_size').last().text());
var work_size = $('.load_total span').text();
$('.load_total span').text(parseInt(work_size) + parseInt(txt));