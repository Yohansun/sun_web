$('.edit_form<%= @new.id%>').html("");
$('.edit_form<%= @new.id%>').append("<%= escape_javascript(render(:partial => "form", :locals => {:new => @new})) %>");
$(".literal_submit").click(function(){
  if ($(".literal_title").val().length > 12){
    alert("标题必须输入不超过12个汉字");
    return false;
  }else if($(".liter_link").val() == ""){
    alert("请输入链接");
	  return false;
	}else{
  	return true;
  }
});
$(".inspect_fit_liter_link").click(function(){
    window.open($(".liter_link").val());
});
$('.literal_submit').click(function(){
	var $order_id = $('.literal_select').val();
	var $title = $('.literal_title').val();
	var $link = $('.liter_link').val();
	$.ajax({
	  type: "PUT",
	  url: "<%= home_liter_head_path %>",
	  data: {home_liter_head_id : <%= @new.id %>, order_id : $order_id, title : $title, link : $link}
	});
});