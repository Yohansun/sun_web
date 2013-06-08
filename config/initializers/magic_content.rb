#encoding: utf-8

# -*- encoding : utf-8 -*-

MagicContent.extra_content_options = {'大师殿堂' => 'MasterProfile', '一周装修小贴士' => 'WeeklyTip','大师作品' => 'MasterDesign',
                                      '色彩搭配' => 'ColorDesign',  '每周之星' => 'WeeklyStar', '礼从天降' => 'Gifts'}

MagicContent.extra_settings = [
    {:tag => 'text_field_tag', :key => 'promote_designers', :label => '片区快查推荐设计师或家装公司(KV)'},
   # {:tag => 'text_field_tag', :key => 'recommend_designers', :label => '片区快查推荐设计师或家装公司(列表)'},
    {:tag => 'text_field_tag', :key => 'weibo_keywords', :label => '微博关键字'},
    {:tag => 'text_field_tag', :key => 'recommend_designs', :label => '推荐作品'},
    {:tag => 'text_field_tag', :key => 'statistical_time', :label => "iColor经销商报表统计截至日期(单位:日)"},
    {:tag => 'text_area_tag',  :key => 'kv_of_home_index', :label => "首页KV自定义代码"},
    {:tag => 'text_field_tag', :key => 'event_random_range', :label => "活动中奖概率基数(整数值)"},
    {:tag => 'text_field_tag', :key => 'event_award_count', :label => "活动奖品数量"},
    {:tag => 'text_field_tag', :key => 'award_at', :label => "活动：第几次中小罐漆"},
    {:tag => 'text_field_tag', :key => 'color_tag', :label => "图库首页热门搜索色系"}
]

MagicContent.extra_menu_items = [
    {name: '套图管理', url: :suit_images_path},
    {name: '图库管理', url: :image_libraries_path},
    {name: '微博抓取管理', url: :weibo_items_path},
    {name: '在线客服咨询回复', url: :site_messages_path},
    {name: '在线配色咨询回复', url: :mix_colors_path},
    {name: '家装咨询回复', url: :faqs_path},
    {name: '数据统计', url: :stat_path},
    {name: '报表下载', url: :report_export_path},
    {name: 'iColor工具管理', url: :tools_path},
    {name: 'iColor个人主页皮肤管理', url: :skins_path},
    {name: 'iColor我型我秀', url: :my_show_settings_path},
    {name: '硬性广告数据统计', url: :hard_sells_path},
 
]

MagicContent.baicheng_menu_items = [
 
    {name: '百城统计', url: :baicheng_daily_report_path},
]

Rails.application.config.to_prepare do
  Post.class_eval do
    has_many :comments, :as => :commentable
  end
end