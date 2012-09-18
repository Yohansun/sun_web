/*
 * jQuery draggableCarousel
 * http://appzen.org/
 *
 * Copyright (c) 2011 Carlos Roberto Gomes Júnior
 * Licensed under a Creative Commons Attribution 3.0 License
 * http://creativecommons.org/licenses/by-sa/3.0/
 * 
 * Dependencies
 *  jQuery Library, 
 *  jQuery UI Draggable, 
 *  jQuery Easing (optional) for custom transitions
 *
 * Version: 0.1
 */
(function(){jQuery.fn.draggableCarousel=function(e){return settings=jQuery.extend({linkNext:".draggablecarousel-next",linkPrev:".draggablecarousel-prev",transition:$.easing.easeOutBack?"easeOutBack":"",transitionDuration:500,keyControls:!1},e),this.each(function(){var e=$(this);e.addClass("draggablecarousel-container");var t=e.children("ul");t.addClass("draggablecarousel-draggable"),t.children("li").addClass("draggablecarousel-item"),e.data("currentElement",t.children("li").eq(0)),goTo=function(e,t){var n=t.parent().data("currentElement");if(e=="next"||e=="prev")var r=n[e]();else{if(typeof k!="number")return;var r=n.parent().children("li").eq(e)}if(r[0]!=null){var i=r.position().left;t.stop().animate({left:-i},settings.transitionDuration,settings.transition)}else try{t.stop().animate({left:-n.position().left},settings.transitionDuration,settings.transition)}catch(s){}t.parent().data("currentElement",r[0]!=undefined||r[0]!=null?r:n)},t.width((parseInt(t.children("li").width())+parseInt(t.children("li").css("margin-right")))*t.find("li").length),t.draggable({axis:"x",handle:"li",create:function(e,n){settings.keyControls&&$(document).bind("keydown",function(e){var n=e.keyCode||e.which,r={left:37,up:38,right:39,down:40},i=null;switch(n){case r.right:goTo("next",t);break;case r.left:goTo("prev",t)}})},start:function(e,n){start=n.position.left,t.css("cursor","move")},stop:function(e,n){t.css("cursor","auto"),stop=n.position.left,moveDirection=start<stop?"rigth":"left",moveDirection=="left"?goTo("next",n.helper):moveDirection=="rigth"&&goTo("prev",n.helper)}}),t.children("li").bind("mousedown touchstart",function(t){e.data("currentElement",$(this))}),$(settings.linkPrev).bind("click",function(e){e.preventDefault(),goTo("prev",t)}),$(settings.linkNext).bind("click",function(e){e.preventDefault(),goTo("next",t)});var n=navigator.userAgent.match(/iPhone|iPod|iPad|Android/i)?1:0,r=0,i=0;t.bind("touchstart",function(e){var s=t.position().left;r=s,n&&(e=e.originalEvent.touches[0]);var o=e.pageY,u=e.pageX;t.bind("touchmove",function(e){n&&(e.preventDefault(),e=e.originalEvent.touches[0]);var r=s+(e.pageX-u);try{t.css({left:r}),i=r}catch(o){}}),t.bind("touchend",function(e){r>i?goTo("next",t):r<i&&goTo("prev",t),t.unbind("touchmove touchend")})})})}})(jQuery);