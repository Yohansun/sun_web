$('#uploads').append("<%= escape_javascript(render(:partial => "upload", :locals => {:upload => @upload})) %>");
$('.<%= params[:for] %>_images_size').html(parseInt($('.<%= params[:for] %>_images_size').html()) + 1);
<% if params[:controller] == "inspirations" %>
	$('#image_tag').append("<%= escape_javascript(render(:partial => "img_lib_tag", :locals => {:img_lib_tag => @upload})) %>");
<% end %>
var txt = parseInt($('.work_size').last().text());
var work_size = $('.load_total span').text();
$('.load_total span').text(work_size + txt);