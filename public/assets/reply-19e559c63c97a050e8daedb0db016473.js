$(function(){function r(e,t){if(!e)return;t||(t=5);var r=e.value.split("\n"),i=n?1:0;i+=r.length;var s=e.cols;s<=20&&(s=40);for(var o=0;o<r.length;o++)r[o].length>=s&&(i+=Math.ceil(r[o].length/s));i=Math.max(i,t),i!=e.rows&&(e.rows=i)}$(".reply a,.msgboard_btn a.answer").click(function(){var e=$(this).text(),t=$(this).parents("li").html()==null?$(this).parents(".msgboad_item"):$(this).parents("li"),n=t.find(".user").text()==""?t.find("strong").text():t.find(".user").text();t.find(".reply_area").toggle()}),$(".reply_list").each(function(){var e=$(this),t=e.find("p.fl").text();if(t!=""){e.show();return}});var e=navigator.userAgent.toLowerCase(),t=e.indexOf("opera")!=-1,n=e.indexOf("msie")!=-1&&document.all&&!t;$("#reply_msg_content").bind("keydown keyup",function(){r(this,2)})});