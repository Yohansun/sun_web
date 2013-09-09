$('.edit_form<%= @new.id%>').html("");
$('.edit_form<%= @new.id%>').append("<%= escape_javascript(render(:partial => "form", :locals => {:new => @new})) %>");
$(".literal_submit").click(function(){
  if ($(".literal_title").val().length > 10){
    alert("标题必须输入不超过10个汉字");
    return false;
  }else{
  	return true;
  }
});
$(".inspect_fit_liter_link").click(function(){
    window.open($(".liter_link").val());
});
$('.literal_submit').click(function(){
	var $position = $('.literal_select').val();
	var $title = $('.literal_title').val();
	var $url = $('.liter_link').val();
	$.ajax({
	  type: "PUT",
	  url: "<%= fit_literal_path %>",
	  data: {fit_literal_id : <%= @new.id %>, order_id : $position, title : $title, link : $url}
	});
});