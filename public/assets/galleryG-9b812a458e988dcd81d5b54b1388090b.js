$(function(){function g(a){if(a==f)return;a>e-1?a=0:a<0&&(a=e-1),b.eq(a).css("z-index",12).fadeIn("fast"),b.eq(f<0?a+1:f).css("z-index",11).fadeOut("fast"),f=a}var a=$("div.galleryG"),b=a.find("li"),c=a.find("span.moveleft"),d=a.find("span.moveright"),e=b.size();e<2&&(c.hide(),d.hide());var f=-1;b.filter(function(a){return a}).hide(),c.click(function(){g(f-1)}),d.click(function(){g(f+1)}),g(0)});