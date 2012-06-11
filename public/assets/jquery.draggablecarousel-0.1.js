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
(function(){jQuery.fn.draggableCarousel=function(a){return settings=jQuery.extend({linkNext:".draggablecarousel-next",linkPrev:".draggablecarousel-prev",transition:$.easing.easeOutBack?"easeOutBack":"",transitionDuration:500,keyControls:!1},a),this.each(function(){var a=$(this);a.addClass("draggablecarousel-container");var b=a.children("ul");b.addClass("draggablecarousel-draggable"),b.children("li").addClass("draggablecarousel-item"),a.data("currentElement",b.children("li").eq(0)),goTo=function(a,b){var c=b.parent().data("currentElement");if(a=="next"||a=="prev")var d=c[a]();else{if(typeof k!="number")return;var d=c.parent().children("li").eq(a)}if(d[0]!=null){var e=d.position().left;b.stop().animate({left:-e},settings.transitionDuration,settings.transition)}else try{b.stop().animate({left:-c.position().left},settings.transitionDuration,settings.transition)}catch(f){}b.parent().data("currentElement",d[0]!=undefined||d[0]!=null?d:c)},b.width((parseInt(b.children("li").width())+parseInt(b.children("li").css("margin-right")))*b.find("li").length),b.draggable({axis:"x",handle:"li",create:function(a,c){settings.keyControls&&$(document).bind("keydown",function(a){var c=a.keyCode||a.which,d={left:37,up:38,right:39,down:40},e=null;switch(c){case d.right:goTo("next",b);break;case d.left:goTo("prev",b)}})},start:function(a,c){start=c.position.left,b.css("cursor","move")},stop:function(a,c){b.css("cursor","auto"),stop=c.position.left,moveDirection=start<stop?"rigth":"left",moveDirection=="left"?goTo("next",c.helper):moveDirection=="rigth"&&goTo("prev",c.helper)}}),b.children("li").bind("mousedown touchstart",function(b){a.data("currentElement",$(this))}),$(settings.linkPrev).bind("click",function(a){a.preventDefault(),goTo("prev",b)}),$(settings.linkNext).bind("click",function(a){a.preventDefault(),goTo("next",b)});var c=navigator.userAgent.match(/iPhone|iPod|iPad|Android/i)?1:0,d=0,e=0;b.bind("touchstart",function(a){var f=b.position().left;d=f,c&&(a=a.originalEvent.touches[0]);var g=a.pageY,h=a.pageX;b.bind("touchmove",function(a){c&&(a.preventDefault(),a=a.originalEvent.touches[0]);var d=f+(a.pageX-h);try{b.css({left:d}),e=d}catch(g){}}),b.bind("touchend",function(a){d>e?goTo("next",b):d<e&&goTo("prev",b),b.unbind("touchmove touchend")})})})}})(jQuery);