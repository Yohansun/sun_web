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
}
function talking_seo() {
    CClicki[10008]._trackEvent({
        type: 1,
        labels: [
            {"按钮名称": "已提交作品-洽谈"}
        ],
        values: [
            {"数量": 1}
        ]
    });
    return newTriggerEBConversion(this, 326832);
};
function init_monitor_link_click() {
    $('#monitor_link_326789').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "首页按钮"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326789);

    });

    $('#monitor_link_326790').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "我要装修"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326790);
    });
    $('#monitor_link_326791').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "我来设计"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326791);
    });

    $('#monitor_link_326792').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "设计作品大比拼"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326792);

    });

    $('.fashion_model').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "时尚榜样"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326793);
    });

    $('#monitor_link_337428').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "因爱之名-王丽坤"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 337428);
    });

    $('#monitor_link_337621').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "因爱之名-Edward Davinson"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 337621);
    });

    $('#monitor_link_326794').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "时尚榜样-崔睿"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326794);
    });

    $('#monitor_link_341517').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "因爱之名-精彩视频"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 341517);
    });

    $('#monitor_link_346296').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "因爱之名-王丽坤-观看视频"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 346296);
    });

    $('#monitor_link_326795').click(function() {
        try {
            CClicki[10008]._trackEvent({
                type: 1,
                labels: [
                    {"按钮名称": "活动章程及说明"}
                ],
                values: [
                    {"数量": 1}
                ]
            });
            return newTriggerEBConversion(this, 326795);
        } catch (e) {

        }
    });

    $('#monitor_link_326796').click(function() {
        try {
            CClicki[10008]._trackEvent({
                type: 1,
                labels: [
                    {"按钮名称": "活动章程及说明-活动规划"}
                ],
                values: [
                    {"数量": 1}
                ]
            });
            return newTriggerEBConversion(this, 326796);
        } catch (e) {

        }
    });
    $('#monitor_link_326797').click(function() {
        try {
            CClicki[10008]._trackEvent({
                type: 1,
                labels: [
                    {"按钮名称": "活动章程及说明-活动内容"}
                ],
                values: [
                    {"数量": 1}
                ]
            });
            return newTriggerEBConversion(this, 326797);
        } catch (e) {

        }
    });
    $('#monitor_link_326798').click(function() {
        try {
            CClicki[10008]._trackEvent({
                type: 1,
                labels: [
                    {"按钮名称": "活动章程及说明-活动奖项"}
                ],
                values: [
                    {"数量": 1}
                ]
            });
            return newTriggerEBConversion(this, 326798);
        } catch (e) {

        }
    });

    $('#monitor_link_326799').click(function() {
        try {
            CClicki[10008]._trackEvent({
                type: 1,
                labels: [
                    {"按钮名称": "活动章程及说明-评选细则"}
                ],
                values: [
                    {"数量": 1}
                ]
            });
            return newTriggerEBConversion(this, 326799);
        } catch (e) {

        }
    });

    $('#monitor_link_326800').click(function() {
        try {
            CClicki[10008]._trackEvent({
                type: 1,
                labels: [
                    {"按钮名称": "活动章程及说明-评委名单"}
                ],
                values: [
                    {"数量": 1}
                ]
            });

            return newTriggerEBConversion(this, 326800);


        } catch (e) {

        }
    });

    $('#monitor_link_326801').click(function() {
        try {
            CClicki[10008]._trackEvent({
                type: 1,
                labels: [
                    {"按钮名称": "活动章程及说明-活动时间"}
                ],
                values: [
                    {"数量": 1}
                ]
            });
            return newTriggerEBConversion(this, 326801);
        } catch (e) {

        }
    });

    $('#monitor_link_326803').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "注册"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326803);
    });



    $('#user_name_msg_tip').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "右上角系统消息按钮"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326806);
    });


    $('#monitor_link_326807').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "右上角查看我的房型图"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326807);
    });


    $('#monitor_link_326808').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "右上角退出按钮"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        mmConversionTag(326808,this);

    });

    $('#monitor_link_326809').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "查看我的活动主页"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326809);
    });

    $('#monitor_link_326810').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "查看我的购买积分"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326810);
    });

    $('#monitor_link_326811').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "去icolor查看更多案例"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326811);
    });

    $('#monitor_link_326812').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "免费声明"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326812);
    });

    $('#monitor_link_326813').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "人人网分享"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326813);
    });

    $('#monitor_link_326814').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "豆瓣分享"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326814);
    });

    $('#monitor_link_326815').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "新浪微博分享"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326815);
    });


    $('#monitor_link_326817').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "Step1_保存下一步"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326817);
    });



    $('#monitor_link_326819').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "Step2_搜房网按钮"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326819);
    });


    $('#monitor_link_326820').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "Step2_保存下一步"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326820);
    });


    $('.design_compete .list_img_a').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "作品图"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326822);
    });

    $('.stories  .list_img_a').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "房型图"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326824);
    });


    $('#monitor_link_326825').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "我想设计"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        triggerEBConversion(326825);
    });

    $('#monitor_link_326826').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "上传设计"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326826);
    });

    $('#monitor_link_326828').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "人人网分享"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326828);
    });

    $('#monitor_link_326829').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "豆瓣分享"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326829);
    });

    $('#monitor_link_326830').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "开心网分享"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326830);
    });

    $('#monitor_link_326831').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "新浪微博分享"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326831);
    });

    // $('.icon_talk').click(function() {
    //     CClicki[10008]._trackEvent({
    //         type: 1,
    //         labels: [
    //             {"按钮名称": "已提交作品-洽谈"}
    //         ],
    //         values: [
    //             {"数量": 1}
    //         ]
    //     });
    //     return newTriggerEBConversion(this, 326832);
    // });

    $('.upload_contract').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "已提交作品-上传合同"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326833);
    });

    $('#monitor_link_326834').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "下载房型图"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326834);
    });

    $('#monitor_link_326835').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "评比标准"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326835);
    });

    $('#monitor_link_326836').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "免费咨询"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326836);
    });


    $('#monitor_link_326837').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "人人网分享"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326837);
    });


    $('#monitor_link_326838').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "豆瓣分享"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326838);
    });


    $('#monitor_link_326839').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "新浪微博分享"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326839);
    });


    $('#monitor_link_326840').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "QQ空间分享"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326840);
    });

    $('#monitor_link_326841').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "开心网分享"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326841);
    });

    $('#monitor_link_326842').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "附近专卖店"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326842);
    });


    $('#monitor_link_326843').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "购买立邦产品"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326843);
    });

    $('#monitor_link_326844').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "用户房型图按钮"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326844);
    });

    $('#monitor_link_326845').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "查看更多家装需求"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326845);
    });


    $('#monitor_link_326846').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "积分兑换-点击兑换"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326846);
    });

    $('#monitor_link_326847').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "积分兑换-产品购买积分兑换规则"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326847);
    });


    $('#monitor_link_326848').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "个人活动主页按钮"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326848);
    });

    //not used in upload_contract show
    $('#monitor_link_326849').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "选择合同文件"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326849);
    });


    $('#monitor_link_326850').click(function() {
        CClicki[10008]._trackEvent({
            type: 1,
            labels: [
                {"按钮名称": "确认提交"}
            ],
            values: [
                {"数量": 1}
            ]
        });
        return newTriggerEBConversion(this, 326850);
    });
}
;
