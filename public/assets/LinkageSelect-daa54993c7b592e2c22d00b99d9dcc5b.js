/**
 * jQuery多级联动菜单
 *
 * Author:	ZhouFan <happyeddie@gmail.com>
 *
 */
function LinkageSelect(e){function i(e,u,a){var f=t.length?t[t.length-1].key+","+t[t.length-1].value:r.root;t.push({element:e,key:f,value:u});var l=0;for(var c in n)l++;for(var h in t)if(t[h].element==e)var p=parseInt(h);for(var h in t)h<p&&t[h].element.change(function(){s(e,undefined,undefined,a)});p>0&&t[p-1].element.change(function(){s(e,t[p].key,undefined,a)}),e.change(function(){var n=t[p-1]?t[p].key+","+$(this).val():"0,"+$(this).val();typeof t[p+1]!="undefined"&&(t[p+1].key=n),r.field_name&&$(r.field_name).val($(this).val()),r.auto&&typeof t[p+1]=="undefined"&&o(n,function(n,r){if(r){var o=$("<select></select>");e.after(o),i(o,""),s(t[p+1].element,n,r,a)}})}),s(e,f,u,a)}function s(e,t,n,i){e.empty(),e.append('<option value="">'+i+"</option>");var u=o(t,function(){s(e,t,n)});if(!u)return r.auto&&e.hide(),!1;e.show();var a=1,f=0;for(var l in u){var c=u[l],h="";l==n&&(f=a,h='selected="selected"');var p=$('<option value="'+l+'" '+h+">"+c+"</option>");e.append(p),a++}e[0]&&(setTimeout(function(){e[0].options[f].selected=!0},0),e[0].selectedIndex=0,e.attr("selectedIndex",f)),e.width(e.width())}function o(e,t){if(typeof e=="undefined")return null;if(e[e.length-1]==",")return null;if(typeof n[e]=="undefined"){var i=0;for(var s in n){i++;break}r.ajax?$.getJSON(r.ajax,{key:e},function(r){n[e]=r,t(e,r)}):r.file&&i==0&&$.getJSON(r.file,function(r){n=r,t(e,r)})}return n[e]}function u(e){return typeof e=="string"?$(e):e}var t=new Array,n={},r={data:{},file:null,root:"0",ajax:null,timeout:30,method:"post",field_name:null,auto:!1};return e&&jQuery.extend(r,e),n=r.data,{bind:function(e,t,n){typeof n=="undefined"&&(n="请选择"),typeof e!="object"&&(e=u(e)),t=t?t:"",i(e,t,n)}}};