$(function(){function o(e){if(e==s)return;e>i-1?e=0:e<0&&(e=i-1),t.eq(e).css("z-index",12).fadeIn("fast"),t.eq(s<0?e+1:s).css("z-index",11).fadeOut("fast"),s=e}var e=$("div.galleryN"),t=e.find("li"),n=e.find("span.moveleft"),r=e.find("span.moveright"),i=t.size();i<2&&(n.hide(),r.hide());var s=-1;t.filter(function(e){return e}).hide(),n.click(function(){o(s-1)}),r.click(function(){o(s+1)}),o(0)});