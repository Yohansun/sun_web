$(function(){var e=$("div.galleryM"),t=e.find("div.list ul");if(t.size()<2)return;var n=t.size(),r=-1,i=function(e){if(e==r)return;e>n-1?e=0:e<0&&(e=n-1),t.eq(e).css("zIndex",10).show(),r>-1&&t.eq(r).css("zIndex",9).hide(),r=e};i(0),e.find(".moveleft").click(function(){i(r+1)}),e.find(".moveright").click(function(){i(r-1)})});