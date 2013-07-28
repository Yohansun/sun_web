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