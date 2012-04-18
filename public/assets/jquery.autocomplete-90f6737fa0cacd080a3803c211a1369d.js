/*
 * jQuery Autocomplete plugin 1.2.2
 *
 * Copyright (c) 2009 Jörn Zaefferer
 *
 * Dual licensed under the MIT and GPL licenses:
 *   http://www.opensource.org/licenses/mit-license.php
 *   http://www.gnu.org/licenses/gpl.html
 *
 * With small modifications by Alfonso Gómez-Arzola.
 * See changelog for details.
 *
 */
(function(a){a.fn.extend({autocomplete:function(b,c){var d=typeof b=="string";return c=a.extend({},a.Autocompleter.defaults,{url:d?b:null,data:d?null:b,delay:d?a.Autocompleter.defaults.delay:10,max:c&&!c.scroll?10:150},c),c.highlight=c.highlight||function(a){return a},c.formatMatch=c.formatMatch||c.formatItem,this.each(function(){new a.Autocompleter(this,c)})},result:function(a){return this.bind("result",a)},search:function(a){return this.trigger("search",[a])},flushCache:function(){return this.trigger("flushCache")},setOptions:function(a){return this.trigger("setOptions",[a])},unautocomplete:function(){return this.trigger("unautocomplete")}}),a.Autocompleter=function(b,c){function o(){var d=m.selected();if(!d)return!1;var e=d.result;h=e;if(c.multiple){var g=q(f.val());if(g.length>1){var i=c.multipleSeparator.length,j=a(b).selection().start,k,l=0;a.each(g,function(a,b){l+=b.length;if(j<=l)return k=a,!1;l+=i}),g[k]=e,e=g.join(c.multipleSeparator)}e+=c.multipleSeparator}return f.val(e),u(),f.trigger("result",[d.data,d.value]),!0}function p(a,b){if(k==d.DEL){m.hide();return}var e=f.val();if(!b&&e==h)return;h=e,e=r(e),e.length>=c.minChars?(f.addClass(c.loadingClass),c.matchCase||(e=e.toLowerCase()),w(e,v,u)):(y(),m.hide())}function q(b){return b?c.multiple?a.map(b.split(c.multipleSeparator),function(c){return a.trim(b).length?a.trim(c):null}):[a.trim(b)]:[""]}function r(d){if(!c.multiple)return d;var e=q(d);if(e.length==1)return e[0];var f=a(b).selection().start;return f==d.length?e=q(d):e=q(d.replace(d.substring(f),"")),e[e.length-1]}function s(e,g){c.autoFill&&r(f.val()).toLowerCase()==e.toLowerCase()&&k!=d.BACKSPACE&&(f.val(f.val()+g.substring(r(h).length)),a(b).selection(h.length,h.length+g.length))}function t(){clearTimeout(g),g=setTimeout(u,200)}function u(){var a=m.visible();m.hide(),clearTimeout(g),y(),c.mustMatch&&f.search(function(a){if(!a)if(c.multiple){var b=q(f.val()).slice(0,-1);f.val(b.join(c.multipleSeparator)+(b.length?c.multipleSeparator:""))}else f.val(""),f.trigger("result",null)})}function v(a,b){b&&b.length&&j?(y(),m.display(b,a),s(a,b[0].value),m.show()):u()}function w(d,f,g){c.matchCase||(d=d.toLowerCase());var h=i.load(d);if(h&&h.length)f(d,h);else if(typeof c.url=="string"&&c.url.length>0){var j={timestamp:+(new Date)};a.each(c.extraParams,function(a,b){j[a]=typeof b=="function"?b():b}),a.ajax({mode:"abort",port:"autocomplete"+b.name,dataType:c.dataType,url:c.url,data:a.extend({q:r(d),limit:c.max},j),success:function(a){var b=c.parse&&c.parse(a)||x(a);i.add(d,b),f(d,b)}})}else m.emptyList(),e!=null?e():g(d)}function x(b){var d=[],e=b.split("\n");for(var f=0;f<e.length;f++){var g=a.trim(e[f]);g&&(g=g.split("|"),d[d.length]={data:g,value:g[0],result:c.formatResult&&c.formatResult(g,g[0])||g[0]})}return d}function y(){f.removeClass(c.loadingClass)}var d={UP:38,DOWN:40,DEL:46,TAB:9,RETURN:13,ESC:27,COMMA:188,PAGEUP:33,PAGEDOWN:34,BACKSPACE:8},e=null;c.failure!=null&&typeof c.failure=="function"&&(e=c.failure);var f=a(b).attr("autocomplete","off").addClass(c.inputClass),g,h="",i=a.Autocompleter.Cache(c),j=0,k,l={mouseDownOnSelect:!1},m=a.Autocompleter.Select(c,b,o,l),n;a.browser.opera&&a(b.form).bind("submit.autocomplete",function(){if(n)return n=!1,!1}),f.bind((a.browser.opera?"keypress":"keydown")+".autocomplete",function(b){j=1,k=b.keyCode;switch(b.keyCode){case d.UP:m.visible()?(b.preventDefault(),m.prev()):p(0,!0);break;case d.DOWN:m.visible()?(b.preventDefault(),m.next()):p(0,!0);break;case d.PAGEUP:m.visible()?(b.preventDefault(),m.pageUp()):p(0,!0);break;case d.PAGEDOWN:m.visible()?(b.preventDefault(),m.pageDown()):p(0,!0);break;case c.multiple&&a.trim(c.multipleSeparator)==","&&d.COMMA:case d.TAB:case d.RETURN:if(o())return b.preventDefault(),n=!0,!1;break;case d.ESC:m.hide();break;default:clearTimeout(g),g=setTimeout(p,c.delay)}}).focus(function(){j++}).blur(function(){j=0,l.mouseDownOnSelect||t()}).click(function(){c.clickFire?m.visible()||p(0,!0):j++>1&&!m.visible()&&p(0,!0)}).bind("search",function(){function c(a,c){var d;if(c&&c.length)for(var e=0;e<c.length;e++)if(c[e].result.toLowerCase()==a.toLowerCase()){d=c[e];break}typeof b=="function"?b(d):f.trigger("result",d&&[d.data,d.value])}var b=arguments.length>1?arguments[1]:null;a.each(q(f.val()),function(a,b){w(b,c,c)})}).bind("flushCache",function(){i.flush()}).bind("setOptions",function(){a.extend(!0,c,arguments[1]),"data"in arguments[1]&&i.populate()}).bind("unautocomplete",function(){m.unbind(),f.unbind(),a(b.form).unbind(".autocomplete")})},a.Autocompleter.defaults={inputClass:"ac_input",resultsClass:"ac_results",loadingClass:"ac_loading",minChars:1,delay:400,matchCase:!1,matchSubset:!0,matchContains:!1,cacheLength:100,max:1e3,mustMatch:!1,extraParams:{},selectFirst:!0,formatItem:function(a){return a[0]},formatMatch:null,autoFill:!1,width:0,multiple:!1,multipleSeparator:" ",inputFocus:!0,clickFire:!1,highlight:function(a,b){return a.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)("+b.replace(/([\^\$\(\)\[\]\{\}\*\.\+\?\|\\])/gi,"\\$1")+")(?![^<>]*>)(?![^&;]+;)","gi"),"<strong>$1</strong>")},scroll:!0,scrollHeight:180,scrollJumpPosition:!0},a.Autocompleter.Cache=function(b){function e(a,c){b.matchCase||(a=a.toLowerCase());var d=a.indexOf(c);return b.matchContains=="word"&&(d=a.toLowerCase().search("\\b"+c.toLowerCase())),d==-1?!1:d==0||b.matchContains}function f(a,e){d>b.cacheLength&&h(),c[a]||d++,c[a]=e}function g(){if(!b.data)return!1;var c={},d=0;b.url||(b.cacheLength=1),c[""]=[];for(var e=0,g=b.data.length;e<g;e++){var h=b.data[e];h=typeof h=="string"?[h]:h;var i=b.formatMatch(h,e+1,b.data.length);if(i===!1)continue;var j=i.charAt(0).toLowerCase();c[j]||(c[j]=[]);var k={value:i,data:h,result:b.formatResult&&b.formatResult(h)||i};c[j].push(k),d++<b.max&&c[""].push(k)}a.each(c,function(a,c){b.cacheLength++,f(a,c)})}function h(){c={},d=0}var c={},d=0;return setTimeout(g,25),{flush:h,add:f,populate:g,load:function(f){if(!b.cacheLength||!d)return null;if(!b.url&&b.matchContains){var g=[];for(var h in c)if(h.length>0){var i=c[h];a.each(i,function(a,b){e(b.value,f)&&g.push(b)})}return g}if(c[f])return c[f];if(b.matchSubset)for(var j=f.length-1;j>=b.minChars;j--){var i=c[f.substr(0,j)];if(i){var g=[];return a.each(i,function(a,b){e(b.value,f)&&(g[g.length]=b)}),g}}return null}}},a.Autocompleter.Select=function(b,c,d,e){function n(){if(!k)return;l=a("<div/>").hide().addClass(b.resultsClass).css("position","absolute").appendTo(document.body).hover(function(b){a(this).is(":visible")&&c.focus(),e.mouseDownOnSelect=!1}),m=a("<ul/>").appendTo(l).mouseover(function(b){o(b).nodeName&&o(b).nodeName.toUpperCase()=="LI"&&(h=a("li",m).removeClass(f.ACTIVE).index(o(b)),a(o(b)).addClass(f.ACTIVE))}).click(function(e){return a(o(e)).addClass(f.ACTIVE),d(),b.inputFocus&&c.focus(),!1}).mousedown(function(){e.mouseDownOnSelect=!0}).mouseup(function(){e.mouseDownOnSelect=!1}),b.width>0&&l.css("width",b.width),k=!1}function o(a){var b=a.target;while(b&&b.tagName!="LI")b=b.parentNode;return b?b:[]}function p(a){g.slice(h,h+1).removeClass(f.ACTIVE),q(a);var c=g.slice(h,h+1).addClass(f.ACTIVE);if(b.scroll){var d=0;g.slice(0,h).each(function(){d+=this.offsetHeight}),d+c[0].offsetHeight-m.scrollTop()>m[0].clientHeight?m.scrollTop(d+c[0].offsetHeight-m.innerHeight()):d<m.scrollTop()&&m.scrollTop(d)}}function q(a){if(b.scrollJumpPosition||!b.scrollJumpPosition&&!(a<0&&h==0||a>0&&h==g.size()-1))h+=a,h<0?h=g.size()-1:h>=g.size()&&(h=0)}function r(a){return b.max&&b.max<a?b.max:a}function s(){m.empty();var c=r(i.length);for(var d=0;d<c;d++){if(!i[d])continue;var e=b.formatItem(i[d].data,d+1,c,i[d].value,j);if(e===!1)continue;var k=a("<li/>").html(b.highlight(e,j)).addClass(d%2==0?"ac_even":"ac_odd").appendTo(m)[0];a.data(k,"ac_data",i[d])}g=m.find("li"),b.selectFirst&&(g.slice(0,1).addClass(f.ACTIVE),h=0),a.fn.bgiframe&&m.bgiframe()}var f={ACTIVE:"ac_over"},g,h=-1,i,j="",k=!0,l,m;return{display:function(a,b){n(),i=a,j=b,s()},next:function(){p(1)},prev:function(){p(-1)},pageUp:function(){h!=0&&h-8<0?p(-h):p(-8)},pageDown:function(){h!=g.size()-1&&h+8>g.size()?p(g.size()-1-h):p(8)},hide:function(){l&&l.hide(),g&&g.removeClass(f.ACTIVE),h=-1},visible:function(){return l&&l.is(":visible")},current:function(){return this.visible()&&(g.filter("."+f.ACTIVE)[0]||b.selectFirst&&g[0])},show:function(){var d=a(c).offset();l.css({width:typeof b.width=="string"||b.width>0?b.width:a(c).width(),top:d.top+c.offsetHeight,left:d.left}).show();if(b.scroll){m.scrollTop(0),m.css({maxHeight:b.scrollHeight,overflow:"auto"});if(a.browser.msie&&typeof document.body.style.maxHeight=="undefined"){var e=0;g.each(function(){e+=this.offsetHeight});var f=e>b.scrollHeight;m.css("height",f?b.scrollHeight:e),f||g.width(m.width()-parseInt(g.css("padding-left"))-parseInt(g.css("padding-right")))}}},selected:function(){var b=g&&g.filter("."+f.ACTIVE).removeClass(f.ACTIVE);return b&&b.length&&a.data(b[0],"ac_data")},emptyList:function(){m&&m.empty()},unbind:function(){l&&l.remove()}}},a.fn.selection=function(a,b){if(a!==undefined)return this.each(function(){if(this.createTextRange){var c=this.createTextRange();b===undefined||a==b?(c.move("character",a),c.select()):(c.collapse(!0),c.moveStart("character",a),c.moveEnd("character",b),c.select())}else this.setSelectionRange?this.setSelectionRange(a,b):this.selectionStart&&(this.selectionStart=a,this.selectionEnd=b)});var c=this[0];if(c.createTextRange){var d=document.selection.createRange(),e=c.value,f="<->",g=d.text.length;d.text=f;var h=c.value.indexOf(f);return c.value=e,this.selection(h,h+g),{start:h,end:h+g}}if(c.selectionStart!==undefined)return{start:c.selectionStart,end:c.selectionEnd}}})(jQuery);