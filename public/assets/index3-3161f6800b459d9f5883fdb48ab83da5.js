function _scrollTo(a,b,c){if(!(typeof a=="number"&&a>=0))return;var d=arguments.callee;typeof b=="number"&&b>10||(b=10),typeof c=="number"&&c>1||(c=10),d.y!=a&&(d.y=a),d.time!=b&&(d.time=b),d.times!=c&&(d.times=c);var e=document.documentElement.scrollTop||document.body.scrollTop;if(e==a)return;var f=d.y-e;d.times>Math.abs(f)&&(d.times=Math.abs(f)),d.pc=parseInt(f/d.times);if(d.timer)return;d.timer=setTimeout(function(){var a=document.documentElement.scrollTop||document.body.scrollTop;Math.abs(d.y-a)<=Math.abs(d.pc)?(window.scrollTo(0,d.y),d.scrolling=!1,clearTimeout(d.timer),d.timer=0):(window.scrollBy(0,d.pc),d.timer=setTimeout(arguments.callee,d.time))},b)}var adjust=function(){var a=$("#afflatus_showcase .galleryP"),b=a.find("li"),c=b.get(0).offsetWidth,d=b.eq(0).width(),e=624,f=5,g=7,h=new Array(g),i=arguments.callee;if(typeof i.ww!="undefined"&&e==i.ww)return;i.ww=e;var j=0,k=function(){var a=0,b=1e6;for(var c=0;c<g;c++)typeof h[c]=="undefined"&&(h[c]=0),h[c]<b&&(a=c,b=h[c]);return a},l=function(){var a=0,b=0;for(var c=0;c<g;c++)typeof h[c]=="undefined"&&(h[c]=0),h[c]>b&&(a=c,b=h[c]);return a};b.each(function(a){var b=k(),e=$(this).css({left:b*(c+f)+j+"px",top:(h[b]?h[b]+f:0)+"px"}).find("img");if(e.size()){var g=e.attr("width")>d?d:e.attr("width"),i=parseInt(e.attr("height")/e.attr("width")*g);e.css({width:g+"px",height:i+"px"}),e.parent().css({width:g+"px",height:i+"px"})}h[b]=(h[b]?h[b]+f:0)+this.offsetHeight})};$("#afflatus_showcase .galleryP").addClass("galleryReady");var $window=$(window);$window.ready(function(){var a=$("div.indexmain"),b=$("div.top1content"),c=$("div.top1mask"),d=$("#design_appreciation"),e=$("#master_palace"),f=function(){var a=$("#information li"),b=a.size();if(b){_scrollTo(500,50,10);var e=b-1;function f(){a.eq(e).fadeTo(200,0,function(){e--,e>-1?f():(setTimeout(function(){$("#information div.titlebar").fadeOut(200,function(){c.css("width","712px"),$("#information").fadeOut(200)})},150),setTimeout(function(){d.find("div.titlebar").fadeTo(300,0)},300),h())})}f()}},g=$("#topb2"),h=function(){g.animate({top:"+=300px"},500),a.css({height:"915px"}),d.find("div.box_content div.inner_inner").fadeTo(800,0,function(){d.find("div.box_content div.inner").animate({marginTop:0,marginLeft:0,width:"264px",height:"290px"},300,function(){d.hide(),c.animate({width:"584px",opacity:.5},100,function(){c.hide();var a=e.find("div.box_content").addClass("shadow"),b=e.find("div.master_palace_content");b.animate({height:"584px",opacity:0},500,function(){b.css({opacity:"1",background:"none",boxShadow:"none"}).find("div.original").hide(),a.css({width:"318px",padding:"15px 20px"}),m()}),e.animate({width:"360px"},500),e.find("div.title span").css("position","relative").animate({left:"20px",top:"-12px"},500)})})})},i=$("#top2"),j=$("#weekly_star"),k=$("#afflatus_showcase"),l=$("#recommended_works"),m=function(){var a=e.find("div.replace").show();a.find("h3").css({position:"relative",top:"10px",opacity:"0"}).animate({top:0,opacity:1},200),a.find("img").css("opacity","0").fadeTo(300,1),$("#hot_topic").fadeIn(300),setTimeout(function(){$("#masters_guidance").fadeIn(150,function(){$window.scroll(function(){var a=document.documentElement.scrollTop||document.body.scrollTop;a>=800&&($window.unbind("scroll",arguments.callee),n())})})},150)},n=function(){_scrollTo(1260,50,20),a.css({height:"1835px"}),g.css({top:"1570px"});var b=j.find("div.box_title").css("opacity",0),c=j.find("div.boxb_content").css("opacity",0),d=k.find("div.box_title").css("opacity",0),e=k.find("div.boxb_content").css("opacity",0);l.css("opacity",0),i.show().css({top:"650px",opacity:0}).fadeTo(200,1).hide().slideDown(1800,function(){c.css({position:"relative",top:"300px"}).animate({top:"-20px",opacity:1},1e3).animate({top:"0"},200,function(){c.css("position","static")}),l.fadeTo(1500,1),setTimeout(function(){e.css({position:"relative",top:"300px"}).animate({top:"-20px",opacity:1},600,function(){e.animate({top:0},200,function(){b.fadeTo(500,1),setTimeout(function(){d.fadeTo(500,1,function(){$window.scroll(function(){var a=document.documentElement.scrollTop||document.body.scrollTop;a>=1500&&($window.unbind("scroll",arguments.callee),p())})})},300)}),adjust()})},300)})},o=$("#home_improvement_news"),p=function(){_scrollTo(2120,50,50),a.css({height:"2505px"}),g.css({top:"2240px"}),o.hide().slideDown(2e3,q);var b=o.find("div.list").css("opacity",0);setTimeout(function(){b.fadeTo(1e3,1)},1e3);var c=o.find("div.tweibo div.boxb_content").css({position:"relative",right:"-270px",opacity:0});setTimeout(function(){c.animate({right:0,opacity:1},1e3)},1500);var d=o.find("div.tweets").css("opacity",0);setTimeout(function(){d.fadeTo(1e3,1)},2e3)},q=function(){g.animate({top:"2130px"},500,function(){g.animate({top:"2240px"},500)})};b.hover(function(){if(this.waiting||this.finished)return;this.waiting=1;var a=this;this.timer=setTimeout(function(){f(),a.finished=1},1e3),this.running=1},function(){this.waiting&&!this.finished&&(this.waiting=0,clearTimeout(this.timer))})});