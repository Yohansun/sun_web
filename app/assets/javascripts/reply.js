$(function(){
	$('.reply a').click(function(){
		var reply = $(this).text();
		var user = $(this).parents('li').find('.user').text();
		$(this).parents('li').children('.reply_input').toggle()
		.find('textarea').text(reply+':');
	});	
	$('.msgboard_btn a').click(function(){
		var txt = $(this).text();
		var $parent = $(this).parents('.msgboad_item');
		var user = $parent.find('strong').text();
		$parent.find('.reply_input').toggle().find('textarea').text(txt+':');
	})
	
//	$('.reply_input_form').submit(function(){
//		var arr = new Array();
//		arr.txt = $(this).find('textarea').val();
//		arr.user = 'luck';		//arguments here;
//		arr.time = $(this).parents('li').find('.time').text()||$(this).parents('.msgboad_item').find('span.fl').text();
//
//		var $li = $(this).parents('li').html()==null?$(this).parents('.msgboad_item'):$(this).parents('li');
//		var $input = $li.find('.reply_input');
//
//		var html = "<div class='reply_list cl pr clear ft14'><em class='pa'>◆</em><span class='pa'>◆</span>"
//		var tmp = html + '<p class="reply_tabs fl">' + arr.user +'：'+ arr.txt +'</p><p class="fr">'+arr.time + '</p></div>';
//		$(tmp).insertBefore($input);
//		return false;
//	});
});