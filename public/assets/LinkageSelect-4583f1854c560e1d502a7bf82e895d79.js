/**
 * jQuery多级联动菜单
 * 
 * Author:	ZhouFan <happyeddie@gmail.com>
 * 
 */
function LinkageSelect(a){function e(a,h){var i=b.length?b[b.length-1].key+","+b[b.length-1].value:d.root;b.push({element:a,key:i,value:h});var j=0;for(var k in c)j++;for(var l in b)if(b[l].element==a)var m=parseInt(l);for(var l in b)l<m&&b[l].element.change(function(){f(a)});m>0&&b[m-1].element.change(function(){f(a,b[m].key)}),a.change(function(){var c=b[m-1]?b[m].key+","+$(this).val():"0,"+$(this).val();typeof b[m+1]!="undefined"&&(b[m+1].key=c),d.field_name&&$(d.field_name).val($(this).val()),d.auto&&typeof b[m+1]=="undefined"&&g(c,function(c,d){if(d){var g=$("<select></select>");a.after(g),e(g,""),f(b[m+1].element,c,d)}})}),f(a,i,h)}function f(a,b,c){a.empty(),a.append('<option value="">请选择</option>');var e=g(b,function(){f(a,b,c)});if(!e)return d.auto&&a.hide(),!1;a.show();var h=1,i=0;for(var j in e){var k=e[j],l="";j==c&&(i=h,l='selected="selected"');var m=$('<option value="'+j+'" '+l+">"+k+"</option>");a.append(m),h++}a[0]&&(setTimeout(function(){a[0].options[i].selected=!0},0),a[0].selectedIndex=0,a.attr("selectedIndex",i)),a.width(a.width())}function g(a,b){if(typeof a=="undefined")return null;if(a[a.length-1]==",")return null;if(typeof c[a]=="undefined"){var e=0;for(var f in c){e++;break}d.ajax?$.getJSON(d.ajax,{key:a},function(d){c[a]=d,b(a,d)}):d.file&&e==0&&$.getJSON(d.file,function(d){c=d,b(a,d)})}return c[a]}function h(a){return typeof a=="string"?$(a):a}var b=new Array,c={},d={data:{},file:null,root:"0",ajax:null,timeout:30,method:"post",field_name:null,auto:!1};return a&&jQuery.extend(d,a),c=d.data,{bind:function(a,b){typeof a!="object"&&(a=h(a)),b=b?b:"",e(a,b)}}};