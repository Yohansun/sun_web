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
function _scrollTo(e,t,n){var r=arguments.callee;r.crolling=!0;var i=document.documentElement.scrollTop||document.body.scrollTop;if(e==i){r.crolling=!1;return}var s=e-i;n>Math.abs(s)&&(n=Math.abs(s));var o=parseInt(s/n),u=setTimeout(function(){var n=arguments.callee,r=document.documentElement.scrollTop||document.body.scrollTop;Math.abs(e-r)<=Math.abs(o)?(window.scrollTo(0,e),n.scrolling=!1,clearTimeout(u)):(window.scrollBy(0,o),u=setTimeout(n,t))},t)}$(window).ready(function(){var e=$("div.top1content"),t=$("div.top1mask"),n=$("#design_appreciation"),r=$("#master_palace"),i=function(){window.scrollTo(0,0);var e=$("#information li"),r=e.size();if(r){_scrollTo(500,50,40);var i=r-1;function s(){e.eq(i).fadeTo(300,0,function(){i--,i>-1?s():(setTimeout(function(){$("#information div.titlebar").fadeOut(300,function(){t.css("width","712px"),$("#information").fadeOut(300)})},150),setTimeout(function(){n.find("div.titlebar").fadeTo(500,0)},300),o())})}s()}},s=$("#topb2"),o=function(){s.animate({top:"+=300px",opacity:0},800,function(){s.css({top:"2350px"})}),n.find("div.box_content div.inner_inner").fadeTo(800,0,function(){n.find("div.box_content div.inner").animate({marginTop:0,marginLeft:0,width:"264px",height:"290px"},500,function(){n.hide(),t.animate({width:"584px",opacity:.5},200,function(){t.hide();var e=r.find("div.box_content").addClass("shadow"),n=r.find("div.master_palace_content");n.animate({height:"584px",opacity:0},800,function(){n.css({opacity:"1",background:"none",boxShadow:"none"}).find("div.original").hide(),e.css({width:"318px",padding:"15px 20px"}),c()}),r.animate({width:"360px"},800),r.find("div.title span").css("position","relative").animate({left:"20px",top:"-12px"},800)})})})},u=$("#top2"),a=$("#weekly_stars"),f=$("#afflatus_showcase"),l=$("#recommended_works"),c=function(){var e=r.find("div.replace").show();e.find("h3").css({position:"relative",top:"10px",opacity:"0"}).animate({top:0,opacity:1},300),e.find("img").css("opacity","0").fadeTo(300,1),$("#hot_topic").fadeIn(300),setTimeout(function(){_scrollTo(1250,60,40);var e=a.find("div.box_title").css("opacity",0),t=a.find("div.boxb_content").css("opacity",0),n=f.find("div.box_title").css("opacity",0),r=f.find("div.boxb_content").css("opacity",0);l.css("opacity",0),$("#masters_guidance").fadeIn(150,function(){u.css({top:"640px",overflow:"hidden",opacity:0}).fadeTo(200,1).hide().slideDown(3e3,function(){t.css({position:"relative",top:"300px"}).animate({top:"-20px",opacity:1},1e3).animate({top:"0"},200,function(){t.css("position","static")}),l.fadeTo(1500,1),setTimeout(function(){r.css({position:"relative",top:"300px"}).animate({top:"-20px",opacity:1},1e3).animate({top:"0"},200,function(){e.fadeTo(500,1),setTimeout(function(){n.fadeTo(500,1,function(){setTimeout(p,1e3)})},500)})},500)})})},150)},h=$("#home_improvement_news"),p=function(){h.hide().slideDown(4e3,function(){d()}),_scrollTo(2050,50,50)},d=function(){_scrollTo(2580,50,20),s.animate({opacity:1,top:"2350px"},500).animate({top:"2150px"},500).animate({top:"2230px"},800)}});