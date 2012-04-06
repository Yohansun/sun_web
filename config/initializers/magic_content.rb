# -*- encoding : utf-8 -*-

MagicContent.extra_content_options = {'大师殿堂' => 'MasterProfile', '一周装修小贴士' => 'WeeklyTip','大师作品' => 'MasterDesign', '色彩搭配' => 'ColorDesign'}

Post.class_eval do
  has_many :comments, :as => :commentable
end