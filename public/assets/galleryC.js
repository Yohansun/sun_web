function galleryC(a){function q(b){var c=parseInt(b);if(isNaN(c)||c<1||c==a.interval)return;for(var d=0,f=a.intervals.length;d<f;d++)if(a.intervals[d]==c){a.interval=c,e.find("span").html(c+"秒");return}}function r(b,c){b=parseInt(b);if(b<0)return!1;b+1>a.images.length||$(".qin_span").text(b+1+"/"+a.images.length);if(isNaN(b))return!1;b>a.images.length-1?t():(clearTimeout(m),f.html('<img src="'+a.images[b]+'"/>'),currentImage=b,i.hasClass(a.pauseClass)&&(m=setTimeout(function(){r(currentImage+1)},a.interval*1e3)))}function s(){$(".gallery_over_mask").show(),$(".gallery_over_wrap").fadeIn("fast")}function t(){$(".gallery_over_mask").show(),$(".gallery_over_wrap").fadeIn("fast",function(){function e(){a--;if(a==0){clearInterval(d),window.location=c;return}b.text(a)}var a=5,b=$("#timers"),c=b.attr("href");if(c==undefined)return!1;var d=setInterval(e,1e3)})}if(!(typeof a=="object"&&a!=null&&typeof a.images!="undefined"&&a.images instanceof Array&&a.images.length))return!1;var b={},c={wrapClass:"galleryC",imagePlayerClass:"big_image",timeSelectorClass:"time",prevClass:"prev",nextClass:"next",playClass:"play",pauseClass:"pause",moveLeftClass:"moveleft",moveRightClass:"moveright",images:[],intervals:[5,10,15,20],interval:"10"};$.extend(c,a),a=c,b.config=a;var d=$("."+a.wrapClass),e=$("."+a.timeSelectorClass),f=$("."+a.imagePlayerClass),g=$("."+a.prevClass),h=$("."+a.nextClass),i=$("."+a.playClass),j=$("."+a.moveLeftClass),k=$("."+a.moveRightClass);i.size()||(i=$("."+a.pauseClass));if(a.images.length==1)return f.html('<img src="'+a.images[0]+'">'),k.click(t),h.click(t),!0;var l=parseInt(a.interval);if(isNaN(l)||l<1)a.interval=10;var m=0;i.click(function(){this.className=this.className==a.playClass?a.pauseClass:a.playClass});if(a.intervals.length<1)e.append("<ul><li>"+a.interval+"秒</li></ul>");else if(a.interval==1){var n=parseInt(a.intervals[0]);!isNaN(n)&&n>0&&(a.interval=n),e.append("<ul><li>"+a.interval+"秒</li></ul>")}else{for(var o=0,p=a.intervals.length;o<p;o++){var n=parseInt(a.intervals[o]);(isNaN(n)||n<1)&&a.intervals.splice(o,1)}e.append("<ul><li>"+a.intervals.join("秒</li><li>")+"秒</li></ul>")}return a.$intervalListWrap=e.find("ul"),a.$intervalList=e.find("li"),a.$intervalDisplayer=e.find("span"),e.hover(function(){a.$intervalListWrap.show()},function(){a.$intervalListWrap.hide()}),a.$intervalList.click(function(){var a=$(this);q(a.text()),a.parent().hide()}),q(2),b.showImage=r,r(0),k.click(function(){r(currentImage+1,s)}),h.click(function(){r(currentImage+1,s)}),j.click(function(){r(currentImage-1,s)}),g.click(function(){r(currentImage-1,s)}),i.click(function(){r(currentImage,s)}),b};