$(function(){
	$(".cate_save").click(function(){
		falg = 0;
		$("input[name='tags[]']:checkbox").each(function () { 
			if ($(this).attr("checked")) { 
			falg += 1; 
			} 
		}) 
		if (falg > 5 )
		{
			alert("最多只能选择5个标签");
			return false;
		}
		else{
			alert("保存成功");
  		return true;
		}
	});

  $(".expand-image").click(function(){
	  if($('.expand-image').text() == "收缩")
	  {
	    $('.js-tab-image-childen').hide()
	    $('.expand-image').html("展开")
	  }else{
	  	$('.expand-image').html("收缩")
	    $('.js-tab-image-childen').show()
	  }
	})
	$(".inspect_link").click(function(){
    if($(".image_link").val() == ""){
      alert("请输入链接!!!");
      return false;
    }else{
      window.open($(".image_link").val());
    }
  });
  $(".home_type_save").click(function(){
  	if($(".image_title").val().length > 12 || $(".image_title").val() == ""){
      alert("标题不能超过12个字并且不能为空");
      return false;
  	}else if($(".image_link").val() == ""){
      alert("链接不能为空");
      return false;
  	}else{
  		alert("保存成功");
  		return true;
  	}
  });

})