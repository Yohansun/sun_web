function ImageFlow(){this.defaults={animationSpeed:50,aspectRatio:2.5,buttons:!1,captions:0,circular:!1,imageCursor:"default",ImageFlowID:"imageflow",imageFocusM:1,imageFocusMax:2,imagePath:"",imageScaling:!0,imagesHeight:.67,imagesM:.5,onClick:function(){},opacity:!0,opacityArray:[10,3,1,1,1],percentLandscape:100,percentOther:100,preloadImages:!0,reflections:0,reflectionGET:"",reflectionP:.5,reflectionPNG:!1,reflectPath:"",scrollbarP:.6,slider:0,sliderCursor:"e-resize",sliderWidth:14,slideshow:!1,slideshowSpeed:1500,slideshowAutoplay:!1,startID:1,glideToStartID:!0,startAnimation:!1,xStep:80};var a=this;this.init=function(b){for(var c in a.defaults)this[c]=b!==undefined&&b[c]!==undefined?b[c]:a.defaults[c];var d=document.getElementById(a.ImageFlowID);if(d){d.style.visibility="visible",this.ImageFlowDiv=d;if(this.createStructure()){this.imagesDiv=document.getElementById(a.ImageFlowID+"_images"),this.captionDiv=document.getElementById(a.ImageFlowID+"_caption"),this.navigationDiv=document.getElementById(a.ImageFlowID+"_navigation"),this.scrollbarDiv=document.getElementById(a.ImageFlowID+"_scrollbar"),this.sliderDiv=document.getElementById(a.ImageFlowID+"_slider"),this.buttonNextDiv=document.getElementById(a.ImageFlowID+"_next"),this.buttonPreviousDiv=document.getElementById(a.ImageFlowID+"_previous"),this.buttonSlideshow=document.getElementById(a.ImageFlowID+"_slideshow"),this.indexArray=[],this.current=0,this.imageID=0,this.target=0,this.memTarget=0,this.firstRefresh=!0,this.firstCheck=!0,this.busy=!1;var e=this.ImageFlowDiv.offsetWidth,f=Math.round(e/a.aspectRatio);document.getElementById(a.ImageFlowID+"_loading_txt").style.paddingTop=f*.5-22+"px",d.style.height=f+"px",this.loadingProgress()}}},this.createStructure=function(){var b=a.Helper.createDocumentElement("div","images"),c,d,e,f,g=a.ImageFlowDiv.childNodes.length;for(var h=0;h<g;h++)c=a.ImageFlowDiv.childNodes[h],c&&c.nodeType==1&&c.nodeName=="IMG"&&(a.reflections===!0&&(d=a.reflectionPNG?"3":"2",e=a.imagePath+c.getAttribute("src",2),e=a.reflectPath+"reflect"+d+".php?img="+e+a.reflectionGET,c.setAttribute("src",e)),f=c.cloneNode(!0),b.appendChild(f));if(a.circular){var i=a.Helper.createDocumentElement("div","images"),j=a.Helper.createDocumentElement("div","images");g=b.childNodes.length,g<a.imageFocusMax&&(a.imageFocusMax=g);if(g>1){var k;for(k=0;k<g;k++)c=b.childNodes[k],k<a.imageFocusMax&&(f=c.cloneNode(!0),i.appendChild(f)),g-k<a.imageFocusMax+1&&(f=c.cloneNode(!0),j.appendChild(f));for(k=0;k<g;k++)c=b.childNodes[k],f=c.cloneNode(!0),j.appendChild(f);for(k=0;k<a.imageFocusMax;k++)c=i.childNodes[k],f=c.cloneNode(!0),j.appendChild(f);b=j}}if(a.slideshow){var l=a.Helper.createDocumentElement("div","slideshow");b.appendChild(l)}var m=a.Helper.createDocumentElement("p","loading_txt"),n=document.createTextNode(" ");m.appendChild(n);var o=a.Helper.createDocumentElement("div","loading"),p=a.Helper.createDocumentElement("div","loading_bar");o.appendChild(p);var q=a.Helper.createDocumentElement("div","caption"),r=a.Helper.createDocumentElement("div","scrollbar"),s=a.Helper.createDocumentElement("div","slider");r.appendChild(s);if(a.buttons){var t=a.Helper.createDocumentElement("div","previous","button"),u=a.Helper.createDocumentElement("div","next","button");r.appendChild(t),r.appendChild(u)}var v=a.Helper.createDocumentElement("div","navigation");v.appendChild(q),v.appendChild(r);var w=!1;if(a.ImageFlowDiv.appendChild(b)&&a.ImageFlowDiv.appendChild(m)&&a.ImageFlowDiv.appendChild(o)&&a.ImageFlowDiv.appendChild(v)){g=a.ImageFlowDiv.childNodes.length;for(h=0;h<g;h++)c=a.ImageFlowDiv.childNodes[h],c&&c.nodeType==1&&c.nodeName=="IMG"&&a.ImageFlowDiv.removeChild(c);w=!0}return w},this.loadingProgress=function(){var b=a.loadingStatus();(b<100||a.firstCheck)&&a.preloadImages?a.firstCheck&&b==100?(a.firstCheck=!1,window.setTimeout(a.loadingProgress,100)):window.setTimeout(a.loadingProgress,40):(document.getElementById(a.ImageFlowID+"_loading_txt").style.display="none",document.getElementById(a.ImageFlowID+"_loading").style.display="none",window.setTimeout(a.Helper.addResizeEvent,1e3),a.refresh(),a.max>1&&(a.MouseWheel.init(),a.MouseDrag.init(),a.Touch.init(),a.Key.init(),a.slideshow&&a.Slideshow.init(),a.slider&&(a.scrollbarDiv.style.visibility="visible")))},this.loadingStatus=function(){var b=a.imagesDiv.childNodes.length,c=0,d=0,e=null;for(var f=0;f<b;f++)e=a.imagesDiv.childNodes[f],e&&e.nodeType==1&&e.nodeName=="IMG"&&(e.complete&&d++,c++);var g=Math.round(d/c*100),h=document.getElementById(a.ImageFlowID+"_loading_bar");h.style.width=g+"%",a.circular&&(c-=a.imageFocusMax*2,d=g<1?0:Math.round(c/100*g));var i=document.getElementById(a.ImageFlowID+"_loading_txt"),j=document.createTextNode("loading images "+d+"/"+c);return i.replaceChild(j,i.firstChild),g},this.refresh=function(){this.imagesDivWidth=a.imagesDiv.offsetWidth+a.imagesDiv.offsetLeft,this.maxHeight=Math.round(a.imagesDivWidth/a.aspectRatio),this.maxFocus=a.imageFocusMax*a.xStep,this.size=a.imagesDivWidth*.5,this.sliderWidth=a.sliderWidth*.5,this.scrollbarWidth=(a.imagesDivWidth-Math.round(a.sliderWidth)*2)*a.scrollbarP,this.imagesDivHeight=Math.round(a.maxHeight*a.imagesHeight),a.ImageFlowDiv.style.height=a.maxHeight+"px",a.imagesDiv.style.height=a.imagesDivHeight+"px",a.navigationDiv.style.height=a.maxHeight-a.imagesDivHeight+"px",a.captionDiv.style.width=a.imagesDivWidth+"px",a.captionDiv.style.paddingTop=Math.round(a.imagesDivWidth*.02)+"px",a.scrollbarDiv.style.width=a.scrollbarWidth+"px",a.scrollbarDiv.style.marginTop=Math.round(a.imagesDivWidth*.02)+"px",a.scrollbarDiv.style.marginLeft=Math.round(a.sliderWidth+(a.imagesDivWidth-a.scrollbarWidth)/2)+"px",a.sliderDiv.style.cursor=a.sliderCursor,a.sliderDiv.onmousedown=function(){return a.MouseDrag.start(this),!1},a.buttons&&(a.buttonPreviousDiv.onclick=function(){a.MouseWheel.handle(1)},a.buttonNextDiv.onclick=function(){a.MouseWheel.handle(-1)});var b=a.reflections===!0?a.reflectionP+1:1,c=a.imagesDiv.childNodes.length,d=0,e=null;for(var f=0;f<c;f++)e=a.imagesDiv.childNodes[f],e!==null&&e.nodeType==1&&e.nodeName=="IMG"&&(this.indexArray[d]=f,e.url=e.getAttribute("longdesc"),e.xPosition=-d*a.xStep,e.i=d,a.firstRefresh&&(e.getAttribute("width")!==null&&e.getAttribute("height")!==null?(e.w=e.getAttribute("width"),e.h=e.getAttribute("height")*b):(e.w=e.width,e.h=e.height)),e.w>e.h/(a.reflectionP+1)?(e.pc=a.percentLandscape,e.pcMem=a.percentLandscape):(e.pc=a.percentOther,e.pcMem=a.percentOther),a.imageScaling===!1&&(e.style.position="relative",e.style.display="inline"),e.style.cursor=a.imageCursor,d++);this.max=a.indexArray.length,a.imageScaling===!1&&(e=a.imagesDiv.childNodes[a.indexArray[0]],this.totalImagesWidth=e.w*a.max,e.style.paddingLeft=a.imagesDivWidth/2+e.w/2+"px",a.imagesDiv.style.height=e.h+"px",a.navigationDiv.style.height=a.maxHeight-e.h+"px"),a.firstRefresh&&(a.firstRefresh=!1,a.imageID=a.startID-1,a.imageID<0&&(a.imageID=0),a.circular&&(a.imageID=a.imageID+a.imageFocusMax),maxId=a.circular?a.max-a.imageFocusMax-1:a.max-1,a.imageID>maxId&&(a.imageID=maxId),a.glideToStartID===!1&&a.moveTo(-a.imageID*a.xStep),a.startAnimation&&a.moveTo(5e3)),a.max>1&&a.glideTo(a.imageID),a.moveTo(a.current)},this.moveTo=function(b){this.current=b,this.zIndex=a.max;for(var c=0;c<a.max;c++){var d=a.imagesDiv.childNodes[a.indexArray[c]],e=c*-a.xStep;if(a.imageScaling)if(e+a.maxFocus<a.memTarget||e-a.maxFocus>a.memTarget)d.style.visibility="hidden",d.style.display="none";else{var f=(Math.sqrt(1e4+b*b)+100)*a.imagesM,g=b/f*a.size+a.size;d.style.display="block";var h=d.h/d.w*d.pc/f*a.size,i=0;switch(h>a.maxHeight){case!1:i=d.pc/f*a.size;break;default:h=a.maxHeight,i=d.w*h/d.h}var j=a.imagesDivHeight-h+h/(a.reflectionP+1)*a.reflectionP;d.style.left=g-d.pc/2/f*a.size+"px",i&&h&&(d.style.height=h+"px",d.style.width=i+"px",d.style.top=j+"px"),d.style.visibility="visible";switch(b<0){case!0:this.zIndex++;break;default:this.zIndex=a.zIndex-1}switch(d.i==a.imageID){case!1:d.onclick=function(){a.glideTo(this.i)};break;default:this.zIndex=a.zIndex+1,d.url!==""&&(d.onclick=a.onClick)}d.style.zIndex=a.zIndex}else{if(e+a.maxFocus<a.memTarget||e-a.maxFocus>a.memTarget)d.style.visibility="hidden";else{d.style.visibility="visible";switch(d.i==a.imageID){case!1:d.onclick=function(){a.glideTo(this.i)};break;default:d.url!==""&&(d.onclick=a.onClick)}}a.imagesDiv.style.marginLeft=b-a.totalImagesWidth+"px"}b+=a.xStep}},this.glideTo=function(b){var c,d;a.circular&&(b+1===a.imageFocusMax&&(d=a.max-a.imageFocusMax,c=-d*a.xStep,b=d-1),b===a.max-a.imageFocusMax&&(d=a.imageFocusMax-1,c=-d*a.xStep,b=d+1));var e=-b*a.xStep;this.target=e,this.memTarget=e,this.imageID=b;var f=a.imagesDiv.childNodes[b].getAttribute("alt");if(f===""||a.captions===!1)f="&nbsp;";a.captionDiv.innerHTML=f,$(".art_kv_info").children("img").attr("src","/assets/paint_art/art_kv/"+f),a.MouseDrag.busy===!1&&(a.circular?this.newSliderX=(b-a.imageFocusMax)*a.scrollbarWidth/(a.max-a.imageFocusMax*2-1)-a.MouseDrag.newX:this.newSliderX=b*a.scrollbarWidth/(a.max-1)-a.MouseDrag.newX,a.sliderDiv.style.marginLeft=a.newSliderX-a.sliderWidth+"px");if(a.opacity===!0||a.imageFocusM!==a.defaults.imageFocusM){a.Helper.setOpacity(a.imagesDiv.childNodes[b],a.opacityArray[0]),a.imagesDiv.childNodes[b].pc=a.imagesDiv.childNodes[b].pc*a.imageFocusM;var g=0,h=0,i=0,j=a.opacityArray.length;for(var k=1;k<a.imageFocusMax+1;k++)k+1>j?g=a.opacityArray[j-1]:g=a.opacityArray[k],h=b+k,i=b-k,h<a.max&&(a.Helper.setOpacity(a.imagesDiv.childNodes[h],g),a.imagesDiv.childNodes[h].pc=a.imagesDiv.childNodes[h].pcMem),i>=0&&(a.Helper.setOpacity(a.imagesDiv.childNodes[i],g),a.imagesDiv.childNodes[i].pc=a.imagesDiv.childNodes[i].pcMem)}c&&a.moveTo(c),a.busy===!1&&(a.busy=!0,a.animate())},this.animate=function(){switch(a.target<a.current-1||a.target>a.current+1){case!0:a.moveTo(a.current+(a.target-a.current)/3),window.setTimeout(a.animate,a.animationSpeed),a.busy=!0;break;default:a.busy=!1}},this.glideOnEvent=function(b){a.slideshow&&a.Slideshow.interrupt(),a.glideTo(b)},this.Slideshow={direction:1,init:function(){a.slideshowAutoplay?a.Slideshow.start():a.Slideshow.stop()},interrupt:function(){a.Helper.removeEvent(a.ImageFlowDiv,"click",a.Slideshow.interrupt),a.Slideshow.stop()},addInterruptEvent:function(){a.Helper.addEvent(a.ImageFlowDiv,"click",a.Slideshow.interrupt)},start:function(){a.Helper.setClassName(a.buttonSlideshow,"slideshow pause"),a.buttonSlideshow.onclick=function(){a.Slideshow.stop()},a.Slideshow.action=window.setInterval(a.Slideshow.slide,a.slideshowSpeed),window.setTimeout(a.Slideshow.addInterruptEvent,100)},stop:function(){a.Helper.setClassName(a.buttonSlideshow,"slideshow play"),a.buttonSlideshow.onclick=function(){a.Slideshow.start()},window.clearInterval(a.Slideshow.action)},slide:function(){var b=a.imageID+a.Slideshow.direction,c=!1;b===a.max&&(a.Slideshow.direction=-1,c=!0),b<0&&(a.Slideshow.direction=1,c=!0),c?a.Slideshow.slide():a.glideTo(b)}},this.MouseWheel={init:function(){window.addEventListener&&a.ImageFlowDiv.addEventListener("DOMMouseScroll",a.MouseWheel.get,!1),a.Helper.addEvent(a.ImageFlowDiv,"mousewheel",a.MouseWheel.get)},get:function(b){var c=0;b||(b=window.event),b.wheelDelta?c=b.wheelDelta/120:b.detail&&(c=-b.detail/3),c&&a.MouseWheel.handle(c),a.Helper.suppressBrowserDefault(b)},handle:function(b){var c=!1,d=0;b>0?a.imageID>=1&&(d=a.imageID-1,c=!0):a.imageID<a.max-1&&(d=a.imageID+1,c=!0),c&&a.glideOnEvent(d)}},this.MouseDrag={object:null,objectX:0,mouseX:0,newX:0,busy:!1,init:function(){a.Helper.addEvent(a.ImageFlowDiv,"mousemove",a.MouseDrag.drag),a.Helper.addEvent(a.ImageFlowDiv,"mouseup",a.MouseDrag.stop),a.Helper.addEvent(document,"mouseup",a.MouseDrag.stop),a.ImageFlowDiv.onselectstart=function(){var b=!0;return a.MouseDrag.busy&&(b=!1),b}},start:function(b){a.MouseDrag.object=b,a.MouseDrag.objectX=a.MouseDrag.mouseX-b.offsetLeft+a.newSliderX},stop:function(){a.MouseDrag.object=null,a.MouseDrag.busy=!1},drag:function(b){var c=0;b||(b=window.event),b.pageX?c=b.pageX:b.clientX&&(c=b.clientX+document.body.scrollLeft+document.documentElement.scrollLeft),a.MouseDrag.mouseX=c;if(a.MouseDrag.object!==null){var d=a.MouseDrag.mouseX-a.MouseDrag.objectX+a.sliderWidth;d<-a.newSliderX&&(d=-a.newSliderX),d>a.scrollbarWidth-a.newSliderX&&(d=a.scrollbarWidth-a.newSliderX);var e,f;a.circular?(e=(d+a.newSliderX)/(a.scrollbarWidth/(a.max-a.imageFocusMax*2-1)),f=Math.round(e)+a.imageFocusMax):(e=(d+a.newSliderX)/(a.scrollbarWidth/(a.max-1)),f=Math.round(e)),a.MouseDrag.newX=d,a.MouseDrag.object.style.left=d+"px",a.imageID!==f&&a.glideOnEvent(f),a.MouseDrag.busy=!0}}},this.Touch={x:0,startX:0,stopX:0,busy:!1,first:!0,init:function(){a.Helper.addEvent(a.navigationDiv,"touchstart",a.Touch.start),a.Helper.addEvent(document,"touchmove",a.Touch.handle),a.Helper.addEvent(document,"touchend",a.Touch.stop)},isOnNavigationDiv:function(b){var c=!1;if(b.touches){var d=b.touches[0].target;if(d===a.navigationDiv||d===a.sliderDiv||d===a.scrollbarDiv)c=!0}return c},getX:function(a){var b=0;return a.touches&&(b=a.touches[0].pageX),b},start:function(b){a.Touch.startX=a.Touch.getX(b),a.Touch.busy=!0,a.Helper.suppressBrowserDefault(b)},isBusy:function(){var b=!1;return a.Touch.busy&&(b=!0),b},handle:function(b){if(a.Touch.isBusy&&a.Touch.isOnNavigationDiv(b)){var c=a.circular?a.max-a.imageFocusMax*2-1:a.max-1;a.Touch.first&&(a.Touch.stopX=(c-a.imageID)*(a.imagesDivWidth/c),a.Touch.first=!1);var d=-(a.Touch.getX(b)-a.Touch.startX-a.Touch.stopX);d<0&&(d=0),d>a.imagesDivWidth&&(d=a.imagesDivWidth),a.Touch.x=d;var e=Math.round(d/(a.imagesDivWidth/c));e=c-e,a.imageID!==e&&(a.circular&&(e+=a.imageFocusMax),a.glideOnEvent(e)),a.Helper.suppressBrowserDefault(b)}},stop:function(){a.Touch.stopX=a.Touch.x,a.Touch.busy=!1}},this.Key={init:function(){document.onkeydown=function(b){a.Key.handle(b)}},handle:function(b){var c=a.Key.get(b);switch(c){case 39:a.MouseWheel.handle(-1);break;case 37:a.MouseWheel.handle(1)}},get:function(a){return a=a||window.event,a.keyCode}},this.Helper={addEvent:function(a,b,c){a.addEventListener?a.addEventListener(b,c,!1):a.attachEvent&&(a["e"+b+c]=c,a[b+c]=function(){a["e"+b+c](window.event)},a.attachEvent("on"+b,a[b+c]))},removeEvent:function(a,b,c){a.removeEventListener?a.removeEventListener(b,c,!1):a.detachEvent&&(a[b+c]===undefined&&alert("Helper.removeEvent » Pointer to detach event is undefined - perhaps you are trying to detach an unattached event?"),a.detachEvent("on"+b,a[b+c]),a[b+c]=null,a["e"+b+c]=null)},setOpacity:function(b,c){a.opacity===!0&&(b.style.opacity=c/10,b.style.filter="alpha(opacity="+c*10+")")},createDocumentElement:function(b,c,d){var e=document.createElement(b);return e.setAttribute("id",a.ImageFlowID+"_"+c),d!==undefined&&(c+=" "+d),a.Helper.setClassName(e,c),e},setClassName:function(a,b){a&&(a.setAttribute("class",b),a.setAttribute("className",b))},suppressBrowserDefault:function(a){return a.preventDefault?a.preventDefault():a.returnValue=!1,!1},addResizeEvent:function(){var b=window.onresize;typeof window.onresize!="function"?window.onresize=function(){a.refresh()}:window.onresize=function(){b&&b(),a.refresh()}}}}var domReadyEvent={name:"domReadyEvent",events:{},domReadyID:1,bDone:!1,DOMContentLoadedCustom:null,add:function(a){a.$$domReadyID||(a.$$domReadyID=this.domReadyID++,this.bDone&&a(),this.events[a.$$domReadyID]=a)},remove:function(a){a.$$domReadyID&&delete this.events[a.$$domReadyID]},run:function(){if(this.bDone)return;this.bDone=!0;for(var a in this.events)this.events[a]()},schedule:function(){if(this.bDone)return;if(/KHTML|WebKit/i.test(navigator.userAgent))/loaded|complete/.test(document.readyState)?this.run():setTimeout(this.name+".schedule()",100);else if(document.getElementById("__ie_onload"))return!0;return typeof this.DOMContentLoadedCustom=="function"&&typeof document.getElementsByTagName!="undefined"&&(document.getElementsByTagName("body")[0]!==null||document.body!==null)&&(this.DOMContentLoadedCustom()?this.run():setTimeout(this.name+".schedule()",250)),!0},init:function(){function a(){domReadyEvent.run()}document.addEventListener&&document.addEventListener("DOMContentLoaded",function(){domReadyEvent.run()},!1),setTimeout("domReadyEvent.schedule()",100);if(typeof addEvent!="undefined")addEvent(window,"load",a);else if(document.addEventListener)document.addEventListener("load",a,!1);else if(typeof window.onload=="function"){var b=window.onload;window.onload=function(){domReadyEvent.run(),b()}}else window.onload=a}},domReady=function(a){domReadyEvent.add(a)};domReadyEvent.init();