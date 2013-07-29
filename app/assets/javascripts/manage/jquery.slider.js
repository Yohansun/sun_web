/*
 * jQuery slider plugin
 * Author : luck
 * Date   : 2013.7.17
 */

;(function($){
$.fn.slider = function(config){
    return this.each(function(){
        config = $.extend({
            buttons : true,                 // 左右按钮
            pagers : true,                  // 显示翻页
            pagerText : 'number',           // 翻页文本
            auto : true,                    // 自动滚动
            pause : true,                   // 悬浮暂停
            mouse : 'click',                // 触发事件
            duration : 4000,                // 间隔时间
            speed : 800,                    // 滚动速度
            scroll : 1,                     // 滚动个数
            callback : function(index, e){} // 回调函数 参数index:0起头的pager; e:触发滚动源
        }, config);

        var that = $(this),
            bin = that.find('.slider-container'),
            ul = bin.find('ul'),
            li = ul.find('li'),
            pages = Math.ceil(li.length / config.scroll),
            len = bin.width() / li.width(),
            odd = li.length % config.scroll,
            width = li.width() * config.scroll,
            pager = 1,
            pag = '',
            prev = '',
            next = '',
            buttons = '';
        if(pages < 2) return;

        if(config.pagers){
            if(typeof config.pagers !== 'string'){
                var arr = config.pagerText,
                    bool = arr === 'number',
                    pagli = '';
                pag = $('<ul class="slider-pager"><li class="slider-active"><a href="javascript:;">' + (bool ? 1 : arr[0]) + '</a></li>');
                for(var i = 1; i < pages; i ++){
                    pagli += '<li><a href="javascript:;">' + (bool ? (i + 1) : arr[i]) + '</a></li>';
                }
                pag.append(pagli + '</ul>');
            } else {
                pag = that.find(config.pagers);
            }
            pag.on(config.mouse, 'li', function(e){
                play($(this).index() + 1, e);
            });
        }
        if(config.buttons){
            prev = $('<a href="javascript:;" class="slider-prev">prev</a>');
            next = $('<a href="javascript:;" class="slider-next">next</a>');
            buttons = prev.add(next);
            prev.click(function(e){
                play(pager - 1, e);
            });
            next.click(function(e){
                play(pager + 1, e);
            });
        }
        that.append(config.pagers === true ? pag.add(buttons) : buttons);
        if(odd){
            for(var i = 0; i < len - odd; i ++){
                ul.append('<li></li>');
            }
        }
        for(var i = 0; i < len; i ++){
            li.eq(i).clone().appendTo(ul);
        }

        function play(num, e){
            if(num == 0) {
                ul.css('left', - width * pages).stop(true).animate({
                    'left' : '+=' + width
                }, config.speed, config.easing);
                pager = pages;
            } else if(num > pages + 1){
                ul.css('left', 0).stop(true).animate({
                    'left' : '-=' + width
                }, config.speed, config.easing);
                pager = 2;
            } else {
                ul.stop(true).animate({
                    'left' : (1 - num) * width
                }, config.speed, config.easing);
                pager = num;
            }
            setPager(pager, e);
        }

        function setPager(page, e){
            page = page > pages ? 0 : page - 1;
            config.callback(page, e);
            pag && pag.find('li').eq(page).addClass('slider-active').siblings('li.slider-active').removeClass();
        }

        var sliding;
        if(config.auto){
            that.hover(function(){
                config.pause && clearInterval(sliding);
            }, function(){
                clearInterval(sliding);
                sliding = setInterval(function(){
                    play(pager + 1);
                }, config.duration);
            }).trigger('mouseleave');
        }
    });
};

jQuery.easing['jswing'] = jQuery.easing['swing'];

jQuery.extend( jQuery.easing,
{
    def: 'easeOutQuad',
    swing: function (x, t, b, c, d) {
        return jQuery.easing[jQuery.easing.def](x, t, b, c, d);
    },
    easeOutQuad: function (x, t, b, c, d) {
        return -c *(t/=d)*(t-2) + b;
    }
});
}(jQuery));