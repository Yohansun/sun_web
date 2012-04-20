# -*- encoding : utf-8 -*-

MagicContent.extra_content_options = {'大师殿堂' => 'MasterProfile', '一周装修小贴士' => 'WeeklyTip','大师作品' => 'MasterDesign',
                                      '色彩搭配' => 'ColorDesign',  '每周之星' => 'WeeklyStar'}

MagicContent.extra_settings = [
    {:tag => 'text_field_tag', :key => 'promote_designers', :label => '片区快查推荐设计师(KV)'},
    {:tag => 'text_field_tag', :key => 'recommend_designers', :label => '片区快查推荐设计师(列表)'},
]

MagicContent.extra_menu_items = [
    {name: '微博抓取管理', url: :weibo_items_path },
    {name: '在线客服咨询回复', url: :site_messages_path },
    {name: '在线配色咨询回复', url: :mix_colors_path },
    {name: '家装咨询回复', url: :faqs_path}
]

Rails.application.config.to_prepare do
  Post.class_eval do
    has_many :comments, :as => :commentable
  end
end