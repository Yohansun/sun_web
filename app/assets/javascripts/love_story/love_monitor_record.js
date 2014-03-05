/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$(function() {
    init_monitor_link_click();
});

function newTriggerEBConversion(object, id) {
    var re = /#\w/;
    mmConversionTag(id, object, $(object).attr('target') || '_self', $(object).attr('href'));
    return re.test($(object).attr('href')) ||   ($(object).prop("tagName") !=='A');
};

function init_monitor_link_click() {
    // 为爱刷新_2首页_分享爱的故事
    $('#love_monitor_link_436277_nologin').click(function() {
        if (confirm("登录网站后才能分享爱的故事,是否现在登录?")) {
            return newTriggerEBConversion(this, 436277);
        }else{
        return false;
        };
    });
    // 为爱刷新_2首页_分享爱的故事
    $('#love_monitor_link_436277_login').click(function() {
        return newTriggerEBConversion(this, 436277);
    });
    // 为爱刷新_3首页_上传设计作品
    $('#love_monitor_link_436278_nologin').click(function() {
        if (confirm("登录网站后才能上传设计作品,是否现在登录?")) {
            return newTriggerEBConversion(this, 436278);
        }else{
        return false;
        };
    });
    // 为爱刷新_3首页_上传设计作品
    $('#love_monitor_link_436278_login').click(function() {
        return newTriggerEBConversion(this, 436278);
    });
    // 为爱刷新_4首页_登陆
    $('#love_monitor_link_436279').click(function() {
        return newTriggerEBConversion(this, 436279);
    });
    // 为爱刷新_5首页_注册
    $('#love_monitor_link_436280').click(function() {
        return newTriggerEBConversion(this, 436280);
    });
    // 为爱刷新_7爱的故事_定制我的私人设计师
    $('.love_monitor_link_436282 > map[name=story_kv] area').click(function() {
        return newTriggerEBConversion(this, 436282);
    });
    // 为爱刷新_8爱的故事_分享爱的故事
    $('#love_monitor_link_436283_nologin').click(function() {
        if (confirm("登录网站后才能分享爱的故事,是否现在登录?")) {
        return newTriggerEBConversion(this, 436283);
        }else{
        return false;
        };
    });
    // 为爱刷新_8爱的故事_分享爱的故事
    $('#love_monitor_link_436283_login').click(function() {
        return newTriggerEBConversion(this, 436283);
    });
    // 为爱刷新_10发布我的故事
    $('#love_monitor_link_436285').click(function() {
        return newTriggerEBConversion(this, 436285);
    });
    // 为爱刷新_13成功上传页_定制我的私人设计师
    $('.love_monitor_link_436288').click(function() {
        return newTriggerEBConversion(this, 436288);
    });
};
