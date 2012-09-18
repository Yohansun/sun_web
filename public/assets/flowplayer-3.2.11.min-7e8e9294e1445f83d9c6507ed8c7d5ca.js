/*
 * flowplayer.js 3.2.11. The Flowplayer API
 */
(function(){function e(e){console.log("$f.fireEvent",[].slice.call(e))}function t(e){if(!e||typeof e!="object")return e;var n=new e.constructor;for(var r in e)e.hasOwnProperty(r)&&(n[r]=t(e[r]));return n}function n(e,t){if(!e)return;var n,r=0,i=e.length;if(i===undefined){for(n in e)if(t.call(e[n],n,e[n])===!1)break}else for(var s=e[0];r<i&&t.call(s,r,s)!==!1;s=e[++r]);return e}function r(e){return document.getElementById(e)}function i(e,t,r){return typeof t!="object"?e:(e&&t&&n(t,function(t,n){if(!r||typeof n!="function")e[t]=n}),e)}function s(e){var t=e.indexOf(".");if(t!=-1){var r=e.slice(0,t)||"*",i=e.slice(t+1,e.length),s=[];return n(document.getElementsByTagName(r),function(){this.className&&this.className.indexOf(i)!=-1&&s.push(this)}),s}}function o(e){return e=e||window.event,e.preventDefault?(e.stopPropagation(),e.preventDefault()):(e.returnValue=!1,e.cancelBubble=!0),!1}function u(e,t,n){e[t]=e[t]||[],e[t].push(n)}function a(){return"_"+(""+Math.random()).slice(2,10)}function c(s,c,p){function M(){function t(e){return/iPad|iPhone|iPod/i.test(navigator.userAgent)&&!/.flv$/i.test(E[0].url)&&!r()?!0:(!d.isLoaded()&&d._fireEvent("onBeforeClick")!==!1&&d.load(),o(e))}function r(){return d.hasiPadSupport&&d.hasiPadSupport()}function i(){b.replace(/\s/g,"")!==""?s.addEventListener?s.addEventListener("click",t,!1):s.attachEvent&&s.attachEvent("onclick",t):(s.addEventListener&&!r()&&s.addEventListener("click",o,!1),d.load())}$f(s)?($f(s).getParent().innerHTML="",C=$f(s).getIndex(),h[C]=d):(h.push(d),C=h.length-1),O=parseInt(s.style.height,10)||s.clientHeight,T=s.id||"fp"+a(),N=c.id||T+"_api",c.id=N,b=s.innerHTML,typeof p=="string"&&(p={clip:{url:p}}),p.playerId=T,p.clip=p.clip||{},s.getAttribute("href",2)&&!p.clip.url&&(p.clip.url=s.getAttribute("href",2)),w=new f(p.clip,-1,d),p.playlist=p.playlist||[p.clip];var e=0;n(p.playlist,function(){var t=this;typeof t=="object"&&t.length&&(t={url:""+t}),n(p.clip,function(e,n){n!==undefined&&t[e]===undefined&&typeof n!="function"&&(t[e]=n)}),p.playlist[e]=t,t=new f(t,e,d),E.push(t),e++}),n(p,function(e,t){typeof t=="function"&&(w[e]?w[e](t):u(x,e,t),delete p[e])}),n(p.plugins,function(e,t){t&&(S[e]=new l(e,t,d))});if(!p.plugins||p.plugins.controls===undefined)S.controls=new l("controls",null,d);S.canvas=new l("canvas",null,d),b=s.innerHTML,setTimeout(i,0)}var d=this,v=null,y=!1,b,w,E=[],S={},x={},T,N,C,L,A,O;i(d,{id:function(){return T},isLoaded:function(){return v!==null&&v.fp_play!==undefined&&!y},getParent:function(){return s},hide:function(e){return e&&(s.style.height="0px"),d.isLoaded()&&(v.style.height="0px"),d},show:function(){return s.style.height=O+"px",d.isLoaded()&&(v.style.height=A+"px"),d},isHidden:function(){return d.isLoaded()&&parseInt(v.style.height,10)===0},load:function(e){if(!d.isLoaded()&&d._fireEvent("onBeforeLoad")!==!1){var t=function(){b&&!flashembed.isSupported(c.version)&&(s.innerHTML=""),e&&(e.cached=!0,u(x,"onLoad",e)),flashembed(s,c,{config:p})},r=0;n(h,function(){this.unload(function(e){++r==h.length&&t()})})}return d},unload:function(e){if(b.replace(/\s/g,"")!==""){if(d._fireEvent("onBeforeUnload")===!1)return e&&e(!1),d;y=!0;try{v&&(v.fp_isFullscreen()&&v.fp_toggleFullscreen(),v.fp_close(),d._fireEvent("onUnload"))}catch(t){}var n=function(){v=null,s.innerHTML=b,y=!1,e&&e(!0)};/WebKit/i.test(navigator.userAgent)&&!/Chrome/i.test(navigator.userAgent)?setTimeout(n,0):n()}else e&&e(!1);return d},getClip:function(e){return e===undefined&&(e=L),E[e]},getCommonClip:function(){return w},getPlaylist:function(){return E},getPlugin:function(e){var t=S[e];if(!t&&d.isLoaded()){var n=d._api().fp_getPlugin(e);n&&(t=new l(e,n,d),S[e]=t)}return t},getScreen:function(){return d.getPlugin("screen")},getControls:function(){return d.getPlugin("controls")._fireEvent("onUpdate")},getLogo:function(){try{return d.getPlugin("logo")._fireEvent("onUpdate")}catch(e){}},getPlay:function(){return d.getPlugin("play")._fireEvent("onUpdate")},getConfig:function(e){return e?t(p):p},getFlashParams:function(){return c},loadPlugin:function(e,t,n,r){typeof n=="function"&&(r=n,n={});var i=r?a():"_";d._api().fp_loadPlugin(e,t,n,i);var s={};s[i]=r;var o=new l(e,null,d,s);return S[e]=o,o},getState:function(){return d.isLoaded()?v.fp_getState():-1},play:function(e,t){var n=function(){e!==undefined?d._api().fp_play(e,t):d._api().fp_play()};return d.isLoaded()?n():y?setTimeout(function(){d.play(e,t)},50):d.load(function(){n()}),d},getVersion:function(){var e="flowplayer.js 3.2.11";if(d.isLoaded()){var t=v.fp_getVersion();return t.push(e),t}return e},_api:function(){if(!d.isLoaded())throw"Flowplayer "+d.id()+" not loaded when calling an API method";return v},setClip:function(e){return n(e,function(t,n){typeof n=="function"?(u(x,t,n),delete e[t]):t=="onCuepoint"&&$f(s).getCommonClip().onCuepoint(e[t][0],e[t][1])}),d.setPlaylist([e]),d},getIndex:function(){return C},bufferAnimate:function(e){return v.fp_bufferAnimate(e===undefined||e),d},_swfHeight:function(){return v.clientHeight}}),n("Click*,Load*,Unload*,Keypress*,Volume*,Mute*,Unmute*,PlaylistReplace,ClipAdd,Fullscreen*,FullscreenExit,Error,MouseOver,MouseOut".split(","),function(){var e="on"+this;if(e.indexOf("*")!=-1){e=e.slice(0,e.length-1);var t="onBefore"+e.slice(2);d[t]=function(e){return u(x,t,e),d}}d[e]=function(t){return u(x,e,t),d}}),n("pause,resume,mute,unmute,stop,toggle,seek,getStatus,getVolume,setVolume,getTime,isPaused,isPlaying,startBuffering,stopBuffering,isFullscreen,toggleFullscreen,reset,close,setPlaylist,addClip,playFeed,setKeyboardShortcutsEnabled,isKeyboardShortcutsEnabled".split(","),function(){var e=this;d[e]=function(t,n){if(!d.isLoaded())return d;var r=null;return t!==undefined&&n!==undefined?r=v["fp_"+e](t,n):r=t===undefined?v["fp_"+e]():v["fp_"+e](t),r==="undefined"||r===undefined?d:r}}),d._fireEvent=function(t){typeof t=="string"&&(t=[t]);var i=t[0],s=t[1],o=t[2],u=t[3],a=0;p.debug&&e(t),!d.isLoaded()&&i=="onLoad"&&s=="player"&&(v=v||r(N),A=d._swfHeight(),n(E,function(){this._fireEvent("onLoad")}),n(S,function(e,t){t._fireEvent("onUpdate")}),w._fireEvent("onLoad"));if(i=="onLoad"&&s!="player")return;i=="onError"&&(typeof s=="string"||typeof s=="number"&&typeof o=="number")&&(s=o,o=u);if(i=="onContextMenu"){n(p.contextMenu[s],function(e,t){t.call(d)});return}if(i=="onPluginEvent"||i=="onBeforePluginEvent"){var l=s.name||s,c=S[l];if(c)return c._fireEvent("onUpdate",s),c._fireEvent(o,t.slice(3));return}if(i=="onPlaylistReplace"){E=[];var h=0;n(s,function(){E.push(new f(this,h++,d))})}if(i=="onClipAdd"){if(s.isInStream)return;s=new f(s,o,d),E.splice(o,0,s);for(a=o+1;a<E.length;a++)E[a].index++}var y=!0;if(typeof s=="number"&&s<E.length){L=s;var b=E[s];b&&(y=b._fireEvent(i,o,u));if(!b||y!==!1)y=w._fireEvent(i,o,u,b)}return n(x[i],function(){y=this.call(d,s,o),this.cached&&x[i].splice(a,1);if(y===!1)return!1;a++}),y};if(typeof s=="string"){var _=r(s);if(!_)throw"Flowplayer cannot access element: "+s;s=_,M()}else M()}function p(e){this.length=e.length,this.each=function(t){n(e,t)},this.size=function(){return e.length};var t=this;for(name in c.prototype)t[name]=function(){var e=arguments;t.each(function(){this[name].apply(this,e)})}}var f=function(e,t,r){var s=this,o={},f={};s.index=t,typeof e=="string"&&(e={url:e}),i(this,e,!0),n("Begin*,Start,Pause*,Resume*,Seek*,Stop*,Finish*,LastSecond,Update,BufferFull,BufferEmpty,BufferStop".split(","),function(){var e="on"+this;if(e.indexOf("*")!=-1){e=e.slice(0,e.length-1);var n="onBefore"+e.slice(2);s[n]=function(e){return u(f,n,e),s}}s[e]=function(t){return u(f,e,t),s},t==-1&&(s[n]&&(r[n]=s[n]),s[e]&&(r[e]=s[e]))}),i(this,{onCuepoint:function(e,n){if(arguments.length==1)return o.embedded=[null,e],s;typeof e=="number"&&(e=[e]);var i=a();return o[i]=[e,n],r.isLoaded()&&r._api().fp_addCuepoints(e,t,i),s},update:function(e){i(s,e),r.isLoaded()&&r._api().fp_updateClip(e,t);var n=r.getConfig(),o=t==-1?n.clip:n.playlist[t];i(o,e,!0)},_fireEvent:function(e,u,a,l){if(e=="onLoad")return n(o,function(e,n){n[0]&&r._api().fp_addCuepoints(n[0],t,e)}),!1;l=l||s;if(e=="onCuepoint"){var c=o[u];if(c)return c[1].call(r,l,a)}u&&"onBeforeBegin,onMetaData,onStart,onUpdate,onResume".indexOf(e)!=-1&&(i(l,u),u.metaData&&(l.duration?l.fullDuration=u.metaData.duration:l.duration=u.metaData.duration));var h=!0;return n(f[e],function(){h=this.call(r,l,u,a)}),h}});if(e.onCuepoint){var l=e.onCuepoint;s.onCuepoint.apply(s,typeof l=="function"?[l]:l),delete e.onCuepoint}n(e,function(t,n){typeof n=="function"&&(u(f,t,n),delete e[t])}),t==-1&&(r.onCuepoint=this.onCuepoint)},l=function(e,t,r,s){var o=this,u={},f=!1;s&&i(u,s),n(t,function(e,n){typeof n=="function"&&(u[e]=n,delete t[e])}),i(this,{animate:function(n,i,s){if(!n)return o;typeof i=="function"&&(s=i,i=500);if(typeof n=="string"){var f=n;n={},n[f]=i,i=500}if(s){var l=a();u[l]=s}return i===undefined&&(i=500),t=r._api().fp_animate(e,n,i,l),o},css:function(n,s){if(s!==undefined){var u={};u[n]=s,n=u}return t=r._api().fp_css(e,n),i(o,t),o},show:function(){return this.display="block",r._api().fp_showPlugin(e),o},hide:function(){return this.display="none",r._api().fp_hidePlugin(e),o},toggle:function(){return this.display=r._api().fp_togglePlugin(e),o},fadeTo:function(t,n,i){typeof n=="function"&&(i=n,n=500);if(i){var s=a();u[s]=i}return this.display=r._api().fp_fadeTo(e,t,n,s),this.opacity=t,o},fadeIn:function(e,t){return o.fadeTo(1,e,t)},fadeOut:function(e,t){return o.fadeTo(0,e,t)},getName:function(){return e},getPlayer:function(){return r},_fireEvent:function(t,s,a){if(t=="onUpdate"){var l=r._api().fp_getPlugin(e);if(!l)return;i(o,l),delete o.methods,f||(n(l.methods,function(){var t=""+this;o[t]=function(){var n=[].slice.call(arguments),i=r._api().fp_invoke(e,t,n);return i==="undefined"||i===undefined?o:i}}),f=!0)}var c=u[t];if(c){var h=c.apply(o,s);return t.slice(0,1)=="_"&&delete u[t],h}return o}})},h=[];window.flowplayer=window.$f=function(){var e=null,o=arguments[0];if(!arguments.length)return n(h,function(){if(this.isLoaded())return e=this,!1}),e||h[0];if(arguments.length==1)return typeof o=="number"?h[o]:o=="*"?new p(h):(n(h,function(){if(this.id()==o.id||this.id()==o||this.getParent()==o)return e=this,!1}),e);if(arguments.length>1){var u=arguments[1],a=arguments.length==3?arguments[2]:{};typeof u=="string"&&(u={src:u}),u=i({bgcolor:"#000000",version:[10,1],expressInstall:"http://releases.flowplayer.org/swf/expressinstall.swf",cachebusting:!1},u);if(typeof o=="string"){if(o.indexOf(".")!=-1){var f=[];return n(s(o),function(){f.push(new c(this,t(u),t(a)))}),new p(f)}var l=r(o);return new c(l!==null?l:t(o),t(u),t(a))}if(o)return new c(o,t(u),t(a))}return null},i(window.$f,{fireEvent:function(){var e=[].slice.call(arguments),t=$f(e[0]);return t?t._fireEvent(e.slice(1)):null},addPlugin:function(e,t){return c.prototype[e]=t,$f},each:n,extend:i}),typeof jQuery=="function"&&(jQuery.fn.flowplayer=function(e,n){if(!arguments.length||typeof arguments[0]=="number"){var r=[];return this.each(function(){var e=$f(this);e&&r.push(e)}),arguments.length?r[arguments[0]]:new p(r)}return this.each(function(){$f(this,t(e),n?t(n):{})})})})(),function(){function s(e,t){if(t)for(var n in t)t.hasOwnProperty(n)&&(e[n]=t[n]);return e}function o(e,t){var n=[];for(var r in e)e.hasOwnProperty(r)&&(n[r]=t(e[r]));return n}function f(n,r,i){if(u.isSupported(r.version))n.innerHTML=u.getHTML(r,i);else if(r.expressInstall&&u.isSupported([6,65]))n.innerHTML=u.getHTML(s(r,{src:r.expressInstall}),{MMredirectURL:encodeURIComponent(location.href),MMplayerType:"PlugIn",MMdoctitle:document.title});else{if(!n.innerHTML.replace(/\s/g,"")){n.innerHTML="<h2>Flash version "+r.version+" or greater is required</h2><h3>"+(a[0]>0?"Your version is "+a:"You have no flash plugin installed")+"</h3>"+(n.tagName=="A"?"<p>Click here to download latest version</p>":"<p>Download latest version from <a href='"+t+"'>here</a></p>");if(n.tagName=="A"||n.tagName=="DIV")n.onclick=function(){location.href=t}}if(r.onFail){var o=r.onFail.call(this);typeof o=="string"&&(n.innerHTML=o)}}e&&(window[r.id]=document.getElementById(r.id)),s(this,{getRoot:function(){return n},getOptions:function(){return r},getConf:function(){return i},getApi:function(){return n.firstChild}})}var e=document.all,t="http://get.adobe.com/flashplayer",n=typeof jQuery=="function",r=/(\d+)[^\d]+(\d+)[^\d]*(\d*)/,i={width:"100%",height:"100%",id:"_"+(""+Math.random()).slice(9),allowfullscreen:!0,allowscriptaccess:"always",quality:"high",version:[3,0],onFail:null,expressInstall:null,w3c:!1,cachebusting:!1};window.attachEvent&&window.attachEvent("onbeforeunload",function(){__flash_unloadHandler=function(){},__flash_savedUnloadHandler=function(){}}),window.flashembed=function(e,t,n){typeof e=="string"&&(e=document.getElementById(e.replace("#","")));if(!e)return;return typeof t=="string"&&(t={src:t}),new f(e,s(s({},i),t),n)};var u=s(window.flashembed,{conf:i,getVersion:function(){var e,t;try{t=navigator.plugins["Shockwave Flash"].description.slice(16)}catch(n){try{e=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7"),t=e&&e.GetVariable("$version")}catch(i){try{e=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6"),t=e&&e.GetVariable("$version")}catch(s){}}}return t=r.exec(t),t?[1*t[1],1*t[t[1]*1>9?2:3]*1]:[0,0]},asString:function(e){if(e===null||e===undefined)return null;var t=typeof e;t=="object"&&e.push&&(t="array");switch(t){case"string":return e=e.replace(new RegExp('(["\\\\])',"g"),"\\$1"),e=e.replace(/^\s?(\d+\.?\d*)%/,"$1pct"),'"'+e+'"';case"array":return"["+o(e,function(e){return u.asString(e)}).join(",")+"]";case"function":return'"function()"';case"object":var n=[];for(var r in e)e.hasOwnProperty(r)&&n.push('"'+r+'":'+u.asString(e[r]));return"{"+n.join(",")+"}"}return String(e).replace(/\s/g," ").replace(/\'/g,'"')},getHTML:function(t,n){t=s({},t);var r='<object width="'+t.width+'" height="'+t.height+'" id="'+t.id+'" name="'+t.id+'"';t.cachebusting&&(t.src+=(t.src.indexOf("?")!=-1?"&":"?")+Math.random()),t.w3c||!e?r+=' data="'+t.src+'" type="application/x-shockwave-flash"':r+=' classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"',r+=">";if(t.w3c||e)r+='<param name="movie" value="'+t.src+'" />';t.width=t.height=t.id=t.w3c=t.src=null,t.onFail=t.version=t.expressInstall=null;for(var i in t)t[i]&&(r+='<param name="'+i+'" value="'+t[i]+'" />');var o="";if(n){for(var a in n)if(n[a]){var f=n[a];o+=a+"="+(/function|object/.test(typeof f)?u.asString(f):f)+"&"}o=o.slice(0,-1),r+='<param name="wmode" value="transparent" /><param name="flashvars" value=\''+o+"' />"}return r+="</object>",r},isSupported:function(e){return a[0]>e[0]||a[0]==e[0]&&a[1]>=e[1]}}),a=u.getVersion();n&&(jQuery.tools=jQuery.tools||{version:"3.2.11"},jQuery.tools.flashembed={conf:i},jQuery.fn.flashembed=function(e,t){return this.each(function(){$(this).data("flashembed",flashembed(this,e,t))})})}();