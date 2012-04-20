$(function(){
	/*toggle reply*/
	$('.reply a,.msgboard_btn a.answer').click(function(){
		var reply = $(this).text();
		var $parent = $(this).parents('li').html() == null ? $(this).parents('.msgboad_item') : $(this).parents('li');
		var user = $parent.find('.user').text() == ''? $parent.find('strong').text() : $parent.find('.user').text();
		//set user with arguments;
		$parent.find('.reply_area').toggle();
	});
	
	$('.reply_list').each(function(){
		var $curr = $(this);
		var p_txt = $curr.find('p.fl').text();
		if(p_txt != '')
		{
			$curr.show();
			return;
		}
	});
	/*submit area*/
//	$('.reply_input_form').submit(function(){
//		var $input = $(this).find('textarea');
//		var arr = new Array();
//		arr.txt = $input.val();
//		if(arr.txt==''){inputBlank($input);return false;}
//		arr.user = 'luck';	//arguments here;
//
//		var $parent = $(this).parents('li').html() == null ? $(this).parents('.msgboad_item') : $(this).parents('li');
//		arr.time = $parent.find('.time').text() == ''?$parent.find('span.fl').text() : $parent.find('.time').text();
//		var $list = $parent.find('.reply_list');
//		var $con = $list.children('div.reply_con');
//		if($list.is(':visible'))
//		{
//			arr.html = '<div class="reply_line clear"><p class="reply_tabs fl">' + arr.user + '：'+arr.txt + '</p><p class="fr">' + arr.time + '</p></div>';
//			$con.append(arr.html);
//		}
//		else
//		{
//			$con.find('p.fl').text(arr.user+'：'+arr.txt);
//			$con.find('p.fr').text(arr.time);
//			$list.show();
//		}
//		return false;
//	});
	/*resize textarea*/
	var agt = navigator.userAgent.toLowerCase();
	var is_op = (agt.indexOf("opera") != -1);
	var is_ie = (agt.indexOf("msie") != -1) && document.all && !is_op;
	function ResizeTextarea(a,row){
		if(!a){return}
		if(!row)
		row=5;
		var b=a.value.split("\n");
		var c=is_ie?1:0;
		c+=b.length;
		var d=a.cols;
		if(d<=20){d=40}
		for(var e=0;e<b.length;e++){
			if(b[e].length>=d){
				c+=Math.ceil(b[e].length/d)
			}
		}
	   	c=Math.max(c,row);
		if(c!=a.rows){
			a.rows=c;
		}
	}
	$('#reply_msg_content').bind('keydown keyup',function(){
		ResizeTextarea(this,2)
	})
});