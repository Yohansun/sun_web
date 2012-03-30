/*
function _scrollTo(y,time,step) {
	if( typeof y != 'number' ) return;
	if( typeof y != 'number' || time < 10 ) {
		time = 10;
	}
	if( typeof y != 'number' || time < 1 ) {
		step = 10;
	}
	var _this = arguments.callee;
	_this.crolling = true;
	var current = document.documentElement.scrollTop || document.body.scrollTop;
	if( y == current ) {
		_this.crolling = false;
		return;
	}
	var p = y - current;
	if( Math.abs(p) < step ) {
		window.scrollTo(0,y);
		return;
	}
	var timer = setInterval(function(){
		var current = document.documentElement.scrollTop || document.body.scrollTop;
		if( Math.abs(y - current) <= Math.abs(step) ) {
			window.scrollTo(0,y);
			_this.scrolling = false;
			clearInterval(timer);
		} else {
			window.scrollBy(0,step);
		}
	}, time);
}
*/
function _scrollTo(a,b,c){var d=arguments.callee;d.crolling=!0;var e=document.documentElement.scrollTop||document.body.scrollTop;if(a==e){d.crolling=!1;return}var f=a-e;c>Math.abs(f)&&(c=Math.abs(f));var g=parseInt(f/c),h=setTimeout(function(){var c=arguments.callee,d=document.documentElement.scrollTop||document.body.scrollTop;Math.abs(a-d)<=Math.abs(g)?(window.scrollTo(0,a),c.scrolling=!1,clearTimeout(h)):(window.scrollBy(0,g),h=setTimeout(c,b))},b)}$(window).ready(function(){var a=$("div.top1content"),b=$("div.top1mask"),c=$("#design_appreciation"),d=$("#master_palace"),e=function(){window.scrollTo(0,0);var a=$("#information li"),d=a.size();if(d){_scrollTo(500,50,40);var e=d-1;function f(){a.eq(e).fadeTo(300,0,function(){e--,e>-1?f():(setTimeout(function(){$("#information div.titlebar").fadeOut(300,function(){b.css("width","712px"),$("#information").fadeOut(300)})},150),setTimeout(function(){c.find("div.titlebar").fadeTo(500,0)},300),g())})}f()}},f=$("#topb2"),g=function(){f.animate({top:"+=300px",opacity:0},800,function(){f.css({top:"2350px"})}),c.find("div.box_content div.inner_inner").fadeTo(800,0,function(){c.find("div.box_content div.inner").animate({marginTop:0,marginLeft:0,width:"264px",height:"290px"},500,function(){c.hide(),b.animate({width:"584px",opacity:.5},200,function(){b.hide();var a=d.find("div.box_content").addClass("shadow"),c=d.find("div.master_palace_content");c.animate({height:"584px",opacity:0},800,function(){c.css({opacity:"1",background:"none",boxShadow:"none"}).find("div.original").hide(),a.css({width:"318px",padding:"15px 20px"}),l()}),d.animate({width:"360px"},800),d.find("div.title span").css("position","relative").animate({left:"20px",top:"-12px"},800)})})})},h=$("#top2"),i=$("#weekly_star"),j=$("#afflatus_showcase"),k=$("#recommended_works"),l=function(){var a=d.find("div.replace").show();a.find("h3").css({position:"relative",top:"10px",opacity:"0"}).animate({top:0,opacity:1},300),a.find("img").css("opacity","0").fadeTo(300,1),$("#hot_topic").fadeIn(300),setTimeout(function(){_scrollTo(1250,60,40);var a=i.find("div.box_title").css("opacity",0),b=i.find("div.boxb_content").css("opacity",0),c=j.find("div.box_title").css("opacity",0),d=j.find("div.boxb_content").css("opacity",0);k.css("opacity",0),$("#masters_guidance").fadeIn(150,function(){h.css({top:"640px",overflow:"hidden",opacity:0}).fadeTo(200,1).hide().slideDown(3e3,function(){b.css({position:"relative",top:"300px"}).animate({top:"-20px",opacity:1},1e3).animate({top:"0"},200,function(){b.css("position","static")}),k.fadeTo(1500,1),setTimeout(function(){d.css({position:"relative",top:"300px"}).animate({top:"-20px",opacity:1},1e3).animate({top:"0"},200,function(){a.fadeTo(500,1),setTimeout(function(){c.fadeTo(500,1,function(){setTimeout(n,1e3)})},500)})},500)})})},150)},m=$("#home_improvement_news"),n=function(){m.hide().slideDown(4e3,function(){o()}),_scrollTo(2050,50,50)},o=function(){_scrollTo(2580,50,20),f.animate({opacity:1,top:"2350px"},500).animate({top:"2150px"},500).animate({top:"2230px"},800)}});