# -*- encoding : utf-8 -*-

MagicContent.extra_content_options = {'大师殿堂' => 'MasterProfile', '一周装修小贴士' => 'WeeklyTip','大师作品' => 'MasterDesign',
                                      '色彩搭配' => 'ColorDesign',  '每周之星' => 'WeeklyStar'}

MagicContent.extra_settings = [
    {:tag => 'text_field_tag', :key => 'promote_designers', :label => '片区快查推荐设计师'},
]

MagicContent.extra_menu_items = [
    {name: '微博抓取管理', url: :weibo_items_path },
]

Rails.application.config.to_prepare do
  Post.class_eval do
    has_many :comments, :as => :commentable
    #Subject.content('Post').each do |s|
    #  if s.slug == "master_topics"
    #    after_save :send_sys_msg
    #    def send_sys_msg
    #      user_display_name = self.user.display_name
    #      user_id           = self.user.id
    #      SysMsg.create(:content    => "亲爱的#{user_display_name}用户，您的评论已成功！",
    #                    :reply_type => "master_topics", :status => SysMsg::Status[0], :reply_name => "icolor客服",
    #                    :user_id    => user_id)
    #    end
    #  end
    #end
  end
end